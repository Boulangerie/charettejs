config = require('../config')
chalk = require('chalk')

module.exports = (grunt) ->

  # copied from grunt-html2js
  # https://github.com/karlgoldstein/grunt-html2js/blob/master/tasks/html2js.js#L17
  escapeContent = (content, quoteChar) ->
    bsRegexp = new RegExp('\\\\', 'g')
    quoteRegexp = new RegExp('\\' + quoteChar, 'g')
    nlReplace = '\\n' + quoteChar + ' +\n' + quoteChar # replace new lines (\n)
    return content.replace(bsRegexp, '\\\\').replace(quoteRegexp, '\\' + quoteChar).replace(/\r?\n/g, nlReplace)

  grunt.registerTask('template', () ->
    conf = grunt.config.get('template')

    if not conf
      grunt.log.writeln(chalk.yellow('Task not configured: using default config'))
      conf = {}

    if not conf.files
      conf.files = ['dist/' + grunt.config.get('teads.distName') + '.js']

    if conf.src
      grunt.log.writeln(chalk.yellow('"src" is deprecated: the task will lookup "src/template/*.*" in each teads package'))

    currentDir = process.cwd()

    # expose method "template" in templates, e.g. <%= include('src/template/menu.html') %>
    grunt.config('include', (filename) ->
      return grunt.file.read(currentDir + '/' + filename)
    )

    tpl = {}
    count = 0

    fetch = (path) ->
      try
        pkg = grunt.file.readJSON(path + '/package.json')
      catch e
        return # no package.json because we might be in a sub dev dependencie, thus not having the node module downloaded
      # merge dependencies and devDependencies:
      deps = pkg.dependencies || {}
      for k, v of pkg.devDependencies
        deps[k] = v
      for dep of deps
        if dep.indexOf('teads') is 0
          fetch(path + '/node_modules/' + dep)

      currentDir = path

      src = grunt.file.expand(path + '/src/template/*.*')

      for file in src
        matches = file.match(/\/(\w+)\.(\w+)$/)
        name = matches[1]
        type = matches[2]

        if not tpl[type]
          tpl[type] = {}

        data = grunt.file.read file
        content = grunt.template.process data # process template variables (e.g. pkg.name, pkg.version)

        if type not in ['js', 'json']
          content = escapeContent content, "'" # html2js

        tpl[type][name] = content
        count++

    fetch(process.cwd()) # start from root project

    grunt.log.writeln('Found ' + chalk.cyan(count) + ' templates')

    # make the <%= tpl.* %> variables for use in source code
    grunt.config('tpl', tpl)

    files = grunt.file.expand(conf.files)

    for file in files
      # then process final javascript files to inject JSified templates and other variables

      data = grunt.file.read(file)
      data = grunt.template.process(data) # process template variables (e.g. tpl.json.data, tpl.html.index, pkg.version)

      grunt.file.write(file, data)
      grunt.log.writeln('File ' + chalk.cyan(file) + ' processed')

  )
