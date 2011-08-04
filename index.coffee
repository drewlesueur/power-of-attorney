_ = require "underscore"
nimble = require "nimble"
drews = require "drews-mixins"
fs = require "fs"
exec = require("child_process").exec

activateABC = (cb) ->
  exec "cli-tools\\app-activate.exe ABC.EXE", (err, stdout, stderr) ->
    cb err

abcAltMaker = (combo) ->
  (cb) ->
    exec "java Keys #{combo}", (err, stdout, stderror) ->
      cb err, "yay"
borrowerInfo = abcAltMaker "alt_f3"
coBorrowerInfo = abcAltMaker "alt_f3 f2"
carInfo = abcAltMaker "alt_f4"
tradeInInfo = abcAltMaker "alt_f5"

pause = (mili) ->
  (cb) -> drews.wait mili, () -> cb null, "paused"
nimble.series [
  activateABC
  borrowerInfo
  coBorrowerInfo
  carInfo
  tradeInInfo
], (err, all) ->
  console.log "err is #{err}."
  console.log all




