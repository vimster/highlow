http = require 'http'
moment = require 'moment'
portfolio = require '../portfolio/portfolio'

module.exports =
  findSellSignal: ->
    console.debug "sellSignalSearch"

  findBuySignal: ->
    console.debug "buySignalSearch"

  handleResult: (s, result) ->
    quotes = result.quote
    prevHigh = 1000000
    highers = 0
    if quotes[0].High <= quotes[1].High then return
    for q in quotes
      if q.High >= prevHigh then highers++
      prevHigh = q.High
    if highers > quotes.length-3 then signalBuy s

  findStocksOfInterest: ->
    for s in DAXES
      do (s) ->
        getStockInfo s, (result) ->
          handleResult s, result
