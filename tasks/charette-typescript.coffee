charetteTasks = require('./tasks')
chalk = require('chalk')

###
  This file is the entrypoint of this package.
  It'll launched by the initialization of `charettejs` in the parent `Gruntfile`
###
module.exports = (grunt) =>

  grunt.log.writeln(chalk.underline('Bootstrap Charette JS for typescript') + "\n")

  charetteTasks.init(grunt)

  grunt.log.writeln(chalk.dim.green('>>') + ' Charette JS for TypeScript ' + chalk.dim.cyan('initialized'))
