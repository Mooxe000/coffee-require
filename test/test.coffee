import 'shelljs/make'
import dd from 'ddeyes'

import CoffeeRequire from '../index'

{ gdf } = CoffeeRequire

target.hello = ->

  hello = gdf CoffeeRequire.require './hello'
  hello()

  require '../register'

  hello = gdf require './hello'
  hello()

target.spread = ->
  spread = gdf CoffeeRequire.require './spread'
  dd spread()

target.all = ->
  dd 'Hello World!!!'
