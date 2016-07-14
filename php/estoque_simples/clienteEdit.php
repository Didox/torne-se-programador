<?php 

include "includes/header.php";

$id = $_GET['id'];

$sql = mysql_query("SELECT * FROM cliente WHERE id = '$id' ");

$clientes = mysql_fetch_assoc($sql);

?>
<h2>Atualização de clientes</h2><br>
<form class="form-horizontal" action="clienteEdita.php" method="post">
	<fieldset>
		<input type="hidden" name="id" value="<?php echo $clientes['id']; ?>">
		<div class="control-group">
			<label>Nome do Cliente</label><input class="input-xxlarge" type="text" name="nome" value="<?php echo $clientes['nome_cliente']; ?>"/>
		</div>
		<div class="control-group">
			<label>E-mail do Cliente</label><input type="text" class="input-xxlarge"  name="email" value="<?php echo $clientes['email_cliente']; ?>" data-inputmask="'alias': 'email'"/>
		</div>
		<div class="control-group">
			<label>Telefone do Cliente</label><input type="text" class="input-xxlarge" data-inputmask="'mask': '(99) 9999-9999[9]'" name="telefone" value="<?php echo $clientes['telefone_cliente']; ?>"/>
		</div>
		<button class="btn btn-primary" type="submit">Atualizar</button>
		<a href="produtoListar.php" class="btn btn-warning">Voltar</a>
	</fieldset>
</form>
<?php
include "includes/footer.php";

?>
