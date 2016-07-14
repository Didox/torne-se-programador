var HOME = 'http://localhost:3000'
var express = require('express');
var logger = require('morgan');

var routes = require('./routes/index');

var app = express();

app.use(logger('dev'));

app.use(function(req, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET,PUT');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  res.header('Access-Control-Allow-Credentials', true);
  next();
});

app.use('/', routes);

app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

app.use(function(err, req, res, next) {
  console.log('===========')
  res.status(err.status || 500).send({ text: err.message, home:HOME })
});


module.exports = app;