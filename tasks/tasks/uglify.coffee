config = require('../config')

module.exports = (grunt) =>

  grunt.config('uglify',
    lib:
      files:
        'dist/<%= charette.distName %>.min.js': ['dist/<%= charette.distName %>.js']
  )
