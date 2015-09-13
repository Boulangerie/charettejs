config = require('../config')
chalk = require('chalk')
path = require('path')
_ = require('lodash')

###
  Setup ts task to compile typescript files
###
module.exports = (grunt) ->

  # Use to filter sub-package by prefix
  packagePrefix = grunt.config.get('charette.packagePrefix') || ""
  # List of all ts source
  sources = []

  ###
    Recursive method to grab tsconfig and build the full list of required ts files
  ###
  fetch = (currentPath) ->
    try
      pkg = grunt.file.readJSON(path.normalize(currentPath + '/package.json'))
    catch e
      return # no package.json because we might be in a sub dev dependencie, thus not having the node module downloaded

    # merge dependencies and devDependencies
    deps = _.merge({}, pkg.dependencies || {}, pkg.devDependencies || {})
    _.forEach(deps, (dep) =>
      if dep.indexOf(packagePrefix) is 0
        fetch(path.normalize(currentPath + '/node_modules/' + dep))
    )

    # add sources from tsconfig.json
    try
      files = grunt.file.readJSON(currentPath + '/tsconfig.json').files
      _.forEach(files, (file) =>
        if sources.indexOf(file) is -1
          if currentPath is process.cwd() or file.indexOf(grunt.config.get('pkgCharette.name')) >= 0
            sources.push(file)
      )
    catch e
      grunt.log.writeln(chalk.yellow('Warning: no tsconfig.json in ' + currentPath))

  # start from root project
  fetch(process.cwd())

  if sources.length
    grunt.log.writeln(chalk.blue('TypeScript compiler ("ts" task) will use the following sources:'))
    grunt.log.writeln(chalk.yellow(sources.join('\n')))

  grunt.config('ts',
    base:
      src: sources
      out: 'dist/<%= charette.distName %>.js'
      options:
        target: 'es3'
        declaration: true
        fast: 'never'
        compiler: config.charetteNodeModules + '/typescript/bin/tsc' # use the version specified in package.json
  )