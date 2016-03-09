<?php include "config.php";

$nome_cliente = $_POST['nome_cliente'];
$nome_produto = $_POST['nome_produto'];

$sql = mysql_query("INSERT INTO `pedido` (`id_pedido`, `id_produto`, `id_cliente`) VALUES (null, '$nome_produto', '$nome_cliente');");

if (!$sql) { 


echo ("<script>alert('Já existe esse item');location.href='pedidoListar.php';</script>");

} else { 

	header("location:pedidoListar.php");

}

?>