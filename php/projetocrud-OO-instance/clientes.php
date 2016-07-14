<?php
	include_once('template/header.php');

$usuario = new Usuarios();
?>
	<div id="page-wrapper">
		<div class="container-fluid">
				<div class="col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Clientes</h3>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-bordered table-hover table-striped">

									<?php
									if(isset($_GET['acao']) && $_GET['acao'] == 'deletar'):

										$id = (int)$_GET['id'];
										if($usuario->Delete($id)){
											echo "Deletado com sucesso!";
										}

									endif;
									?>

									<table class="table table-hover">

										<thead>
										<tr>
											<th>#</th>
											<th>Nome:</th>
											<th>Telefone:</th>
											<th>E-mail:</th>
											<th>Ações:</th>
										</tr>
										</thead>

										<?php foreach($usuario->findAll() as $value): ?>

											<tbody>
											<tr>
												<td><?php echo $value->id; ?></td>
												<td><?php echo $value->nome_cliente; ?></td>
												<td><?php echo $value->telefone; ?></td>
												<td><?php echo $value->email; ?></td>
												<td>
													<?php echo "<a href='editar_cliente.php?acao=editar&id=" . $value->id . "'>Editar</a>"; ?>
													<?php echo "<a href='clientes.php?acao=deletar&id=" . $value->id . "' onclick='return confirm(\"Deseja realmente deletar?\")'>Deletar</a>"; ?>
												</td>
											</tr>
											</tbody>


										<?php endforeach; ?>
									</table>

								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->

		</div>
		<!-- /.container-fluid -->

<?php include_once('template/footer.php');
