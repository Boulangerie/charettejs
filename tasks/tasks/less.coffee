config = require('../config')

module.exports = (grunt) =>

  grunt.config('less',
    dev:
      files:
        'dist/assets/<%= pkg.name %>.css': ['src/**/*.less']
    prod:
      options:
        compress: true
      files:
        "build/<%= pkg.name %>.min.css": "src/**/*.less"
  )
