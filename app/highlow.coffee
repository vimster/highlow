http = require 'http'

getAllStocks = ->
  http.get host: 'http://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote?format=json', (res) ->
    console.log res

getAllStocks()
