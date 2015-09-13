config = require('../config')

###
  `gh-pages`
  Github allows us to push on gh-pages branch and get a static host for free !
  Let's use it :D
  [Github gh-pages](https://github.com/tschaub/grunt-gh-pages)
###
module.exports = (grunt) =>

  grunt.config('gh-pages',
    options:
      message: 'Auto-generated commit for gh-pages'
  )
