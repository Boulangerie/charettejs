var gruntConfig = require('../tasks/config');

module.exports = function(config, specificOptions) {

  var currentDir = process.cwd();

  var preprocessors = {};
  preprocessors[currentDir + '/test/**/*.ts'] = ['typescript'];

  config.set({
    basePath: '../../..',
    frameworks: ['jasmine', 'sinon'],
    logLevel: config.LOG_INFO,
    logColors: true,
    autoWatch: true,

    browsers: [/* to be defined in child conf */],

    browserDisconnectTimeout: 10000,
    browserDisconnectTolerance: 2,
    browserNoActivityTimeout: 20000,

    port: 5555,

    plugins: [
      'karma-jasmine',
      'karma-sinon',
      'karma-typescript-preprocessor',
      'karma-chrome-launcher',
      'karma-phantomjs-launcher',
      'karma-junit-reporter',
      'karma-spec-reporter',
      'karma-coverage'
    ],

    files: [
      // fixtures
      {pattern: currentDir + '/sample/*', watched: true, served: true, included: false},
      {pattern: currentDir + '/fixture/*', watched: true, served: true, included: false},

      // included files - tests
      {pattern: currentDir + '/test/unit/**/*.spec.ts'},
      {pattern: currentDir + '/src/**/*.ts', included: false}
    ],

    preprocessors: preprocessors,

    reporters: ['progress', 'junit', 'coverage', 'spec'],

    coverageReporter: {
      type: 'cobertura',
      dir: 'reports/cobertura/',
      file : specificOptions.suiteName + 'Cobertura.xml'
    },

    typescriptPreprocessor: {
      // options passed to the typescript compiler
      options: {
        sourceMap: false, // (optional) Generates corresponding .map file.
        target: 'es3', // (optional) Specify ECMAScript target version: 'ES3' (default), or 'ES5'
        noImplicitAny: false, // (optional) Warn on expressions and declarations with an implied 'any' type.
        noResolve: false, // (optional) Skip resolution and preprocessing.
        removeComments: false,
        declaration: false
      },
      // transforming the filenames
      transformPath: function(path) {
        return path.replace(/\.ts$/, '.js');
      }
    },

    junitReporter: {
      outputFile: 'reports/junit/' + specificOptions.suiteName + '.xml',
      suite: specificOptions.suiteName
    }

  });
};
