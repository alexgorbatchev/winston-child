// Generated by CoffeeScript 1.7.1
var WinstonChild, extend, winston;

extend = require('extend');

winston = require('winston');

WinstonChild = (function() {
  function WinstonChild(winston, context) {
    this.winston = winston;
    this.context = context;
    this.winston.extend(this);
    this.winston.addRewriter((function(_this) {
      return function(level, msg, meta) {
        return extend(meta, _this.context);
      };
    })(this));
  }

  WinstonChild.prototype.child = function(context) {
    return new WinstonChild(this.winston, extend(Object.create(this.context), context));
  };

  return WinstonChild;

})();

module.exports = {
  WinstonChild: WinstonChild
};
