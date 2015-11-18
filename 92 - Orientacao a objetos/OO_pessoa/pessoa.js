var Pessoa = function(){
  // atributos publicos
  this.cpf;
  this.nome;
  this.endereco;

  // atributos privados
  var mensagem = "este atributo mensagem é privado, ou seja dentro da minha classe"

  // metodos privados
  var concatenaNomeEndereco = function(nome, endereco){
    return "Nome: " + nome + ", Endereço: " + endereco;
  }

  var formataCPF = function(cpfs){
    return  cpfs.substring(0,2) + " - " + cpfs;
  }

  // metodos publicos
  this.informacoes = function(){
    alert("Nome: " + this.nome + "\nCPF: " + this.cpf + "\nEndereço: " + this.endereco)
  }

  this.mostrarMensagemPrivada = function(){
    return mensagem;
  }

  this.nomeEndereco = function(){
    return concatenaNomeEndereco(this.nome, this.endereco);
  }

  this.cpfFormatado = function(){
    return formataCPF(this.cpf);
  }

  this.usaMetodoStatico = function(){
    return Pessoa.metodoStatico();
  }
}

Pessoa.metodoStatico = function(){
  return "Esta é uma classe base de pessoa";
}

Pessoa.atributoStatico = "valor padrão atributo statico";