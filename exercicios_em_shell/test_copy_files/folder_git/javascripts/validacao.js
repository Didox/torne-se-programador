var validarFormulario=function(){
	var mensagem="";
	if($("#name").val()==""){
		mensagem+="Preencha o nome\n";
	}
	if($("#phone").val()==""){
		mensagem+="Preencha o telefone\n";
	}
	if($("#address").val()==""){
		mensagem+="Preencha o endereço\n";
	}
	if($("#email").val()==""){
		mensagem+="Preencha o email\n";	
	}
	if($("#description").val()==""){
		mensagem+="Preencha a descricção\n";
	}
	if(mensagem==""){
		return true;
	}
	else{
		alert(mensagem);
		return false;
	}			
}
var validarClientes=function(){
	var mensagem="";
	if($("#nome").val()==""){
		mensagem+="Preencha o nome\n";
	}
	if($("#login").val()==""){
		mensagem+="Preencha o login\n";
	}
	if($("#senha").val()==""){
		mensagem+="Preencha a senha\n";
	}
	if(mensagem==""){
		return true;
	}
	else{
		alert(mensagem);
		return false;
	}
}


var validarTipos=function(){
	if($("#tipo").val()==""){
		alert("Preencha o tipo");
		$("#tipo").focus();
		return false;
	}
	return true;
}

var excluirClientes=function(id){
	if(confirm("Deseja realmente excluir")){
		window.location.href='/clientes/excluir?id='+id;
	}
}


var excluirTipo=function(id){
	if(confirm("Deseja realmente excluir")){
		window.location.href='/tipos/excluir?id='+id;
	}
}

var excluirOrcamento=function(id){
	if(confirm("Deseja realmente excluir?")){
		window.location.href='/orcamento/excluir?id='+id;
	}
}