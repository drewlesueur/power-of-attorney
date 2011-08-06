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
    cb err


getAllImages = (cb) ->
  nimble.series [
    activateABC
    borrowerInfo
    snap config.borrowerImage
    coBorrowerInfo
    snap config.coBorrowerImage
    carInfo
    snap config.carImage
    tradeInInfo
    snap config.tradeImage
  ], (err, all) ->
    console.log "err is #{err}."
    console.log all
    cb err, "done"


cropImages = (cb=->) ->
  nimble.each croppings,
    ([file, [l,t,w,h]], key, cb=->) ->
      l = (l - 1) * config.fontWidth + config.offsetLeft
      t = (t - 1) * config.fontHeight + config.offsetTop
      w = w * config.fontWidth
      h = h * config.fontHeight

      inFileName =  file
      outFileName =  "#{key}.png"
      imageMagickCommands = [
        crop inFileName, l, t, w, h, outFileName
      ]
      for color in config.changeToBlack
        imageMagickCommands.push replaceColor outFileName, color, "#000000", outFileName
      for color in config.changeToTransparent
        imageMagickCommands.push transparentColor outFileName, color, outFileName
      nimble.series imageMagickCommands, (err) ->
        cb err

    (err) ->
      cb err, "done cropping images"
      console.log "done!"

createForm = (formInfo, name, cb) -> #not returning a func that returns cb as an expiriment
  console.log "creating the form #{name}"
  images = ""
  for imageName, imageInfo of formInfo.images
    console.log "the image info is"
    console.log imageInfo
    [l, t, w, h] = imageInfo
    images += """
      <img src="#{imageName}.png" style="position: absolute; left: #{l}px; top: #{t}px;  "/>
    """
  form = """
    <!doctype html>
    <html>
      <head>
        <style>
          * {marging: 0; padding: 0;}
        </style>
       </head>
       #{images}
       <img src="#{formInfo.background}" style="width:8.5in;" />
    </html>
  """
  fs.writeFile "#{name}.html", form, (err) ->
    console.log "done writing #{name}.html"
    console.log err
    cb err, "done writing file"

createForms = (cb) ->
  console.log "creating forms"
  nimble.each config.forms, createForm, (err, all) ->
      console.log err
      console.log "done creating forms"
      cb err, "forms done"


openChrome = (file) -> (cb) ->
  ourPath = __dirname.replace /\s/g, "%20"
  command = "#{config.chromePath} file:///#{ourPath}\\#{file}"
  console.log command
  exec command, (err, stdin, stderr) ->
    console.log "opened chrome"
    console.log stdin
    console.log err
    console.log stderr
    cb err

openChromes = (cb) ->
  todo = []
  for formName of config.forms
    todo.push openChrome "#{formName}.html"
  nimble.series todo, (err, all) ->
    console.log "done opening chromes"
    cb err, "done" 

#compare createForms with openChromes. two different ways of doing it
todos = [getAllImages, cropImages, createForms, openChromes]
#todos = [cropImages, createForms, openChromes]
nimble.series todos, (err, all) ->
  console.log "all done."


  


