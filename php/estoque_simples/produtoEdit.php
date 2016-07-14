<?php include "config.php";

include "includes/header.php";

$id = $_GET['id'];

$sql = mysql_query("SELECT * FROM produto WHERE id = '$id' ");

$produtos = mysql_fetch_assoc($sql);

?>
<h2>Atualização de clientes</h2><br>
<form class="form-horizontal" action="produtoEdita.php" method="post">
	<fieldset>
		<input type="hidden" name="id" value="<?php echo $produtos['id']; ?>">
		<div class="control-group">
			<label>Nome do Produto</label><input class="input-xxlarge" type="text" name="nome" value="<?php echo $produtos['nome_produto']; ?>"/>
		</div>
		<div class="control-group">
			<label>Descrição do Produto</label><textarea class="input-xxlarge" rows="5" name="descricao"><?php echo $produtos['descricao_produto']; ?></textarea>
		</div>
		<div class="control-group">
			<label>Preço do Produto</label><input type="text" class="input-xxlarge" data-inputmask="'alias': 'currency'" name="preco" value="<?php echo $produtos['preco_produto']; ?>"/>
		</div>
		<button class="btn btn-primary" type="submit">Atualizar</button>
		<a href="produtoListar.php" class="btn btn-warning">Voltar</a>
	</fieldset>
</form>
<?php include "includes/footer.php"; ?>
