config = require('../config')

###
  `grunt asciify`
  A nerd without an ascii art is not really a nerd !
  Here we are ... Just display the project name in the console.
  [Github grunt-asciify](https://github.com/olizilla/grunt-asciify)
###
module.exports = (grunt) =>

  grunt.config('asciify',
    title:
      text: grunt.config.get('charette.name') || grunt.config.get('pkg.name') || 'Nerd'
      options:
        font: 'univers'
        log: true
  )
