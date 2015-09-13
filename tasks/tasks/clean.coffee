path = require('path')
config = require('../config')

module.exports = (grunt) =>

  grunt.config('clean',
    dist: [path.normalize(process.cwd() + '/dist/*')]
  )

  grunt.registerTask 'cleanWorkspace', ->
    grunt.file.mkdir(path.normalize(process.cwd() + '/dist'))
    grunt.task.run(['clean'])
