_ = require "underscore"
nimble = require "nimble"
drews = require "drews-mixins"
fs = require "fs"

sendKeys = (key, cb) ->
  fileContents = """
    var sender = WScript.CreateObject("System.Windows.Forms.SendKeys");
    sender.Send(#{key})
  """  
  fileName = "junk/#{drews.time()}#{drews.rnd(0,100)}.js" 
  fs.writeFile(fileName, fileContents)

sendKeys("hi")



