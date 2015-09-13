config = require('../config')

module.exports = (grunt) =>

  grunt.config('asciify',
    title:
      text: grunt.config.get('charette.name') || grunt.config.get('pkg.name') || 'Nerd'
      options:
        font: 'univers'
        log: true
  )
