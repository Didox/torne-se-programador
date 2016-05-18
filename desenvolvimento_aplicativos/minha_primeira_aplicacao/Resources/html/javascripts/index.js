var app = {};
app.networkOffAlert = function(){
  if(Ti !== undefined){
    Ti.App.fireEvent('networkOffAlert');
  }
};

app.carregarDadosCadastro = function(){
  $.ajax( "http://local.com.br:3000/pessoas.json" ).done(function(dados) {

  	var html = "";
  	for(var i=0; i<dados.length; i++){
  		html += "<tr>";
  		html += "<td>" + dados[i].nome + "</td>";
  		html += "<td>" + dados[i].sobrenome + "</td>";
  		html += "<td>" + dados[i].cpf + "</td>";
  		html += "<td>" + dados[i].telefone + "</td>";
  		html += "<td>" + dados[i].endereco + "</td>";
  		html += "<td><a href='/alterar?cpf=" + dados[i].cpf + "' class='btn btn-warning'>Alterar</a></td>";
  		html += "<td><a href='#' onclick='excluirDados(\'" + dados[i].cpf + "\')' class='btn btn-danger'>Excluir</a></td>";
  		html += "</tr>";
  	}

  	$("#registros #dados").html(html);
  	
  });
}

app.networkOffAlert();
app.carregarDadosCadastro();
