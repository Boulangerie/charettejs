path = require('path')
config = require('../config')

###
  `grunt clean` and `grunt cleanWorkspace`
  The project will build ts output in the ./dist folder
  We need to ensure that this folder exists and is empty
  [Github grunt-contrib-clean](https://github.com/gruntjs/grunt-contrib-clean)
###
module.exports = (grunt) =>

  grunt.config('clean',
    dist: [path.normalize(process.cwd() + '/dist/*')]
  )

  grunt.registerTask 'cleanWorkspace', ->
    grunt.file.mkdir(path.normalize(process.cwd() + '/dist'))
    grunt.task.run(['clean'])
