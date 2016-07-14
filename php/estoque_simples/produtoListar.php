<?php include "config.php";

include "includes/header.php";


$sql = mysql_query("SELECT * FROM produto ORDER BY id ASC");

$row = mysql_num_rows($sql);

?>

<script>
function confirmacao() { if (confirm("Deseja excluir esse produto?")){ return true; } else { return false; } }
</script>
<h2>Cadastro de Produtos</h2><br>
<a href="produtoAdd.php" class="btn btn-success">Adicionar Produto <i class="icon-plus icon-black"></i></a><br>
<table class="table table-bordered">
	<thead>
		<th>ID</th>
		<th>Produto</th>
		<th>Descrição</th>
		<th>Preço</th>
		<th>Ação</th>
	</thead>
	<tbody>
		<?php 
			while($produtos = mysql_fetch_assoc($sql)) {
		?>
		<tr>
			<td><?php echo $produtos['id']; ?></td>
			<td><?php echo $produtos['nome_produto']; ?></td>
			<td><?php echo $produtos['descricao_produto']; ?></td>
			<td><?php echo $produtos['preco_produto']; ?></td>
			<td>
				<a href="produtoEdit.php?id=<?php echo $produtos['id'];?>" class="btn"><i class="icon-pencil"></i> </a>
				<a href="produtoDel.php?id=<?php echo $produtos['id'];?>" onclick="return confirmacao();" class="btn"><i class="icon-trash"></i> </a>
			</td>
		</tr>
		<?php } 

		if ( $row == 0 ){ echo "<tr><td colspan='5'>Nenhum produto encontrado.</td></tr>"; } ?>
	</tbody>
</table>
<?php include "includes/footer.php"; ?>