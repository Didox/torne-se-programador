api = {
  get: function(status){
    $.ajax({
      url: "http://localhost:3000/" + status,
      type: 'GET',
      data: "nome=Danilo&sobrenome=Aparecido",
    }).done(function( data ) {
      if(data != undefined && data != '')
        alert(data.text);
      else
        alert('sem conteúdo')
    }).fail(function( jqXHR, textStatus ) {
      responseJson = JSON.parse(jqXHR.responseText)
      alert( "Status de falha: " + jqXHR.status + ', mensagem: ' + responseJson.text);
    });
  }
}

$(document).ready(function(){
  $("a").on('click', function(){
    if($(this).data('status')){
      api.get($(this).data('status'));
    }
  });
});