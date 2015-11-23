<form action="/crud/helpers/salvar.php" method="post">
  <input type="hidden" name="id" value="<?php echo $id ?>"><br>
  Nome: <input type="text" name="nome" required value="<?php echo $nome ?>"><br>
  Sobrenome: <input type="text" name="sobrenome" required value="<?php echo $sobrenome ?>"><br>
  <input type="submit" value="Salvar">
</form>