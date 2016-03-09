<?php include "config.php";


$id = $_GET['id'];

$sql = mysql_query("DELETE FROM pedido WHERE id_pedido='$id'");

header('location:pedidoListar.php');

?>