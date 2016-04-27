var carregarEstados = function(){
  $.ajax( "/estados.json" ).done(function(dados) {
  	$("#estado").html("");
   	$("#estado").append("<option value=''>[Selecione um estado]</option>");

    for(var i=0; i<dados.length; i++){
    	var key = Object.keys(dados[i])[0];
    	var value = dados[i][key];
    	$("#estado").append("<option value='" + key + "'>" + value + "</option>");
    }
  });

  $.ajax( "/ajax-test-html" ).done(function(html) {
   	$(document.body).append(html);
  });
}

var carregarCidade = function(){
  var estado = $("#estado").val();
  $.ajax( "/cidades.json?estado=" + estado ).done(function(dados) {
  	$("#cidade").html("");
    for(var i=0; i<dados.length; i++){
    	var value = dados[i];
    	$("#cidade").append("<option value='" + value + "'>" + value + "</option>");
    }
  });
}
