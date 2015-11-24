<?php
include dirname(__DIR__).'/../models/produto.php';

$p = new Produto($_POST['id'], $_POST['nome'], $_POST['preco']);

if($p->salvar()){
  echo "Salvo com sucesso";
  header('Location: /crud/produtos');
  exit;
}
else{
  echo "erro ao salvar produto";
}
?>

