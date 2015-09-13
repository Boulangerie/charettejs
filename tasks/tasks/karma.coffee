configFile = require('../config')
_ = require('lodash')

module.exports = (grunt) ->

  ###
  Programatic build of karma config
  ###
  config =
    options:
      singleRun: true
    unit:
      configFile: configFile.karmaPath + '/karma-phantom.conf.js'
    browsers:
      configFile: configFile.karmaPath + '/karma-browsers.conf.js'
    continuous:
      configFile: configFile.karmaPath + '/karma-phantom.conf.js'
      singleRun: false

  # Set karma configuration
  grunt.config('karma', config)

  getDirectories = (folder) ->
    fs = require('fs')
    return fs.readdirSync(folder).filter (file) =>
      try
        return fs.statSync(file).isDirectory()
      return true

  # Task used for generate index for CI Jenkins HTML report
  grunt.registerTask('indexCoverage', =>
    directories = getDirectories('reports/coverage/')
    grunt.file.copy(config.karmaPath + 'test/coverage_index.tpl.html', 'reports/coverage/index.html',
      process: ( contents, path ) =>
        return grunt.template.process contents,
          data:
            testing: directories
    )
  )

  # Define regular test tasks
  grunt.registerTask 'test', ['karma:continuous']
  grunt.registerTask 'test:unit', ['karma:unit']
  grunt.registerTask 'test:browsers', ['karma:browsers']
