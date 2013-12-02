http = require 'http'
portfolioDao = require '../daos/portfolio-dao'

module.exports =

  getAllStocks = ->
    http.get host: 'http://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote?format=json', (res) ->
      console.log res
  getStockInfo = (symbol, callback) ->
    url = 'http://query.yahooapis.com/v1/public/yql';
    start = moment().subtract('days', 7).format 'YYYY-MM-DD'
    stop = moment().format "YYYY-MM-DD"
    data = encodeURIComponent('select * from yahoo.finance.historicaldata where symbol in ("' + symbol + '") and startDate = "' + start + '" and endDate = "' + stop + '"');
    http.get host: url + '?q=' + data + '&env=http%3A%2F%2Fdatatables.org%2Falltables.env&format=json', (res) ->
      callback res.query.results

  findSellSignal: ->
    console.debug "sellSignalSearch"

  findBuySignal: ->
    console.debug "buySignalSearch"
