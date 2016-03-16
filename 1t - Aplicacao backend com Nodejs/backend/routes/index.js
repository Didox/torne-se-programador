var express = require('express');
var router = express.Router();
var pessoas = [];
var BANCO_ARQUIVO = "dados/bancoArquivo.js";

router.get('/', function(request, response, next) {
  dados = { title: 'Node.js com framework express' };
  carregarBase(function read(err, data) {
    if (err) { 
      console.log(err);
      dados['pessoas'] = [];
    }
    else{
      dados['pessoas'] = JSON.parse(data);
    }

    response.render('index', dados)
  });
});

router.get('/pesquisar', function(request, response, next) {
  dados = { title: 'Pesquisando em arquivos' };
  carregarBase(function read(err, data) {
    if (err) { 
      console.log(err);
      dados['pessoas'] = [];
    }
    else{
      var dadosPesquisados = [];
      if(request.query.nome == ""){
        dadosPesquisados = JSON.parse(data);
      }
      else{
        var bancoDados = JSON.parse(data);

        /*
        // sem utilizar regular expression
        for(var i=0; i<bancoDados.length; i++){
          var nomeMinusculo = request.query.nome.toLowerCase();
          var nomeBancoMinusculo = bancoDados[i].nome.toLowerCase();
          if(nomeBancoMinusculo.indexOf(nomeMinusculo) != -1){
            dadosPesquisados.push(bancoDados[i]);
          }
        }
        */

        // utilizando regular expression
        for(var i=0; i<bancoDados.length; i++){
          var reg = new RegExp(request.query.nome, "i");
          if(bancoDados[i].nome.match(reg) != null){
            dadosPesquisados.push(bancoDados[i]);
          }
        }
      }
      dados['pessoas'] = dadosPesquisados;
    }

    response.render('index', dados);
  });
});

router.post('/cadastrar-pessoa', function(request, response, next) {
  carregarBase(function read(err, data) {
    if (err) { 
      console.log(err);
      return;
    }

    pessoas = JSON.parse(data);

    var hash = {
      nome: request.body.nome,
      sobrenome: request.body.sobrenome,
      cpf: request.body.cpf,
      telefone: request.body.telefone,
      endereco: request.body.endereco
    }

    salvarBase(hash)
    response.render('index', { title: 'cadastrar-pessoa', pessoas: pessoas });
  });
});


// funcoes auxiliares para arquivos
var carregarBase = function(callback){
  var fs = require('fs');
  fs.readFile(BANCO_ARQUIVO, callback);
}

var salvarBase = function(hash){
  pessoas.push(hash);
  var fs = require('fs');
  fs.writeFile(BANCO_ARQUIVO, JSON.stringify(pessoas), function(err) {
    if(err) {
      console.log(err);
    }
  });
}

module.exports = router;
