config = require "./config.js"
_ = require "underscore"
nimble = require "nimble"
drews = require "drews-mixins"
fs = require "fs"
exec = require("child_process").exec

{abcName, titleBarHeight, outputDir} = config
activateABC = (cb) ->
  exec "cli-tools\\app-activate.exe #{abcName}", (err, stdout, stderr) ->
    cb err

abcAltMaker = (combo) ->
  (cb) ->
    exec "java Keys #{combo}", (err, stdout, stderror) ->
      cb err, "yay"
borrowerInfo = abcAltMaker "alt_f3"
coBorrowerInfo = abcAltMaker "alt_f3 f2"
carInfo = abcAltMaker "alt_f4"
tradeInInfo = abcAltMaker "alt_f5"

screenshot = (app, location, cb) ->
  exec "cli-tools\\app-print-screen.exe #{app} #{location}", (err, stdout, stderr) ->
    cb err

snap = (loc) ->
 (cb) ->
   screenshot abcName, "#{outputDir}#{loc}", cb

pause = (mili) ->
  (cb) -> drews.wait mili, () -> cb null, "paused"
nimble.series [
  activateABC
  borrowerInfo
  snap "borr.png"
  coBorrowerInfo
  snap "co.png"
  carInfo
  snap "car.png"
  tradeInInfo
  snap "trade.png"
], (err, all) ->
  console.log "err is #{err}."
  console.log all




