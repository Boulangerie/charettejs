###
  This Gruntfile is used to build/test/bump this package
  No usage in package which use it
###

module.exports = (grunt) ->

  # Initialize some global package
  require('load-grunt-tasks')(grunt)
  require('time-grunt')(grunt)

  grunt.initConfig
    bump:
      options:
        autoWatch: true
        browsers: ['PhantomJS']
        files: ['test/unit/**/*.spec.ts']
        frameworks: ['jasmine']
        plugins: [
          'karma-jasmine',
          'karma-phantomjs-launcher',
          'karma-typescript-preprocessor'
        ]
        preprocessors:
          'test/unit/**/*.spec.ts': ['typescript']
        typescriptPreprocessor:
          options:
            target: 'es3'
      continuous:
        options:
          singleRun: false
      unit:
        options:
          singleRun: true

    shell:
      test:
        command: [
          'npm link'
          'cd sample'
          'npm link charette-typescript'
          'npm i'
        ].join('&& ')


  grunt.registerTask 'test', ['shell:test', 'karma:continuous']
  grunt.registerTask 'test:unit', ['shell:test', 'shell:test']