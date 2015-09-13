config = require('../config')

module.exports = (grunt) ->

  grunt.config('size_report',
    app:
      files:
        list: ['src/**/*']
    dist:
      files:
        list: ['dist/**/*']
  )

  grunt.registerTask 'size', ['size_report:app']
