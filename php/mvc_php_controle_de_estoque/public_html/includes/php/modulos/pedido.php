<h1 class="page-header">Pedidos</h1>

<?php
  use app\view\pedido as pedidoView;
  use system\recursos\util;

  $pedido=new pedidoView();

  if(isset($_GET['acao']) AND ($_GET['acao'] === 'novo' || $_GET['acao'] === 'editar'))
	{
	//Pedido(id_produto, id_cliente)
    $dados=$pedido->getDados();
    $mensagem=$pedido->getMensagem();

    $clientes=$pedido->getClientes();
    $produtos=$pedido->getProdutos();
?>
    <h4>Cadastro de novo Pedido</h4>
		<form action="" method="post">
      <?php
        if(!empty($mensagem))
        {
      ?>
        <div class="alert alert-<?php echo $mensagem['class']; ?>">
          <?php echo $mensagem['message']; ?>
        </div>
      <?php
        }
      ?>

      <fieldset class="form-group">
        <label for="nome">Cliente</label>
        <select class="form-control" name="cliente" required>
          <?php
            if(!empty($clientes))
            {
              echo '<option value="">Selecione...</option>';
              foreach($clientes as $cliente)
              {
                echo '<option value="'.$cliente['id'].'">'.$cliente['nome'].'</option>';
              }
            }
            else echo '<option value="">Nenhum cliente cadastrado.</option>';
          ?>
        </select>
      </fieldset>

      <fieldset class="form-group">
        <label for="nome">Produto</label>
        <select class="form-control" name="produto" required>
          <?php
            if(!empty($produtos))
            {
              echo '<option value="">Selecione...</option>';
              foreach($produtos as $produto)
              {
                echo '<option value="'.$produto['id'].'">'.$produto['nome'].'</option>';
              }
            }
            else echo '<option value="">Nenhum produto cadastrado.</option>';
          ?>
        </select>
      </fieldset>

      <button type="submit" class="btn btn-primary">
        <?php
          if(isset($_GET['id']) AND is_numeric($_GET['id']) AND $_GET['id'] >0) echo 'Salvar';
          else echo 'Cadastrar';
        ?>
      </button>
    </form>
<?php
	}
	else
	{
    $dados=$pedido->getPedidos();
?>
    <h4>Pedidos cadastrados</h4>
    <?php
      if(!empty($dados))
      {
    ?>
        <table class="table table-condensed">
          <thead>
            <tr>
              <th>Produto</th>
              <th>Cliente</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
    <?php
        foreach($dados as $produto)
        {
      ?>
              <tr>
                <td><?php echo $produto['produto_nome']; ?></td>
                <td><?php echo $produto['cliente_nome']; ?></td>
                <td>                  
                  <form action="" method="post" class="pull-left" style="margin-left:5px;" name="remove">
                    <input type="hidden" name="produto" value="<?php echo $produto['produto']; ?>" />
                    <input type="hidden" name="cliente" value="<?php echo $produto['cliente']; ?>" />
                    <input type="hidden" name="action" value="remove" />

                    <button type="submit" class="btn btn-danger btn-xs" title="Remover registro">Remover</button>
                  </form>
                </td>
              </tr>
      <?php
        }
      ?>
          </tbody>
        </table>

<?php
      }
      else echo '<p>Nenhum pedido cadastrado.</p>';
  }
?>