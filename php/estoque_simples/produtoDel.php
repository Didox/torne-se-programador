<?php include "config.php";


$id = $_GET['id'];

$sql = mysql_query("DELETE FROM produto WHERE id='$id'");

header('location:produtoListar.php');

?>