<?php include "config.php";

$id = $_GET['id'];

$sql = mysql_query("DELETE FROM cliente WHERE id='$id'");

header('location:clienteListar.php');

?>