#!/usr/bin/env node

var program = require('commander');
var request = require('request');
var chalk = require('chalk');

program
  .version('0.0.1')
  .usage('[options] <keywords>')
  .option('-o, --owner [name]', 'Filter by the repositories owner')
  .option('-l, --language [language]', 'Filter by the repositories language')
  .option('-f, --full', 'Full output without any styling')
  .parse(process.argv);

if(!program.args.length) {
  program.help();
} else {
  var keywords = program.args;
  var url = 'https://api.github.com/search/repositories?sort=stars&order=desc&q='+keywords;

  if(program.owner) {
    url = url + '+user:' + program.owner;
  }

  if(program.language) {
    url = url + '+language:' + program.language;
  }

  request({
    method: 'GET',
    headers: {
      'User-Agent': 'YourGitHubUsername'
    },
    url: url
  }, function(error, response, body) {

    if (!error && response.statusCode == 200) {
      var body = JSON.parse(body);
      if(program.full) {
        console.log(body);
      } else {
        for(var i = 0; i < body.items.length; i++) {
          console.log(chalk.cyan.bold('Name: ' + body.items[i].name));
          console.log(chalk.magenta.bold('Owner: ' + body.items[i].owner.login));
          console.log(chalk.grey('Desc: ' + body.items[i].description + '\n'));
          console.log(chalk.grey('Clone url: ' + body.items[i].clone_url + '\n'));
        }
        process.exit(0);
      }
      process.exit(0);
    } else if (error) {
      console.log(chalk.red('Error: ' + error));
      process.exit(1);
    }
  });
}