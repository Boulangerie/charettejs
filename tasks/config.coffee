grunt = require('grunt')

###
  This file will provide configuration for our charette grunt tweaks
###
module.exports = ( =>

  return {
    charetteNodeModules: __dirname + "/../node_modules",
    charetteNPMConfig: __dirname + "/../package.json",
    charetteTasks: __dirname + "/tasks",
    karmaPath: __dirname + "/../karma"
  }

)()
