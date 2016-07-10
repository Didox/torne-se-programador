<h1 class="page-header">Clientes</h1>

<?php
  use app\view\cliente as clienteView;
  use system\recursos\util;

  $cliente=new clienteView();
  
  if(isset($_GET['acao']) AND ($_GET['acao'] === 'novo' || $_GET['acao'] === 'editar'))
  {
  //Cliente(id,nome,email,telefone)
    $dados=$cliente->getDados();
    $mensagem=$cliente->getMensagem();
?>
    <h4>Cadastro de novo Cliente</h4>
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
        <label for="nome">Nome</label>
        <input type="text" required class="form-control" id="nome" name="nome" placeholder="Nome do cliente" value="<?php echo $dados['nome']; ?>" />
      </fieldset>

      <fieldset class="form-group">
        <label for="email">E-mail</label>
        <input type="email" required class="form-control" id="email" name="email" placeholder="E-mail de contato do cliente" value="<?php echo $dados['email']; ?>" />
        <small class="text-muted">Utilizado para login pelo cliente.</small>
      </fieldset>

      <fieldset class="form-group">
        <label for="telefone">Telefone</label>
        <input type="text" class="form-control" id="telefone" name="telefone" value="<?php echo $dados['telefone']; ?>" />
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
    $dados=$cliente->getClientes();
?>
    <h4>Clientes cadastrados</h4>

    <?php
      if(!empty($dados))
      {
    ?>
        <table class="table table-condensed">
          <thead>
            <tr>
              <th>Nome</th>
              <th>E-mail</th>
              <th>Telefone</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
    <?php
        foreach($dados as $cliente)
        {
      ?>
              <tr>
                <td><?php echo $cliente['nome']; ?></td>
                <td><?php echo $cliente['email']; ?></td>
                <td><?php echo $cliente['telefone']; ?></td>
                <td>
                  <a href="?modulo=<?php echo $_GET['modulo']; ?>&acao=editar&id=<?php echo $cliente['id']; ?>" title="Editar registro" alt="Editar registro" class="btn btn-warning pull-left btn-xs">Editar</a>
                  
                  <form action="" method="post" class="pull-left" style="margin-left:5px;" name="remove">
                    <input type="hidden" name="id" value="<?php echo $cliente['id']; ?>" />
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
      else echo '<p>Nenhum cliente cadastrado.</p>';
	}
?>

<script src='includes/js/jquery.mask.min.js'></script>