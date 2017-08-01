#!/usr/bin/env coffee
require 'shelljs/make'
echo = console.log
dd = require 'ddeyes'

CoffeeRequire_src = require '../src'
CoffeeRequire_main = require '../index'
{ gdf } = CoffeeRequire_src

target.hello = ->

  hello_src = gdf CoffeeRequire_src.require './hello'
  hello_src()

  hello_main = gdf CoffeeRequire_main.require './hello'
  hello_main()

  require '../register'

  hello = gdf require './hello'
  hello()

target.spread = ->
  spread = gdf CoffeeRequire_src.require './spread'
  dd spread()

target.all = ->
  echo 'Hello World!!!'
