#!/usr/bin/env node
var optimist = require("optimist"),
    fs = require("fs"),
    util = require('util'),
    exec = require('child_process').exec;

var cmd = optimist.argv._[0]

if (cmd === undefined || cmd.length === 0) {
    console.log("Usage: cb.js <shortcut>");
    process.exit(2);
}

var content = fs.readFileSync(process.env.HOME + "/clibookmark.json");

// reading all commands
commands = JSON.parse(content.toString());

if (cmd !== undefined && commands[cmd] !== undefined) {

    if (commands[cmd].path === "*" || process.cwd() === commands[cmd].path) {
        exec(commands[cmd].cmd,
          function (error, stdout, stderr) {

             if (stdout !== "") {
                 process.stdout.write(stdout);
            }

            if (stderr !== "") {
                process.stderr.write(stderr);
            }

            if (error !== null) {
              process.stderr.write(error);
            }
        });
    } else {
        console.log("This command is only valid in " + commands[cmd].path);
    }
}

