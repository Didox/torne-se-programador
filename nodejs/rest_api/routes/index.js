var express = require('express');
var router = express.Router();
var HOST = 'http://localhost:3000'

router.get('/', function(req, res, next) {
  res.status(200).send({
    text:'rest api exemplos',
    rotas:[
      HOST + '/200', 
      HOST + '/404',
      HOST + '/503', 
      HOST + '/403', 
      HOST + '/401'
    ]
  });
});

router.get('/200', function(req, res, next) {
  res.status(200).send({
    text:'Retorno de pagina sucesso',
    home:HOST
  });
});

router.get('/401', function(req, res, next) {
  res.status(401).send({
    text:'Acesso não autorizado',
    home:HOST
  });
});

module.exports = router;
