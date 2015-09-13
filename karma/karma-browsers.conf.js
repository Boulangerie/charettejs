var pkg = require(process.cwd() + '/package');
var sharedConfig = require('./karma-common.conf.js');

module.exports = function(config) {

  sharedConfig(config, {
    suiteName: pkg.name
  });

  config.set({
    autoWatch: true,
    browsers: ['Chrome', 'Firefox', 'Safari'],

    plugins: [
      'karma-jasmine',
      'karma-sinon',
      'karma-typescript-preprocessor',
      'karma-chrome-launcher',
      'karma-firefox-launcher',
      'karma-safari-launcher',
      'karma-phantomjs-launcher',
      'karma-junit-reporter',
      'karma-spec-reporter',
      'karma-coverage'
    ],
  });

};
