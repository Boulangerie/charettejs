module.exports = (grunt) ->

  grunt.config('tslint',
    base:
      files:
        src: ['src/**/*.ts']
      options:
        configuration:
          # Doc: https://github.com/palantir/tslint
          # All-rules example: https://github.com/palantir/tslint/blob/master/docs/sample.tslint.json
          rules:
            'class-name': true
            'curly': true
            'eofline': true
            'indent': [
              true
              2
            ]
            'member-ordering': [
              true
              'public-before-private'
              'static-before-instance'
              'variables-before-functions'
            ],
            #'no-any': true
            'no-bitwise': true
            'no-console': true
            'no-debugger': true
            'no-duplicate-key': true
            #'no-duplicate-variable': true
            'no-eval': true
            'no-string-literal': true
            'no-trailing-whitespace': true
            'no-unreachable': true
            'no-unused-expression': true
            'no-unused-variable': true
            'no-use-before-declare': true
            'quotemark': [
              true
              'single'
            ]
            'radix': true
            'triple-equals': true
            'variable-name': true
            'whitespace': [
              true
              'check-branch'
              'check-decl'
              'check-operator'
              'check-separator'
              'check-type'
            ]
  )
