fs = require 'fs'
config = require '../server-config'

module.exports =

  readOrCreateFile: (filename) ->
    try file = fs.readFileSync config.DB_PATH + filename, 'utf8'
    catch e then file = fs.openSync config.DB_PATH + filename, 'w'
    file

  getPortfolio: ->
    console.log "get Portfolio"
    fileContent = @readOrCreateFile 'portfolio.txt'
    fileContent.split '\n'
