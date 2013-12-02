fs = require 'fs'
config = require '../server-config'

module.exports =

  readOrCreateFile: (filename) ->
    file = fs.readFileSync config.DB_PATH + filename, 'utf8'
    if not file
      file = fs.writeFileSync config.DB_PATH + filename, '', 'utf8'
    file

  getPortfolio: ->
    console.log "get Portfolio"
    fileContent = @readOrCreateFile 'portfolio.txt'
    fileContent.split '\n'
