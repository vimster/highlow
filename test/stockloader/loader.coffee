assert = require "assert"
stockloader = require "../../app/stockloader/loader"

describe 'stockloader', ->
  describe 'getStockInfo', ->
    it 'it should retrieve stock info of single symbol', (done) ->
      newList = stockloader.getStockInfo 'ADS.DE', 7, (data) ->
        assert.ok data.quote.length > 0
        for quote in data.quote
          assert.ok quote.High
          assert.ok quote.Low
        done()
