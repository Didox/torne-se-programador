function cadastrarPessoas(){
	var nome = document.getElementById("nome").value;
	var sobrenome = document.getElementById("sobrenome").value;
	var cpf = document.getElementById("cpf").value;
	var telefone = document.getElementById("telefone").value;
	var endereco = document.getElementById("endereco").value;

	// primeiro tipo de validação
	if(nome == ""){
		alert("Por favor digite seu nome")
		document.getElementById("nome").focus();
		return;
	}

	if(cpf == ""){
		alert("Por favor digite seu cpf")
		document.getElementById("cpf").focus();
		return;
	}


	// segundo tipo de validação
	/*var mensagens = "";

	if(nome == ""){
		mensagens += "Nome\n"
	}

	if(cpf == ""){
		mensagens += "CPF\n"
	}

	if(mensagens != ""){
		alert("Por favor preencha os campos abaixo: \n" + mensagens)
		return;
	}*/

	var html = "<tr id='linha-" + cpf + "' style='opacity:0.0'>";
	html += "<td>" + nome + "</td>";
	html += "<td>" + sobrenome + "</td>";
	html += "<td>" + cpf + "</td>";
	html += "<td>" + telefone + "</td>";
	html += "<td>" + endereco + "</td>";
	html += "</tr>";

	document.getElementById("registros").innerHTML += html;

	document.getElementById("nome").value = "";
	document.getElementById("sobrenome").value = "";
	document.getElementById("cpf").value = "";
	document.getElementById("telefone").value = "";
	document.getElementById("endereco").value = "";

	//alert("Cadastro concluido com sucesso");
	//document.getElementById("nome").focus();

	document.getElementById("formCadastro").style = "display:none";
	document.getElementById("mostrarForm").style = "display:block";

	// animação com opacity
	var index = 0;
	var interval = setInterval(function(){
		document.getElementById("linha-" + cpf).style = "opacity:0." + index
		index += 1;
		if(index > 9){
			clearInterval(interval);
		}
	}, 50)

}


function mostrarFormulario(){
	document.getElementById("mostrarForm").style = "display:none";
	document.getElementById("formCadastro").style = "display:block";
}

function alterarFilho(){
	document.getElementById("registros").childNodes[2].childNodes[0].childNodes[0].innerHTML = "danilo"
}

function alterarPai(){
	document.getElementById("registros").parentNode.innerHTML += "teste"

	/*
	//navegando entre elementos DOM
	//ir para o proximo
	document.getElementById("registros").childNodes[2].childNodes[0].childNodes[0].nextSibling

	//ir para o anterior
	document.getElementById("registros").childNodes[2].childNodes[0].childNodes[1].previousSibling
	*/
}


/*

// espera e executa somente uma vez
setTimeout(function(){ 
	console.log("danilo") 
}, 2000)


//executa até que vc mande parar
var intervalo = setInterval(function(){ console.log("danilo") }, 2000)

// mandando parar
clearInterval(intervalo)

*/

