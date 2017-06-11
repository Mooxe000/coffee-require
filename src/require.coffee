path = require 'path'
fs = require 'fs'
babel = require 'babel-core'
CoffeeScript = require 'coffeescript'
requireFromString = require 'require-from-string'

module.exports = (coffeeSource, filePath) ->

  filePath or= module.parent.filename

  require_file = path.join(
    path.dirname filePath
    coffeeSource
  )

  if (fs.statSync require_file).isDirectory()
    require_file = path.join require_file, './index.coffee'

  coffee_to_es6 = CoffeeScript._compileFile require_file

  es6_to_es5 = babel.transform coffee_to_es6
  ,
    presets: [
      'env'
    ]
  ,
    plugins: [
      'transform-runtime'
    ]

  requireFromString es6_to_es5.code
