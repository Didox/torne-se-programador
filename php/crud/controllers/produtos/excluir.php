<?php
include dirname(__DIR__).'/../models/produto.php';

if( Produto::excluir($_GET['id']) ){
  echo "Exluido com sucesso";
  header('Location: /crud/produtos');
  exit;
}
else{
  echo "erro ao excluir produto";
}
?>

