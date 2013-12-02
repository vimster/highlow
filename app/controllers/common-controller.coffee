config = require '../server-config'

module.exports.init = (app) ->
  app.get '/', (req, res) ->
    res.render 'home'
