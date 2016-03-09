<?php include "config.php";



$nome = $_POST['nome'];
$descricao = $_POST['descricao'];
$preco = $_POST['preco'];

$sql = mysql_query("INSERT INTO produto(id, nome_produto, descricao_produto, preco_produto) values (NULL, '$nome','$descricao', '$preco')");

if (!$sql) { 


echo ("<script>alert('Já existe esse item');location.href='produtoListar.php;</script>");

} else { 

	header("location:produtoListar.php");

}

?>