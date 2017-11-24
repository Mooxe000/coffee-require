import CoffeeScript from 'coffeescript'
import compile from './compile'

import path from 'path'

loadFile = (module, filename) ->
  answer = compile filename
  module._compile answer, filename

if require.extensions
  for ext in CoffeeScript.FILE_EXTENSIONS
    require.extensions[ext] = loadFile

  Module = require 'module'

  findExtension = (filename) ->
    extensions = path
    .basename filename
    .split '.'
    extensions.shift() if extensions[0] is ''
    while extensions.shift()
      curExtension = '.' + extensions.join '.'
      return curExtension if Module._extensions[curExtension]
    '.js'

  Module::load = (filename) ->
    @filename = filename
    @paths = Module._nodeModulePaths path.dirname filename
    extension = findExtension filename
    Module._extensions[extension] @, filename
    @loaded = true
