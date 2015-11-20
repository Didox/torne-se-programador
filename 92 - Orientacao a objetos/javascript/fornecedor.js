Fornecedor=function(){
	this.CNPJ;

	// Fazendo polimorfismo do atributo estatico BancoEstatico da classe Cliente, ou seja, estou sobrescrevendo o atributo//
	this.salvar=function(){
		Fornecedor.banco.push(this);
	}
	this.listar=function(){
		console.log(Fornecedor.banco)
	}
}

Fornecedor.prototype = new Cliente(); // prototype é uma ligacao direta com outro objeto. neste caso, o fornecedor herda os metodos de cliente//

//atributos estaticos.
Fornecedor.banco=[];
