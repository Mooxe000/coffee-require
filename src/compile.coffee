import CoffeeScript from 'coffeescript'
import babel from 'babel-core'

coffeeFileToes6 = (filename) ->

  CoffeeScript._compileFile filename
  , no
  , yes

es6Toes5 = (code) ->

  es5 = babel.transform code
  ,
    presets: [
      [
        'env'
        targets:
          node: true
      ]
    ]
  ,
    plugins: [
      'transform-runtime'
    ]

  es5.code

export default (filename) ->

  es6Toes5 coffeeFileToes6 filename
