config = require('../config')

module.exports = (grunt) ->

  grunt.config('watch',
    typescript:
      files: ['src/**/*.ts', __dirname + '/../../typescript/*.ts']
      tasks: ['ts', 'tslint', 'template', 'iefix', 'safe']
    template:
      files: ['src/**/*.html']
      tasks: ['ts', 'template', 'iefix']
    less:
      files: ['src/**/*.less']
      tasks: ['less']
  )
