#!/usr/bin/env coffee
CoffeeRequire_src = require '../src'
CoffeeRequire_main = require '../index'

hello_src = (
  CoffeeRequire_src './hello'
).default
hello_src()

hello_main = (
  CoffeeRequire_main './hello'
).default
hello_main()
