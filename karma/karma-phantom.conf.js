var pkg = require(process.cwd() + '/package');
var sharedConfig = require('./karma-common.conf.js');

module.exports = function(config) {

  sharedConfig(config, {
    suiteName: pkg.name
  });

  config.set({
    autoWatch: true,
    browsers: ['PhantomJS'],
  });
};
