config = require('../config')
chalk = require('chalk')
stripComments = require('strip-comment')

###
  `safe`
  Often you have to check by hand if some debug values are still in source files.
  Now feel nervous when you deploy, keep it easy !
###
module.exports = (grunt) =>

  grunt.registerTask 'safe', =>
    conf = grunt.config.get('safe')

    if not conf
      grunt.log.writeln(chalk.yellow('Task not configured: using default config'))
      conf = {}

    if not conf.files
      conf.files = ['src/**/*.ts']

    files = grunt.file.expand(conf.files)

    # checks can be strings or objects (see README)
    checks = [
      {avoid: 'debugger', ignoreStrings: true}
      'console\\.\\w+'
      'alert\\('
      '192\\.168\\.'
      '127\\.0\\.0\\.1'
      '0\\.0\\.0\\.0'
      'localhost'
    ]

    if conf.checks
      checks = checks.concat(conf.checks)

    for file in files
      data = grunt.file.read(file)

      data = stripComments.js(data)

      lines = data.split('\n')

      for line, n in lines
        for check in checks
          if typeof check is 'string'
            check = {avoid: check}

          if check.exclude and check.exclude.indexOf(file) >= 0
            continue

          str = check.avoid
          if check.ignoreStrings
            # ignore when it's in between quotes: http://stackoverflow.com/a/6464500
            str += "(?=([^'\\\\]*(\\\\.|'([^'\\\\]*\\\\.)*[^'\\\\]*'))*[^']*$)"

          regex = new RegExp(str, 'g')
          matches = line.match(regex)

          if matches
            if check.unless isnt matches[0] # also works if check.unless is undefined (e.g. if 'check' is a string or does not contain the 'unless' attribute)
              throw new Error(file + ' matches "' + check.avoid + '" at line ' + (n+1))

    grunt.log.writeln(chalk.green('>>'), chalk.cyan(files.length) + ' source files checked against ' + chalk.cyan(checks.length) + ' checks')
