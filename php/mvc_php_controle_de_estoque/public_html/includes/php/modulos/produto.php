<h1 class="page-header">Produtos</h1>

<?php
  use app\view\produto as produtoView;
  use system\recursos\util;

  $produto=new produtoView();

	if(isset($_GET['acao']) AND ($_GET['acao'] === 'novo' || $_GET['acao'] === 'editar'))
  {
	//Produto(id,nome,descrição,preço)
    $dados=$produto->getDados();
    $mensagem=$produto->getMensagem();
?>
    <h4>Cadastro de novo Produto</h4>
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
        <input type="text" required class="form-control" id="nome" name="nome" placeholder="Nome do produto" value="<?php echo $dados['nome']; ?>" />
      </fieldset>

      <fieldset class="form-group">
        <label for="descricao">Descrição</label>
        <textarea class="form-control" id="descricao" name="descricao" required rows="3" cols="8" placeholder="Descrição do produto"><?php echo $dados['descricao']; ?></textarea>
      </fieldset>

      <div class="form-group">
        <label for="preco">Preço</label>
        <input type="number" required step="0.01" min="0" class="form-control" id="preco" name="preco" placeholder="Valor do produto" value="<?php echo $dados['preco']; ?>" />
      </div>

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
    $dados=$produto->getProdutos();
?>
    <h4>Produtos cadastrados</h4>
    <?php
      if(!empty($dados))
      {
    ?>
        <table class="table table-condensed">
          <thead>
            <tr>
              <th>Nome</th>
              <th>Descrição</th>
              <th>Preço</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
    <?php
        foreach($dados as $produto)
        {
      ?>
              <tr>
                <td><?php echo $produto['nome']; ?></td>
                <td><?php echo $produto['descricao']; ?></td>
                <td><?php echo $produto['preco']; ?></td>
                <td>
                  <a href="?modulo=<?php echo $_GET['modulo']; ?>&acao=editar&id=<?php echo $produto['id']; ?>" title="Editar registro" alt="Editar registro" class="btn btn-warning pull-left btn-xs">Editar</a>
                  
                  <form action="" method="post" class="pull-left" style="margin-left:5px;" name="remove">
                    <input type="hidden" name="id" value="<?php echo $produto['id']; ?>" />
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
      else echo '<p>Nenhum produto cadastrado.</p>';
  }
?>