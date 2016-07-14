<?php
include dirname(__DIR__).'/../models/produto.php';

$produtos = Produto::find($_GET['id']);
$p = null;

if(count($produtos) > 0){
  $p = $produtos[0];
}
else{
  header('Location: /crud/produtos');
}
?>

