function Cliente(id, nome, endereco, telefone){
	//atributos publicos//
	this.nome = nome;
	this.endereco = endereco;
	this.telefone = telefone;
	this.id = id;

	this.valorPadrao = "valor padrão";

	//metodos publicos//
	this.salvar=function(){
		Cliente.bancoEstatico.push(this);
	}
	this.alterar=function(){
		var indice=indicePorID(this.id);
		Cliente.bancoEstatico[indice]=this;
	}
	this.excluir=function(){
		var cliente=buscaClientePorID(this.id);
		Cliente.bancoEstatico.pop(cliente);
	}
	this.listar=function(){
		console.log(Cliente.bancoEstatico)
	}
	this.buscaClientePorID=function(id){
		return Cliente.buscaPorId(id)
	}
	//atributos privados//
	var atrituboPrivado;
	//metodos privados//
	var metodoPrivado=function(id){
		return 0;
	}
}

//atributos estaticos//
Cliente.bancoEstatico=[];
//metodos estaticos//
Cliente.salvar=function(cliente){
	Cliente.bancoEstatico.push(cliente);
}
Cliente.listar=function(){
	console.log(Cliente.bancoEstatico)
}
Cliente.buscaPorId=function(id){
	var indice = Cliente.indicePorID(id);
	return Cliente.bancoEstatico[indice] 
}
Cliente.indicePorID=function(id){
	var indice;
	for(i=0;i<Cliente.bancoEstatico.length;i++){
		if(Cliente.bancoEstatico[i].id==id){
			indice=i;
			break;
		}
	}
	return indice;	
}

