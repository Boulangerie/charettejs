config = require('../config')

module.exports = (grunt) =>

  grunt.config('html2js',
    options:
      base: process.cwd() + '/src'
      indentString: ''
      quoteChar: '\''
      singleModule: true
      htmlmin:
        collapseWhitespace: true
        removeComments: true
    main:
      src: [process.cwd() + '/src/**/*.tpl.html']
      dest: 'build/templates.js'
      module: '<%= pkg.distName %>.templates'
  )
