(function() {
  var DAXES, findStocksOfInterest, getStockInfo, handleResult, highLow, signalBuy;

  DAXES = ["ADS.DE", "ALV.DE", "BAS.DE", "BAYN.DE", "BEI.DE", "BMW.DE", "CBK.DE", "CON.DE", "DAI.DE", "DB1.DE", "DBK.DE", "DPW.DE", "DTE.DE", "EOAN.DE", "FME.DE", "FRE.DE", "HEI.DE", "HEN3.DE", "IFX.DE", "LHA.DE", "LIN.DE", "LXS.DE", "MRK.DE", "MUV2.DE", "RWE.DE", "SAP.DE", "SDF.DE", "SIE.DE", "TKA.DE", "VOW3.DE"];

  highLow = angular.module("highLow", []);

  getStockInfo = function(symbol, callback) {
    var data, start, stop, url;
    url = 'http://query.yahooapis.com/v1/public/yql';
    start = moment().subtract('days', 7).format('YYYY-MM-DD');
    stop = moment().format("YYYY-MM-DD");
    data = encodeURIComponent('select * from yahoo.finance.historicaldata where symbol in ("' + symbol + '") and startDate = "' + start + '" and endDate = "' + stop + '"');
    return $.getJSON(url, 'q=' + data + "&env=http%3A%2F%2Fdatatables.org%2Falltables.env&format=json", function(res) {
      return callback(res.query.results);
    });
  };

  signalBuy = function(s) {
    return $("body").append(s);
  };

  handleResult = function(s, result) {
    var highers, prevHigh, q, quotes, _i, _len;
    quotes = result.quote;
    prevHigh = 1000000;
    highers = 0;
    if (quotes[0].High <= quotes[1].High) {
      return;
    }
    for (_i = 0, _len = quotes.length; _i < _len; _i++) {
      q = quotes[_i];
      if (q.High >= prevHigh) {
        highers++;
      }
      prevHigh = q.High;
    }
    if (highers > quotes.length - 3) {
      return signalBuy(s);
    }
  };

  findStocksOfInterest = function() {
    var s, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = DAXES.length; _i < _len; _i++) {
      s = DAXES[_i];
      _results.push((function(s) {
        return getStockInfo(s, function(result) {
          return handleResult(s, result);
        });
      })(s));
    }
    return _results;
  };

}).call(this);