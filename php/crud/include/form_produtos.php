<form action="/crud/controllers/produtos/salvar.php" method="post">
  <input type="hidden" name="id" value="<?php echo $p->id ?>"><br>
  Nome: <input type="text" name="nome" required value="<?php echo $p->nome ?>"><br>
  Preço: <input type="text" name="preco" required value="<?php echo $p->preco ?>"><br>
  <input type="submit" value="Salvar">
</form>