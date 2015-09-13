<img src="https://cloud.githubusercontent.com/assets/449520/9855019/2d5ddbbe-5b0c-11e5-9525-17a5bb15707c.png" width="256" height="128px">

[![Build Status](https://travis-ci.org/Boulangerie/charettejs.svg?branch=master)](https://travis-ci.org/Boulangerie/charettejs)
[![Gitter Chat](https://badges.gitter.im/mperham/sidekiq.svg)](https://gitter.im/mperham/sidekiq)

# Charette JS

This package will turn *OFF* the hardship to maintain a single workflow architecture !

## How to use it

Install the package :

`npm i -S charettejs`

Then initialize the `charettejs` by adding this line to your `Grunfile` :

```
// Initialize Charette Typescript
grunt.loadNpmTasks('charettejs')
```

You can easily override configuration for *charette* :

```
grunt.config('myTask', {
  target: 'config'
})

// or merge

grunt config.merge({
  task: {
    target: 'config'
  }
})
```

You can find an example in `sample` folder.

## Why

The idea of this project is to grab all default stuff that you need into your sub-projects.
- Grunt tasks
- Configuration files
- NPM Dependencies
- Bower Dependencies
- Helpers that you need + testing
- All usefull stuff used by sub-project

Okay, so why don't use generator ! They do the job ?!
*No* they don't.

### Generators

A generator (like [Yeoman](yeoman.io)) is a tool that helps you to bootstrap new project.
It'll provide all best practices and handsome shortcuts to automate repetitive stuff.

*But* if you work in a `microservice` approach, generator will populate the architecture for the sub-project once.
If you wanna update a version for all your projects, you must apply the update on each one..

## How develop

- Get the repository
- Link `charettejs` package locally

```
cd charettejs
npm link
```

- Go into `./sample` folder

```
cd sample
npm i
```

- You'll be able to run any `grunt` task using the `charettejs` stuff