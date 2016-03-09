var express = require('express');
var router = express.Router();
var pessoas = [];

/* GET home page. */
router.get('/', function(request, response, next) {
  response.render('index', { title: 'Node.js com framework express', pessoas: pessoas });
});

router.post('/cadastrar-pessoa', function(request, response, next) {

  var nome = request.body.nome;
  hash = {
    nome: request.body.nome,
    sobrenome: request.body.sobrenome,
    cpf: request.body.cpf,
    telefone: request.body.telefone,
    endereco: request.body.endereco
  }

  pessoas.push(hash);
  response.render('index', { title: 'cadastrar-pessoa', pessoas: pessoas });
});

module.exports = router;
