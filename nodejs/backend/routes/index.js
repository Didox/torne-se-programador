var express = require('express');
var router = express.Router();
var Pessoa = require('../modelos/pessoa');

router.get('/', function(request, response, next) {
  Pessoa.todos(function(pessoas) {
    response.render('index', { 
      title: 'Node.js com framework express',
      pessoas: pessoas
    });
  });
});

router.get('/alterar', function(request, response, next) {
  Pessoa.buscar(request.query.cpf, function(pessoa) {
    if (pessoa == null) { 
      console.log("Pessoa não encontrada");
      response.render('alterar', {'pessoa': {}})
    }
    else{
      response.render('alterar', {'pessoa': pessoa})
    }
  });
});

router.post('/alterar-pessoa', function(request, response, next) {
  var pessoa = new Pessoa();

  pessoa.cpf        = request.body.cpf;
  pessoa.nome       = request.body.nome;
  pessoa.sobrenome  = request.body.sobrenome;
  pessoa.telefone   = request.body.telefone;
  pessoa.endereco   = request.body.endereco;

  pessoa.salvar(function(){
    response.redirect("/");
  }, request.query.cpfAterar)
});


router.get('/excluir', function(request, response, next) {
  var pessoa = new Pessoa();
  pessoa.cpf = request.query.cpf;
  pessoa.excluir(function(){
    response.redirect("/");
  })

});

router.get('/pesquisar', function(request, response, next) {
  Pessoa.buscarPorNome(request.query.nome, function(pessoas) {
    response.render('index', { 
      title: 'Pesquisando em arquivos', 
      pessoas: pessoas
    });
  });
});


router.get('/ajax-test-html', function(request, response, next) {
  response.render('html-teste');
});

router.get('/estados.json', function(request, response, next) {
  response.send([
    {'SP': 'São Paulo'},
    {'RJ': 'Rio de Janeiro'},
    {'BH': 'Belo Horizonte'}
  ])
});

router.get('/cidades.json', function(request, response, next) {
  var cidades_estados = [
    {'SP': [
      'Álvares Florence',
      'Aguaí',
      'Águas da Prata'
    ]},
    {'RJ': [
      'Aperibé',
      'Areal',
      'Armação dos Búzios',
    ]},
    {'BH': [
      'Abre Campo',
      'Açucena',
      'Abaeté'
    ]}
  ]

  if(request.query.estado != undefined && request.query.estado != ""){
    var cidades = []

    for(var i=0; i<cidades_estados.length; i++){
      var estadoRequest = request.query.estado.toUpperCase();
      if(cidades_estados[i][estadoRequest] != undefined){
        cidades = cidades_estados[i][estadoRequest];
      }
    }

    if(cidades == []){
      cidades = [
        'Álvares Florence',
        'Aguaí',
        'Águas da Prata',
        'Aperibé',
        'Areal',
        'Armação dos Búzios',
        'Abre Campo',
        'Açucena',
        'Abaeté'
      ]
    }
    
    response.send(cidades)
  }
  else{
    response.send([
      'Álvares Florence',
      'Aguaí',
      'Águas da Prata',
      'Aperibé',
      'Areal',
      'Armação dos Búzios',
      'Abre Campo',
      'Açucena',
      'Abaeté'
    ]);
  }
});

router.post('/cadastrar-pessoa', function(request, response, next) {
  var pessoa = new Pessoa();

  pessoa.cpf        = request.body.cpf;
  pessoa.nome       = request.body.nome;
  pessoa.sobrenome  = request.body.sobrenome;
  pessoa.telefone   = request.body.telefone;
  pessoa.endereco   = request.body.endereco;

  pessoa.salvar(function(){
    response.redirect("/");
  });
});

module.exports = router;
