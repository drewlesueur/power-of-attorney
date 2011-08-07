console.log("smile:"+ __dirname)
CoffeeScript = require("coffee-script/lib")
fs = require("fs")
_ = require("underscore")
nimble = require("nimble")
drews = require("drews-mixins")
console.log(drews.time())
console.log(_.isString("hello") + "<--")
fs.readFile("index.coffee", function(err, data){
  src = data.toString()
  newSrc = CoffeeScript.compile(src)  
  console.log(newSrc)
  eval(newSrc)
})



