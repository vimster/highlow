express = require 'express'
config = require "./server-config"
controller = require "./controllers/common-controller"
consolidate = require 'consolidate'
eco = require 'eco'


app = express()
app.engine 'eco', consolidate.eco
app.set "view engine", 'eco'
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use express.static config.CLIENT_DIR

controller.init app

app.listen config.SERVER_PORT
console.log "Express server started"

