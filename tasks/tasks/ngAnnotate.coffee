config = require('../config')

module.exports = (grunt) ->

  grunt.config('ngAnnotate',
    compile:
      files:
        process.cwd() + '/dist/<%= charette.distName %>.js': process.cwd() + '/dist/<%= charette.distName %>.js'
  )
