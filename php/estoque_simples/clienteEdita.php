<?php include "config.php";



$id = $_POST['id'];
$nome = $_POST['nome'];
$email = $_POST['email'];
$telefone = $_POST['telefone'];


$sql = mysql_query("UPDATE cliente SET nome_cliente='$nome',email_cliente='$email',telefone_cliente='$telefone' WHERE id ='$id' ");

if (!$sql) { 


echo ("<script>alert('Já existe esse item');location.href='clienteListar.php;</script>");

} else { 

	header("location:clienteListar.php");

}

?>