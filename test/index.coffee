#!/usr/bin/env coffee
CoffeeRequire_src = require '../src'
CoffeeRequire_main = require '../index'

hello_src = (
  CoffeeRequire_src.require './hello'
).default
hello_src()

hello_main = (
  CoffeeRequire_main.require './hello'
).default
hello_main()
