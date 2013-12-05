DAXES = ["ADS.DE", "ALV.DE", "BAS.DE", "BAYN.DE", "BEI.DE", "BMW.DE", "CBK.DE", "CON.DE", "DAI.DE", "DB1.DE", "DBK.DE", "DPW.DE", "DTE.DE", "EOAN.DE", "FME.DE", "FRE.DE", "HEI.DE", "HEN3.DE", "IFX.DE", "LHA.DE", "LIN.DE", "LXS.DE", "MRK.DE", "MUV2.DE", "RWE.DE", "SAP.DE", "SDF.DE", "SIE.DE", "TKA.DE", "VOW3.DE"]




getStockInfo = (symbol, callback) ->
  url = 'http://query.yahooapis.com/v1/public/yql';
  start = moment().subtract('days', 7).format 'YYYY-MM-DD'
  stop = moment().format "YYYY-MM-DD"
  data = encodeURIComponent('select * from yahoo.finance.historicaldata where symbol in ("' + symbol + '") and startDate = "' + start + '" and endDate = "' + stop + '"');
  $.getJSON url, 'q=' + data + "&env=http%3A%2F%2Fdatatables.org%2Falltables.env&format=json", (res) ->
    callback res.query.results

signalBuy = (s) ->
  $("body").append s

handleResult = (s, result) ->
  quotes = result.quote
  prevHigh = 1000000
  highers = 0
  if quotes[0].High <= quotes[1].High then return
  for q in quotes
    if q.High >= prevHigh then highers++
    prevHigh = q.High
  if highers > quotes.length-3 then signalBuy s

findStocksOfInterest = ->
  for s in DAXES
    do (s) ->
      getStockInfo s, (result) ->
        handleResult s, result


