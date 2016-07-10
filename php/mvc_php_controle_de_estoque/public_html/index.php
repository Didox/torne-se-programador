<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="Sistema de controle de estoque">
    <meta name="author" content="Edwin Bulata Pancoti">
    <link rel="icon" href="favicon.ico">

    <title>Controle de Estoque</title>

    <!-- Importação de folhas de estilo -->
    <link href="includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="includes/css/dashboard.css" rel="stylesheet">
  </head>
  <body>
    <?php
      try
      {
        define('ebp',true);
        include_once('includes/php/loader.php'); 
      }
      catch(Exception $e)
      {
    ?>
        <div class="alert alert-danger " role="alert">
          <strong>Atenção!</strong><br />
          <?php echo $e->getMessage(); ?>
        </div>
    <?php
        exit();
      }
    ?> 

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">Controle de Estoque</a>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><span>Clientes</span></li>
            <li><a href="index.php?modulo=cliente&acao=novo">Cadastrar</a></li>
            <li><a href="index.php?modulo=cliente">Gerenciar</a></li>
          </ul>

          <ul class="nav nav-sidebar">
            <li><span>Produtos</span></li>
            <li><a href="index.php?modulo=produto&acao=novo">Cadastrar</a></li>
            <li><a href="index.php?modulo=produto">Gerenciar</a></li>
          </ul>
     
          <ul class="nav nav-sidebar">
            <li><span>Pedidos</span></li>
            <li><a href="index.php?modulo=pedido&acao=novo">Cadastrar</a></li>
            <li><a href="index.php?modulo=pedido">Gerenciar</a></li>
          </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <?php
            if(isset($_GET['modulo']) AND !empty($_GET['modulo']) AND file_exists('includes/php/modulos/'.$_GET['modulo'].'.php'))
            {
              include_once('includes/php/modulos/'.$_GET['modulo'].'.php');
            }
            else
            {
          ?>
            <h1 class="page-header">O que deseja fazer?</h1>
            <p>Utilize o menu lateral para administrar seu estoque.</p>
          <?php    
            }
          ?>
        </div>
      </div>
    </div>
  </body>

  <!-- Importação de scripts -->
  <script src="includes/js/jquery-1.12.0.min.js"></script>
  <script src="includes/js/navegacao.js"></script>
  <script src="includes/js/bootstrap.min.js"></script>
</html>