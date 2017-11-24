import path from 'path'
import fs from 'fs'
import requireFromString from 'require-from-string'
import compile from './compile'

export default (coffeeSource, filePath) ->

  filePath or= module.parent.filename

  require_file = path.join(
    path.dirname filePath
    coffeeSource
  )

  if (fs.statSync require_file).isDirectory()
    require_file = path.join require_file, './index.coffee'

  code = compile require_file

  requireFromString code
