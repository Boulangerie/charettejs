config = require('../config')

module.exports = (grunt) =>

  grunt.config('bump',
    options:
      files: ['package.json']
      updateConfigs: ['pkg']
      commitMessage: 'Release v%VERSION%'
      commitFiles: ['package.json', 'dist/*']
      tagName: 'v%VERSION%'
      tagMessage: 'Version %VERSION%'
      pushTo: 'origin'
      gitDescribeOptions: '--tags --always --abbrev=1 --dirty=-d'
  )
