<?php 

include "includes/header.php";

$lista_clientes = mysql_query("SELECT * FROM cliente ORDER BY id ASC");

$lista_pedidos = mysql_query("SELECT `pedido`.*, `produto`.`nome_produto`, `cliente`.`nome_cliente` FROM `pedido`
	LEFT JOIN `produto` ON `pedido`.`id_produto` = `produto`.`id`
    LEFT JOIN `cliente` ON `pedido`.`id_cliente` = `cliente`.`id`");

$lista_produtos = mysql_query("SELECT * FROM produto ORDER BY id ASC");

$row_clientes = mysql_num_rows($lista_clientes);
$row_produtos = mysql_num_rows($lista_produtos);
$row_pedidos = mysql_num_rows($lista_pedidos);

?>
	<body>

	<h2>Lista de Pedidos</h2><br>
	<table class="table table-bordered">
		<thead>
			<th>Id do Pedido</th>
			<th>Id do Cliente</th>
			<th>Cliente</th>
			<th>Id do Produto</th>
			<th>Produto</th>
		</thead>
		<tbody>
			<?php 
				while($pedido = mysql_fetch_assoc($lista_pedidos)) {
			?>
			<tr>
				<td><?php echo $pedido['id_pedido']; ?></td>
				<td><?php echo $pedido['id_cliente']; ?></td>
				<td><?php echo $pedido['nome_cliente']; ?></td>
				<td><?php echo $pedido['id_produto']; ?></td>
				<td><?php echo $pedido['nome_produto']; ?></td>
			</tr>
			<?php } 

			if ( $row_pedidos == 0 ){ echo "<tr><td colspan='6'>Nenhum pedido encontrado.</td></tr>"; } ?>
		</tbody>
	</table>

	<h2>Lista de Clientes</h2><br>
	<table class="table table-bordered">
		<thead>
			<th>ID</th>
			<th>Nome</th>
			<th>E-mail</th>
			<th>Telefone</th>
		</thead>
		<tbody>
			<?php 
				while($cliente = mysql_fetch_assoc($lista_clientes)) {
			?>
			<tr>
				<td><?php echo $cliente['id']; ?></td>
				<td><?php echo $cliente['nome_cliente']; ?></td>
				<td><?php echo $cliente['email_cliente']; ?></td>
				<td><?php echo $cliente['telefone_cliente']; ?></td>
			</tr>
			<?php } 

			if ( $row_clientes == 0 ){ echo "<tr><td colspan='5'>Nenhum cliente encontrado.</td></tr>"; } ?>
		</tbody>
	</table>



	<h2>Lista de Produtos</h2><br>
	<table class="table table-bordered">
	<thead>
		<th>ID</th>
		<th>Produto</th>
		<th>Descrição</th>
		<th>Preço</th>
	</thead>
	<tbody>
		<?php 
			while($produtos = mysql_fetch_assoc($lista_produtos)) {
		?>
		<tr>
			<td><?php echo $produtos['id']; ?></td>
			<td><?php echo $produtos['nome_produto']; ?></td>
			<td><?php echo $produtos['descricao_produto']; ?></td>
			<td>R$ <?php echo $produtos['preco_produto']; ?></td>
		</tr>
		<?php } 

		if ( $row_produtos == 0 ){ echo "<tr><td colspan='5'>Nenhum produto encontrado.</td></tr>"; } ?>
	</tbody>
</table>
		
	</body>
<?php
include "includes/footer.php";

?>