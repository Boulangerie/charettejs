config = require('../config')

module.exports = (grunt) ->

  grunt.config('plato',
    format:
      files:
        'reports/plato': ['src/**/*.js']
  )