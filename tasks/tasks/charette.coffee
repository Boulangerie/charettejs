config = require('../config')

module.exports = (grunt) =>

  ###
    Register `build` task
  ###
  grunt.registerTask('build', =>
    # Grab parent build config
    conf = grunt.config.get('build') or {}

    # Default build configuration
    conf.main = conf.main || [
      'asciify'
      'cleanWorkspace'
      'ts'
      'tslint'
      'safe'
    ]

    tasks = [].concat(conf.before || [], conf.main, conf.after || [])

    grunt.task.run(tasks)
  )

  ###
    Register `default` task
  ###
  grunt.registerTask('default', [
    #'test:unit'
    'build'
  ])

  ###
    Register `watch` task
  ###
  grunt.registerTask('watch', ['build', 'watch'])
