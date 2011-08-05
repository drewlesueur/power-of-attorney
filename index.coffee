config = require "./config.js"
_ = require "underscore"
nimble = require "nimble"
drews = require "drews-mixins"
fs = require "fs"
exec = require("child_process").exec

{abcName, titleBarHeight, outputDir, croppings} = config

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
    console.log stdout
    cb err

snap = (loc) -> (cb) ->
   console.log "outputDir is #{outputDir}"
   screenshot abcName, "#{loc}", cb

pause = (mili) -> (cb) -> drews.wait mili, () -> cb null, "paused"


crop = (inFileName, l, t, w, h, outFileName) -> (cb) ->
  command = "convert #{inFileName} -crop #{w}x#{h}+#{l}+#{t} #{outFileName}" 
  console.log command
  exec command, (err, stdout, stderr) ->
    console.log err
    console.log stderr
    console.log "cropped?"
    cb err

replaceColor = (inFileName, oldColor, newColor, outFileName) -> (cb) ->
  command = "convert #{inFileName} -fill #{newColor} -opaque #{oldColor} #{outFileName}" 
  console.log command
  exec command, (err, stdout, stderr) ->
    console.log err
    console.log stderr
    console.log "replaced color"
    cb err
    
transparentColor = (inFileName, oldColor, outFileName) -> (cb) ->
  command = "convert #{inFileName} -transparent #{oldColor}  #{outFileName}" 
  console.log command
  exec command, (err, stdout, stderr) ->
    console.log err
    console.log stderr
    console.log "transparented"


getAllImages = (cb) ->
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
    cb err, "done"


cropImages = (cb=->) ->
  nimble.each croppings,
    ([file, [l,t,w,h]], key, cb=->) ->
      console.log "saving a cropping"
      console.log "h was #{h}"
      l = (l - 1) * config.fontWidth + config.offsetLeft
      t = (t - 1) * config.fontHeight + config.offsetTop
      w = w * config.fontWidth
      h = h * config.fontHeight
      console.log "h is now #{h}"

      inFileName =  "#{file}.png"
      outFileName =  "#{key}.png"
      nimble.series [
        crop inFileName, l, t, w, h, outFileName
        #replaceColor outFileName, "yellow", "black", outFileName
        replaceColor outFileName, config.yellow, "#000000", outFileName
        transparentColor outFileName, config.blue, outFileName
      ], (err) ->
        cb err

    (err) ->
      cb err, "done cropping images"
      console.log "done!"
todos = [getAllImages, cropImages]
todos = [cropImages]
nimble.series todos, (err, all) ->
  console.log "all done."


  


