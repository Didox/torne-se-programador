function cadastrarPessoas(){
	var nome = document.getElementById("nome").value;
	var sobrenome = document.getElementById("sobrenome").value;
	var cpf = document.getElementById("cpf").value;
	var telefone = document.getElementById("telefone").value;
	var endereco = document.getElementById("endereco").value;

	var html = "<tr>";
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

	alert("Cadastro concluido com sucesso");

	document.getElementById("nome").focus();
}

