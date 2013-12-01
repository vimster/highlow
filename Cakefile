fs = require 'fs'
{spawn, exec} = require 'child_process'
which = require 'which'

task 'start', 'start', ->
  invoke 'watch'
  platform = process.platform
  invoke 'build-tree'
  cmd = which.sync 'nodemon'
  nodemon = spawn cmd, ["--exec", "coffee", "server.coffee", "-w", "app", "-w", "app/controllers", "-w", "app/dao", "-w", "app/services",  "-w", "app/helper",  "-w", "app/languages", ""], stdio: 'inherit'
  log 'Watching js files and running server', green
