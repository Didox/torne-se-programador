<?php include "config.php";

include "includes/header.php";

$id = $_GET['id'];

$sql = mysql_query("SELECT * FROM pedido,produto,cliente WHERE id_pedido = '$id' ");

$pedido = mysql_fetch_assoc($sql);

?>
<h2>Atualização de Pedidos</h2><br>
<form class="form-horizontal" action="pedidoEdita.php" method="post">
	<fieldset>
		<input type="hidden" name="id" value="<?php echo $pedido['id']; ?>">
		<div class="control-group">
			<label>Id do Pedido</label><input class="input-xxlarge" type="text" name="nome" value="<?php echo $pedido['id_pedido']; ?>"/>
		</div>
		<div class="control-group">
			<label>Nome do Produto</label><input class="input-xxlarge" type="text" name="nome" value="<?php echo $pedido['nome_produto']; ?>"/>
		</div>
		<div class="control-group">
			<label>Nome do Produto</label><input class="input-xxlarge" type="text" name="nome" value="<?php echo $pedido['nome_produto']; ?>"/>
		</div>
		<button class="btn btn-primary" type="submit">Atualizar</button>
		<a href="produtoListar.php" class="btn btn-warning">Voltar</a>
	</fieldset>
</form>
<?php
include "includes/footer.php";

?>
