<img src="https://cloud.githubusercontent.com/assets/449520/9855019/2d5ddbbe-5b0c-11e5-9525-17a5bb15707c.png" width="512" height="256px">

# Charette JS

## How to bootstrap an angularjs app in typescript

```
mkdir awesome-app && cd $_
npm init
npm i --save-dev charettejs
```

`npm i -S charettejs`

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

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

Then you'll be able to override grunt config for any tasks.

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

### How update bower component

```
bower i -S my-component # Install my-component in `bower.json`
bower-installer -p -r   # Copy `main` files into `bower.json`
```

bower-installer has to be install through `npm`

```
npm i -g bower-installer
```

It will update your `bower.json` with new `bower` dependencies AND which files keep into `vendors`folder.

### How update TypeScript definitions

```
tsd install my-component --save
```

tsd must be install through `npm` as global package

```
npm i -g tsd
```

It will grab typescript definitions from [DefinitelyTyped](https://github.com/DefinitelyTyped/tsd) and put definitions to `typings` folder.

## Feature

### CharetteJS options

```
grunt.config('charette', {
  name: 'CharetteJS',  // The lib name
  distName: 'myoutput' // The dist/myoutput.js file
})
```

### CharetteJS grunt tasks

`build`

`watch`

`grunt asciify`
A nerd without an asscii art is not really a nerd !
Here we are ... Just display the project name in the console.
[Github grunt-asciify](https://github.com/olizilla/grunt-asciify)

`grunt bump`
NPM is great! So work with it means publish semver package.
Let use this `grunt-bump`
[Github grunt-bump](https://github.com/vojtajina/grunt-bump)

`grunt clean` and `grunt cleanWorkspace`
The project will build ts output in the ./dist folder
We need to ensure that this folder exists and is empty
[Github grunt-contrib-clean](https://github.com/gruntjs/grunt-contrib-clean)

`gh-pages`
Github allows us to push on gh-pages branch and get a static host for free !
Let's use it :D
[Github gh-pages](https://github.com/tschaub/grunt-gh-pages)

`grunt html2js`
Ok, write HTML in a JS file is ... beurk !
html2js will grab all *.tpl.html files in your /src/ folder and package them in an AngularJS Module !
[Github grunt-html2js](https://github.com/karlgoldstein/grunt-html2js)

`karma`

`ngAnnotate`

`plato`

`safe`
Often you have to check by hand if some debug values are still in source files.
Now feel nervous when you deploy, keep it easy !

`size_report`

`template`

`tslint`

`ts`

`uglify`

`watch`
