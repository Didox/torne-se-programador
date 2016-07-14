//função para "document.write()" (Escrever na tela);
function mostrarTela(mensagem){
  document.write(mensagem + "<br>");
}

function mostrarProdutosEstoque(){
  var objTabela = document.getElementById("produtos");
  var html = "<tr><td>Nome</td><td>Preço</td></tr>";
  for(i=0; i< Produto.dados.length; i++){
    var p = Produto.dados[i];
    html += "<tr>";
    html += "<td>" + p.nome +  "</td>";
    html += "<td>" + p.preco +  "</td>";
    html += "</tr>";
  }
  objTabela.innerHTML = html;
}

function salvarProduto(){
  var nomeProduto = document.getElementById("nomeProduto");
  var valorProduto = document.getElementById("valorProduto");

  if(nomeProduto.value == ""){
    alert("Preencha o nome do produto");
    nomeProduto.focus();
    return;
  }

  if(valorProduto.value == ""){
    alert("Preencha o valor do produto");
    valorProduto.focus();
    return;
  }

  var produto = new Produto();
  produto.nome = nomeProduto.value;
  produto.preco = valorProduto.value;
  produto.salvar();

  nomeProduto.value = "";
  valorProduto.value = "";

  mostrarProdutosEstoque();
  mostrarResumo();
}

function mostrarResumo(){
  document.getElementById("qtdMenoresQue50").innerHTML = Produto.qtdMenoresQue50();
  document.getElementById("nomeProdutosEntre50e100").innerHTML = Produto.nomeProdutosEntre50e100();
  document.getElementById("mediaPrecoAcimaDe100").innerHTML = Produto.mediaPrecoAcimaDe100();
}
