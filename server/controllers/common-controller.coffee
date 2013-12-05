portfolioService = require '/app/portfolio/portfolio'

module.exports.init = (app) ->
  app.get '/', (req, res) ->
    res.render 'home',
      portfolio: portfolioService.getPortfolio()
