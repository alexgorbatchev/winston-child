var winston = require('winston');
var WinstonChild = require('..').WinstonChild;

var logger = new winston.Logger({
  transports: [
    new winston.transports.Console()
  ]
});

logger = new WinstonChild(logger, {foo: 'bar'});

logger.info('hello!');
// info: hello! foo=bar

logger.info('context!', {local: 123});
// info: context! local=123, foo=bar

logger = logger.child({childValue: 'hello'});

logger.info('hello!');
// info: hello! foo=bar, childValue=hello

logger.info('context!', {local: 123});
// info: context! local=123, foo=bar, childValue=hello
