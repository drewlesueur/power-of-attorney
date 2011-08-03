_ = require "underscore"
nimble = require "nimble"
drews = require "drews-mixins"
fs = require "fs"
exec = require("child_process").exec

sendKeys = (key, cb=->) ->
  fileContents = """
    voice = WScript.CreateObject("SAPI.SpVoice");
    voice.Speak("#{key}");
    WshShell = WScript.CreateObject("WScript.Shell")
    WshShell.SendKeys("#{key}")
  """  
  fileName = "junk/#{drews.time()}#{drews.rnd(0,100)}.js" 
  fs.writeFile fileName, fileContents, (err) ->
    exec "wscript #{fileName}", (err, stdout, stderr) ->
      fs.unlink fileName, (err) ->
        console.log stdout
        console.log err
        console.log stderr
        cb err

sendKeys("hi")



