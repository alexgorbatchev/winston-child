# winston-child

[![GitTip](http://img.shields.io/gittip/alexgorbatchev.svg)](https://www.gittip.com/alexgorbatchev/)
[![Dependency status](https://david-dm.org/alexgorbatchev/winston-child.svg)](https://david-dm.org/alexgorbatchev/winston-child)
[![devDependency Status](https://david-dm.org/alexgorbatchev/winston-child/dev-status.svg)](https://david-dm.org/alexgorbatchev/winston-child#info=devDependencies)
[![Build Status](https://secure.travis-ci.org/alexgorbatchev/winston-child.svg?branch=master)](https://travis-ci.org/alexgorbatchev/winston-child)

[![NPM](https://nodei.co/npm/winston-child.svg)](https://npmjs.org/package/winston-child)

Facilitates meta object inheritance for [Winston] loggers.

## Installation

    npm install winston-child

## Usage Example

    var winston = require('winston');
    var WinstonChild = require('winston-child').WinstonChild;

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

## Testing

    npm test

## License

The MIT License (MIT)

Copyright 2014 Alex Gorbatchev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

[Winston]: https://github.com/flatiron/winston
