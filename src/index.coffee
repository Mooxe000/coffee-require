module.exports =

  require: (coffeeSource, filePath) ->
    filePath or= module.parent.filename
    (require './require') coffeeSource, filePath

  # register: require './register'
