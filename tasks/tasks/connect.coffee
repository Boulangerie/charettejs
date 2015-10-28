config = require('../config')

module.exports = (grunt) =>

  grunt.config('connect',
    options:
      base: './'
      port: 8001
      hostname: "127.0.0.1"
      open:
        target: "http://127.0.0.1:8001/dist/index.html"
    dev: {}
    prod:
      options:
        keepalive: true
  )
