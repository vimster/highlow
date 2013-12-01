console.debug "huhusldfjjljk jl lkj geil"

$.get "http://download.finance.yahoo.com/d/quotes.csv?s=$quote&f=snl1c1p2&e=.json"


url = 'http://query.yahooapis.com/v1/public/yql';
startDate = '2012-01-01';
endDate = '2012-01-08';
data = encodeURIComponent('select * from yahoo.finance.historicaldata where symbol in ("YHOO","AAPL","GOOG","MSFT") and startDate = "' + startDate + '" and endDate = "' + endDate + '"');
$.getJSON url, 'q=' + data + "&env=http%3A%2F%2Fdatatables.org%2Falltables.env&format=json", (result) ->
  console.debug result
