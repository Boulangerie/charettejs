config = require('./config')
chalk = require('chalk')

module.exports =
  ###
    Will load all locally installed package prefixed by `grunt-`
  ###
  initNPMPackage: (grunt) ->
    if not grunt
      grunt.log.error("initGruntTasks must be run with a grunt instance")
      return

    logs = []
    dependencies = (require(config.charetteNPMConfig).dependencies or [])
    for dep, version of dependencies
      if dep.indexOf('grunt-') is 0
        grunt.loadTasks(config.charetteNodeModules + '/' + dep + '/tasks')
        logs.push(chalk.dim.yellow(dep + '@' + version.replace(/^[\^~]/gi, '')))

    grunt.log.writeln(chalk.green.bold('✔ OK ') + ': NPM Package' + (if logs.length > 1 then 's' else '') + ': ' + logs.join(', '))

  ###
    Initialize all tasks with grunt
  ###
  initGruntTasks: (grunt) ->
    if not grunt
      grunt.log.error("initGruntTasks must be run with a grunt instance")
      return

    # Get all files in tasks folder
    charetteTasks = grunt.file.expand(config.charetteTasks + '/*')
    # Get parent tasks files (process.cwd() to get gruntfile pwd)
    parentTasks = grunt.file.expand(process.cwd() + '/tasks/*')
    # Merge these two lists
    tasks = charetteTasks.concat(parentTasks)

    for taskPath in tasks
      # Require task file
      task = require(taskPath)
      try
        # Init the task with current grunt instance
        task(grunt)
      catch e
        grunt.log.error('error on init ' + taskPath + ': ' + e)

    logs = []
    for task in charetteTasks
      taskName = task.split('/').pop()
      logs.push(chalk.dim.yellow(taskName))
    grunt.log.writeln(chalk.green.bold('✔ OK ') + ': Charette task' + (if logs.length > 1 then 's' else '') + ': ' + logs.join(', '))

    logs = []
    for task in parentTasks
      taskName = task.split('/').pop()
      logs.push(chalk.dim.yellow(taskName))
    grunt.log.writeln(chalk.green.bold('✔ OK ') + ': Parent task' + (if logs.length > 1 then 's' else '') + ' (' + grunt.config.get('pkg.name') + '): ' + logs.join(', '))


  ###
    Init the charettejs package with grunt instance
  ###
  init: (grunt) ->
    @initNPMPackage(grunt)

    # Initialize some global package
    require('load-grunt-tasks')(grunt)
    require('time-grunt')(grunt)

    grunt.log.writeln(chalk.green.bold('✔ OK ') + ': Global package: ' + chalk.dim.yellow('load-grunt-tasks') + ', ' + chalk.dim.yellow('load-grunt-tasks'))

    # Provide grunt pkg config with as content the parent `package.json`
    grunt.config('pkg', grunt.file.readJSON(process.cwd() + '/package.json'))
    # Provide grunt charette config with as content the *charette* file `package.json`
    grunt.config('pkgCharette', grunt.file.readJSON(config.charetteNPMConfig))

    # Initialize tasks coming from charette and parent project
    @initGruntTasks(grunt)
