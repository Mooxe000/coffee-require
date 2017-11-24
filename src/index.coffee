import _require from './require'

export default

  require: (coffeeSource, filePath) ->
    filePath or= module.parent.filename
    _require coffeeSource, filePath

  # register: require './register'

  gdf: (obj) -> obj.default
