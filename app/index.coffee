express = require 'express'
config = require "./server-config"
consolidate = require 'consolidate'
eco = require 'eco'

app = express()
app.engine 'eco', consolidate.eco
app.set "view engine", 'eco'
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use express.static config.CLIENT_DIR

app.get '/', (req, res) ->
  res.render 'home'

app.listen config.SERVER_PORT
console.log "Express server started"

