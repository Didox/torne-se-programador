<?php 

include "includes/header.php";

$sql = mysql_query("SELECT * FROM cliente ORDER BY id ASC");

$row = mysql_num_rows($sql);

?>
<form class="form-horizontal" action="clienteCad.php" method="post">
	<fieldset>
		<div class="control-group">
			<label>Nome do Cliente</label><input class="input-xxlarge" type="text" required x-moz-errormessage="Preencha o nome do cliente" name="nome"/>
		</div>
		<div class="control-group">
			<label>E-mail do Cliente</label><input class="input-xxlarge" type="text" required x-moz-errormessage="Preencha o e-mail do cliente" name="email" data-inputmask="'alias': 'email'"/>
		</div>
		<div class="control-group">
			<label>Telefone do Cliente</label><input class="input-xxlarge" type="text" name="telefone" data-inputmask="'mask': '(99) 9999-9999[9]'" required x-moz-errormessage="Preencha o telefone do cliente"/>
		</div>
		<button class="btn btn-primary" type="submit">Cadastrar</button>
		<a href="produtoListar.php" class="btn btn-warning">Voltar</a>
	</fieldset>
</form>
<?php include "includes/footer.php"; ?>
