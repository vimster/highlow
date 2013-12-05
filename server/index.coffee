express = require 'express'
controller = require "./controllers/common-controller"
consolidate = require 'consolidate'
eco = require 'eco'

app = express()

app.engine 'eco', consolidate.eco
app.set "view engine", 'eco'
app.set 'views', __dirname + '/views'

app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use express.static __dirname + '/public'

controller.init app

app.listen 3000
console.log "Express server started"

