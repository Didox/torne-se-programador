<?php 

include "includes/header.php";


$sql = mysql_query("SELECT `pedido`.*, `produto`.`nome_produto`, `cliente`.`nome_cliente` FROM `pedido`
	LEFT JOIN `produto` ON `pedido`.`id_produto` = `produto`.`id`
    LEFT JOIN `cliente` ON `pedido`.`id_cliente` = `cliente`.`id`");

$row = mysql_num_rows($sql);

?>

<script>
function confirmacao() { if (confirm("Deseja excluir esse pedido?")){ return true; } else { return false; } }
</script> 
<h2>Cadastro de Pedidos</h2><br>
<a href="pedidoAdd.php" class="btn btn-success">Adicionar Pedido <i class="icon-plus icon-black"></i></a>
<table class="table table-bordered">
	<thead>
		<th>Id do Pedido</th>
		<th>Id do Cliente</th>
		<th>Cliente</th>
		<th>Id do Produto</th>
		<th>Produto</th>
		<th>Ação</th>
	</thead>
	<tbody>
		<?php 
			while($pedido = mysql_fetch_assoc($sql)) {
		?>
		<tr>
			<td><?php echo $pedido['id_pedido']; ?></td>
			<td><?php echo $pedido['id_cliente']; ?></td>
			<td><?php echo $pedido['nome_cliente']; ?></td>
			<td><?php echo $pedido['id_produto']; ?></td>
			<td><?php echo $pedido['nome_produto']; ?></td>
			
			<td>
				<a href="pedidoDel.php?id=<?php echo $pedido['id_pedido'];?>" onclick="return confirmacao();" class="btn"><i class="icon-trash"></i> </a>
			</td>
		</tr>
		<?php } 

		if ( $row == 0 ){ echo "<tr><td colspan='6'>Nenhum pedido encontrado.</td></tr>"; } ?>
	</tbody>
</table>
<?php
include "includes/footer.php";

?>