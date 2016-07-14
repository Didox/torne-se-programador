<?php include "config.php";

$nome = $_POST['nome'];
$email = $_POST['email'];
$telefone = $_POST['telefone'];

$sql = mysql_query("INSERT INTO cliente(id, nome_cliente, email_cliente, telefone_cliente) values (NULL, '$nome','$email', '$telefone')");

if (!$sql) { 

	echo ("<script>alert('Já existe esse item');location.href='pedidoListar.php';</script>");

} else { 

	header("location:clienteListar.php");

}

?>