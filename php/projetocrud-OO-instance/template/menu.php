<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.php">Admin Altran</a>
		</div>
		<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li class="active">
					<a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Clientes <i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="demo" class="collapse">
						<li>
							<a href="clientes.php">Ver todos os clientes</a>
						</li>
						<li>
							<a href="cadastro_cliente.php">Adicionar novo</a>
						</li>
					</ul>

				</li>
				<li>
					<a href="javascript:;" data-toggle="collapse" data-target="#produto"><i class="fa fa-fw fa-arrows-v"></i> Produtos <i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="produto" class="collapse">
						<li>
							<a href="index.php">Ver todos os produtos</a>
						</li>
						<li>
							<a href="cadastro_produto.php">Adicionar novo</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="javascript:;" data-toggle="collapse" data-target="#pedidos"><i class="fa fa-fw fa-arrows-v"></i> Pedidos <i class="fa fa-fw fa-caret-down"></i></a>
					<ul id="pedidos" class="collapse">
						<li>
							<a href="pedidos_page.php">Ver todos os pedidos</a>
						</li>
						<li>
							<a href="cadastro_pedido.php">Adicionar novo</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>