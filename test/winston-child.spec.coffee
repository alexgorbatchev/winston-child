require 'coffee-errors'

winston = require 'winston'
{expect} = require 'chai'
{WinstonChild} = require '../src/winston-child'

describe 'winston-child', ->
  instance = null
  logger = null

  check = (done, fn) ->
    logger.on 'logging', (transport, level, msg, meta) ->
      fn meta
      done()

  beforeEach ->
    transport = new winston.transports.Memory()
    logger = new winston.Logger transports: [transport]
    instance = new WinstonChild logger, {foo: 123}

  it 'includes context', (done) ->
    check done, (meta) -> expect(meta).to.eql foo: 123
    instance.info 'hello'

  it 'merges meta and context', (done) ->
    check done, (meta) -> expect(meta).to.eql foo: 123, meta: 1
    instance.info 'hello', meta: 1

  describe 'child', ->
    beforeEach ->
      instance = instance.child sub: 345

    it 'includes parent and child context', (done) ->
      check done, (meta) -> expect(meta).to.eql foo: 123, sub: 345
      instance.info 'hello'

    it 'merges meta and context', (done) ->
      check done, (meta) -> expect(meta).to.eql foo: 123, sub: 345, meta: 1
      instance.info 'hello', meta: 1
