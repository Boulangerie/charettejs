config = require('../config')

module.exports = (grunt) ->

  grunt.config('watch',
    typescript:
      files: ['src/**/*.ts', __dirname + '/../../typescript/*.ts']
      tasks: ['ts', 'tslint', 'template', 'safe']
    template:
      files: ['src/**/*.html']
      tasks: ['ts', 'template']
    less:
      files: ['src/**/*.less']
      tasks: ['less']
  )
