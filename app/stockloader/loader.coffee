http = require 'http'
moment = require 'moment'
portfolio = require '../portfolio/portfolio'


DAXES = ["ADS.DE", "ALV.DE", "BAS.DE", "BAYN.DE", "BEI.DE", "BMW.DE", "CBK.DE", "CON.DE", "DAI.DE", "DB1.DE", "DBK.DE", "DPW.DE", "DTE.DE", "EOAN.DE", "FME.DE", "FRE.DE", "HEI.DE", "HEN3.DE", "IFX.DE", "LHA.DE", "LIN.DE", "LXS.DE", "MRK.DE", "MUV2.DE", "RWE.DE", "SAP.DE", "SDF.DE", "SIE.DE", "TKA.DE", "VOW3.DE"];


module.exports =
  getAllStocks: ->
    http.get host: 'http://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote?format=json', (res) ->
      console.log res

  getStockInfo: (symbol, days, callback) ->
    host = 'query.yahooapis.com'
    url = '/v1/public/yql'
    start = moment().subtract('days', days).format 'YYYY-MM-DD'
    stop = moment().format "YYYY-MM-DD"
    data = encodeURIComponent('select * from yahoo.finance.historicaldata where symbol in ("' + symbol + '") and startDate = "' + start + '" and endDate = "' + stop + '"');
    http.get host: host, path: url + '?q=' + data + '&env=http%3A%2F%2Fdatatables.org%2Falltables.env&format=json', (res) ->
      body = ''
      res.on 'data', (chunk) ->
        body += chunk
      res.on 'end', ->
        res = JSON.parse(body)
        callback res.query.results
