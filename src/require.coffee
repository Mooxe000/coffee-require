path = require 'path'
fs = require 'fs'
requireFromString = require 'require-from-string'
compile = require './compile'

module.exports = (coffeeSource, filePath) ->

  filePath or= module.parent.filename

  require_file = path.join(
    path.dirname filePath
    coffeeSource
  )

  if (fs.statSync require_file).isDirectory()
    require_file = path.join require_file, './index.coffee'

  code = compile require_file

  requireFromString code
