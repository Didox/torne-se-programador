<?php include "config.php";

include "includes/header.php";

$sql_produtos = mysql_query("SELECT * FROM produto ORDER BY id ASC");
$sql_clientes = mysql_query("SELECT * FROM cliente ORDER BY id ASC");




?>
<form class="form-horizontal" action="pedidoCad.php" method="post">
	<fieldset>
		<div class="control-group">
			<label>Nome do Cliente</label>
			<select name="nome_cliente" required x-moz-errormessage="Preencha o nome do cliente">
				<option value="">Selecione</option>
				<?php 
					while($cliente = mysql_fetch_object($sql_clientes)){ 
						
						echo "<option value=".$cliente->id. ">". $cliente->nome_cliente ."</option>\n"; 

					} 
				?>
			</select>
		</div>
		<div class="control-group">
			<label>Nome do Produto</label>
			<select name="nome_produto" required x-moz-errormessage="Preencha o nome do produto">
				<option value="">Selecione</option>
				<?php 
					while($produto = mysql_fetch_object($sql_produtos)){ 
						
						echo "<option value=".$produto->id. ">". $produto->nome_produto ."</option>\n"; 

					} 
				?>
			</select>
		</div>
		<button class="btn btn-primary" type="submit">Cadastrar</button>
		<a href="pedidoListar.php" class="btn btn-warning">Voltar</a>
	</fieldset>
</form>
<?php
include "includes/footer.php";

?>
