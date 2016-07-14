<?php include "includes/header.php";

$sql = mysql_query("SELECT * FROM cliente ORDER BY id ASC");

$row = mysql_num_rows($sql);

?>

<script>
function confirmacao() { if (confirm("Deseja excluir esse cliente?")){ return true; } else { return false; } }
</script>
<h2>Cadastro de Clientes</h2><br>
<a href="clienteAdd.php" class="btn btn-success">Adicionar Cliente <i class="icon-plus icon-black"></i></a>
<table class="table table-bordered">
	<thead>
		<th>ID</th>
		<th>Nome</th>
		<th>E-mail</th>
		<th>Telefone</th>
		<th>Ação</th>
	</thead>
	<tbody>
		<?php 
			while($cliente = mysql_fetch_assoc($sql)) {
		?>
		<tr>
			<td><?php echo $cliente['id']; ?></td>
			<td><?php echo $cliente['nome_cliente']; ?></td>
			<td><?php echo $cliente['email_cliente']; ?></td>
			<td><?php echo $cliente['telefone_cliente']; ?></td>
			<td>
				<a href="clienteEdit.php?id=<?php echo $cliente['id'];?>" class="btn"><i class="icon-pencil"></i> </a>
				<a href="clienteDel.php?id=<?php echo $cliente['id'];?>" onclick="return confirmacao();" class="btn"><i class="icon-trash"></i> </a>
			</td>
		</tr>
		<?php } 

		if ( $row == 0 ){ echo "<tr><td colspan='5'>Nenhum cliente encontrado.</td></tr>"; } ?>
	</tbody>
</table>
<?php
include "includes/footer.php";

?>