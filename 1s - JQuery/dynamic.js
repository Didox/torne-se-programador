function cadastrarPessoas(){
	var nome = $("#nome").val();
	var sobrenome = $("#sobrenome").val();
	var cpf = $("#cpf").val();
	var telefone = $("#telefone").val();
	var endereco = $("#endereco").val();

	// primeiro tipo de validação
	if(nome == ""){
		alert("Por favor digite seu nome")
		$("nome").focus();
		return;
	}

	if(cpf == ""){
		alert("Por favor digite seu cpf")
		$("cpf").focus();
		return;
	}

	var html = "<tr id='linha-" + cpf + "' style='display:none'>";
	html += "<td>" + nome + "</td>";
	html += "<td>" + sobrenome + "</td>";
	html += "<td>" + cpf + "</td>";
	html += "<td>" + telefone + "</td>";
	html += "<td>" + endereco + "</td>";
	html += "</tr>";

	$("#registros").html($("#registros").html() + html);

	$(".campo").val("");

	$("#formCadastro").hide();
	$("#mostrarForm").show();

	$("#linha-" + cpf).fadeIn("slow");
	/*
	// animação com opacity, mesma coisa que o .fadeIn() do jquery
	var index = 0;
	var interval = setInterval(function(){
		$("#linha-" + cpf).css("opacity", "0." + index);
		index += 1;
		if(index > 9){
			clearInterval(interval);
		}
	}, 50)
	*/
}


function mostrarFormulario(){
	$("#mostrarForm").hide();
	$("#formCadastro").show();
}

function alterarFilho(){
	//$($($($("registros").children[2]).children[0]).children[0]).html("danilo")
	
	var c1 = $($("#registros").children[2]);
	var c2 = $(c1.children[0]);
	var c3 = $(c2.children[0]);

	c3.html("danilo");

}

function alterarPai(){
	var html = $("#registros").parent().html();
	$("#registros").parent().html(html + "teste")

	/*
	//navegando entre elementos DOM
	//ir para o proximo
	var c1 = $("registros").next();

	//ir para o anterior
	var c1 = $("registros").previous();
	*/
}

