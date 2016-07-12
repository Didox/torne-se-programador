var App = require('../config/app')

var PessoaBancoArquivo = function(){
  this.nome = "";
  this.sobrenome = "";
  this.cpf = "";
  this.telefone = "";
  this.endereco = "";

  this.salvar = function(callback, cpfAlteracao){
    var nomeInstancia     = this.nome;
    var sobrenomeInstancia  = this.sobrenome;
    var cpfInstancia    = this.cpf;
    var telefoneInstancia   = this.telefone;
    var enderecoInstancia   = this.endereco;

    PessoaBancoArquivo.todos(function(pessoas) {
        if (pessoas == []) { 
          console.log("Pessoas não encontada na base de dados");
          callback.call();
        }
        else{
          if(cpfAlteracao == undefined){
            var hash = {
            nome: nomeInstancia,
            sobrenome: sobrenomeInstancia,
            cpf: cpfInstancia,
            telefone: telefoneInstancia,
            endereco: enderecoInstancia
          }

          pessoas.push(hash);
          PessoaBancoArquivo.salvarTodos(pessoas);
          }
          else{
            for(var i=0; i<pessoas.length; i++){
              if(pessoas[i].cpf == cpfAlteracao){

                pessoas[i].nome = nomeInstancia;
                pessoas[i].sobrenome = sobrenomeInstancia;
                pessoas[i].cpf = cpfInstancia;
                pessoas[i].telefone = telefoneInstancia;
                pessoas[i].endereco = enderecoInstancia;

                PessoaBancoArquivo.salvarTodos(pessoas);
                break;
              }
            }
        }
          callback.call();
        }
    });
  }

  this.excluir = function(callback){
    var cpfInstancia = this.cpf;
    PessoaBancoArquivo.todos(function(pessoas) {
        if (pessoas == []) { 
          console.log("Pessoas não encontada na base de dados");
        }
        else{
          var pessoasRestantes = [];
          for(var i=0; i<pessoas.length; i++){
            if(pessoas[i].cpf != cpfInstancia){
              pessoasRestantes.push(pessoas[i]);
            }
          }

          PessoaBancoArquivo.salvarTodos(pessoasRestantes);
          pessoas = pessoasRestantes;
        }

        callback.call(null, pessoas)
    });
  }
}

PessoaBancoArquivo.buscar = function(cpf, callback){
  PessoaBancoArquivo.todos(function(pessoas) {
      if (pessoas == []) { 
        console.log("Pessoa não encontrada em nossa base de dados");
        callback.call(null, null);
      }
      else{
        var pessoa = null;
        for(var i=0; i<pessoas.length; i++){
          if(pessoas[i].cpf == cpf){
            pessoa = pessoas[i];
            break;
          }
        }

        callback.call(null, pessoa);
      }
  });
}


PessoaBancoArquivo.buscarPorNome = function(nome, callback){
  PessoaBancoArquivo.todos(function(pessoas){
      if (pessoas == []) { 
        console.log("Pessoa não encontrada em nossa base de dados");
        callback.call(null, pessoas);
      }
      else{
        var dadosPesquisados = [];
        if(nome == ""){
          dadosPesquisados = pessoas;
        }
        else{
          for(var i=0; i<pessoas.length; i++){
            var reg = new RegExp(nome, "i");
            if(pessoas[i].nome.match(reg) != null){
              dadosPesquisados.push(pessoas[i]);
            }
          }
      }
     
      callback.call(null, dadosPesquisados);
    }
  });
}

PessoaBancoArquivo.salvarTodos = function(pessoas){
  var fs = require('fs');
  fs.writeFile(App.BANCO_ARQUIVO, JSON.stringify(pessoas), function(err) {
    if(err) {
      console.log(err);
    }
  });
}

PessoaBancoArquivo.todos = function(callback){
  var fs = require('fs');
  fs.readFile(App.BANCO_ARQUIVO, function(err, data) {
    pessoas = [];
    if (err) { 
      console.log(err);
    }
    else{
      pessoas = JSON.parse(data);
    }
    callback.call(null, pessoas);
  });
}

module.exports = PessoaBancoArquivo;