config = require '../server-config'
portfolioDao = require '../daos/portfolio-dao'

module.exports.init = (app) ->
  app.get '/', (req, res) ->
    res.render 'home',
      portfolio: portfolioDao.getPortfolio()
