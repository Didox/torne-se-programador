<?php

header("Cache-Control:max-age=3600, public, no-transform");
header("Expires: Sat, 26 Jul 2018 05:00:00 GMT");
header('HTTP/1.1 304 Not Modified');

?>

<!DOCTYPE html>
<html>
  <head>
    <title>CRUD simples PHP Produtos</title>
  </head>
  <body>
    <h1>CRUD PHP Produtos</h1>
    <a href="/crud/produtos">Cadastrar</a>
  </body>
</html>