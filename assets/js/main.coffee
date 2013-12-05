#require ''
loader = require process.cwd() + "/app/stockloader/loader"
console.log "huhuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"
loader.getStockInfo "GOOG", 7, (data) ->
  console.debug data
#highLow = angular.module "highLow", []
#console.debug "huhu"
