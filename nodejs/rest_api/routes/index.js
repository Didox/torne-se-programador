var express = require('express');
var router = express.Router();
var HOST = 'http://localhost:3000'

router.get('/', function(req, res, next) {
  res.status(200).send({
    text:'rest api exemplos',
    rotas:[
      HOST + '/200',
      HOST + '/204', 
      HOST + '/201', 
      HOST + '/401', 
      HOST + '/403', 
      HOST + '/500', 
      HOST + '/503', 
      HOST + '/301', 
      HOST + '/400',
      HOST + '/404'
    ]
  });
});

router.get('/200', function(req, res, next) {
  res.status(200).send({
    text:'Retorno de pagina sucesso',
    home:HOST
  });
});

router.get('/204', function(req, res, next) {
  res.status(204); //no content
});

router.get('/201', function(req, res, next) {
  res.status(201).send({
    text:'Criado',
    home:HOST
  });
});

router.get('/401', function(req, res, next) {
  res.status(401).send({
    text:'Acesso não autorizado',
    home:HOST
  });
});

router.get('/403', function(req, res, next) {
  res.status(403).send({
    text:'Acesso negado',
    home:HOST
  });
});

router.get('/500', function(req, res, next) {
  res.status(500).send({
    text:'Erro interno no servidor',
    home:HOST
  });
});

router.get('/503', function(req, res, next) {
  res.status(503).send({
    text:'Servidor indisponível',
    home:HOST
  });
});

router.get('/301', function(req, res, next) {
  res.status(301).send({
    text:'Redirect permanente',
    home:HOST
  });
});

router.get('/400', function(req, res, next) {
  res.status(400).send({
    text:'Bad request, requisição inválida',
    home:HOST
  });
});

module.exports = router;
