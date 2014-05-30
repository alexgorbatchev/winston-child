extend = require 'extend'
winston = require 'winston'

class WinstonChild
  constructor: (@winston, @context) ->
    @winston.extend @
    @winston.addRewriter (level, msg, meta) => extend meta, @context

  child: (context) ->
    new WinstonChild @winston, extend Object.create(@context), context

module.exports = {WinstonChild}
