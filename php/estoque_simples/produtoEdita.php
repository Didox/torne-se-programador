<?php include "config.php";

$id = $_POST['id'];
$nome = $_POST['nome'];
$descricao = $_POST['descricao'];
$preco = $_POST['preco'];

$sql = mysql_query("UPDATE produto SET nome_produto='$nome',descricao_produto='$descricao',preco_produto='$preco' WHERE id ='$id' ");

if (!$sql) { 


echo ("<script>alert('Já existe esse item');location.href='produtoListar.php;</script>");

} else { 

	header("location:produtoListar.php");

}

?>