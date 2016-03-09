<?php include "config.php";

include "includes/header.php";


$sql = mysql_query("SELECT * FROM produto ORDER BY id ASC");

$row = mysql_num_rows($sql);

?>
<form class="form-horizontal" action="produtoCad.php" method="post">
	<fieldset>
		<div class="control-group">
			<label>Nome do Produto</label><input class="input-xxlarge" required x-moz-errormessage="Preencha o nome do produto" type="text" name="nome"/>
		</div>
		<div class="control-group">
			<label>Descrição do Produto</label><textarea class="input-xxlarge" rows="5" required x-moz-errormessage="Preencha a descrição do produto" name="descricao"></textarea>
		</div>
		<div class="control-group">
			<label>Preço do Produto</label><input type="text" class="input-xxlarge" data-inputmask="'alias': 'currency'" required x-moz-errormessage="Preencha o preço do produto" name="preco"/>
		</div>
		<button class="btn btn-primary" type="submit">Cadastrar</button>
		<a href="produtoListar.php" class="btn btn-warning">Voltar</a>
	</fieldset>
</form>
<?php include "includes/footer.php"; ?>
