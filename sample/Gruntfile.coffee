module.exports =  (grunt) ->

  grunt.config('charette',
    name: 'CharetteJS',
    distName: 'myoutput'
  )

  # Initialize CharetteJS
  grunt.loadNpmTasks('charettejs')

  grunt.config.merge
    build:
      after: ['uglify']
    karma:
      options:
        files: [__dirname + '/test/unit/main.spec.ts']

