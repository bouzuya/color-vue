assert = require 'power-assert'
index = require '../src/index'

describe 'index', ->
  it 'works', ->
    assert index(1, 2) is 3
