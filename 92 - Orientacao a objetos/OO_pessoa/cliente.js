var Cliente = function(codCliente, cpfCliente, nomeCliente, endCliente){
	this.TIPO_CLIENTE =  "Vip";

	this.codigoCliente = codCliente;
	this.cpf = cpfCliente;
	this.nome = nomeCliente;
	this.endereco = endCliente;

    this.informacoes = function(){
      alert("Código Cliente: " + this.codigoCliente + "\nNome: " + this.nome + "\nCPF: " + this.cpf + "\nEndereço: " + this.endereco)
    }
}

Cliente.prototype = new Pessoa();

Cliente.TIPO_CLIENTE =  "Vip statico";

