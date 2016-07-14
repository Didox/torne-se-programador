<?php include '../models/produto.php' ?>
<!DOCTYPE html>
<html>
  <head>
    <title>Produtos</title>
  </head>
  <body>
    <h1>Produtos</h1>
    <?php $p = new Produto ?>
    <?php include '../include/form_produtos.php' ?>
    <br>
    <br>
    <?php include '../include/tabela_produtos.php' ?>
  </body>
</html>