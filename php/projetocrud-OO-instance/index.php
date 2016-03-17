<?php
	include_once('template/header.php');

$produto = new Produtos();
?>
	<div id="page-wrapper">
		<div class="container-fluid">
				<div class="col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Produtos</h3>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-bordered table-hover table-striped">

									<?php
									if(isset($_GET['acao']) && $_GET['acao'] == 'deletar'):

										$id = (int)$_GET['id'];
										if($produto->Delete($id)){
											echo "Deletado com sucesso!";
										}

									endif;
									?>

									<table class="table table-hover">

										<thead>
										<tr>
											<th>#</th>
											<th>Nome:</th>
											<th>Descrição:</th>
											<th>Preço:</th>
											<th>Ações:</th>
										</tr>
										</thead>

										<?php foreach($produto->findAll() as $value): ?>

											<tbody>
											<tr>
												<td><?php echo $value->id; ?></td>
												<td><?php echo $value->nome_produto; ?></td>
												<td><?php echo $value->descricao; ?></td>
												<td><?php echo $value->preco; ?></td>
												<td>
													<?php echo "<a href='editar_produto.php?acao=editar&id=" . $value->id . "'>Editar</a>"; ?>
													<?php echo "<a href='index.php?acao=deletar&id=" . $value->id . "' onclick='return confirm(\"Deseja realmente deletar?\")'>Deletar</a>"; ?>
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
