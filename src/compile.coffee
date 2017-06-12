CoffeeScript = require 'coffeescript'
babel = require 'babel-core'

module.exports = (filename) ->

  es6 = CoffeeScript._compileFile filename
  , no
  , yes

  es5 = babel.transform es6
  ,
    presets: [
      'env'
    ]
  ,
    plugins: [
      'transform-runtime'
    ]

  es5.code
