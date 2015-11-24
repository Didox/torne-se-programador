<?php $produtos = Produto::find(); ?>
<?php if(count($produtos) > 0){ ?>
  <table border="1">
    <thead>
      <tr>
        <th>Nome</th>
        <th>Sobrenome</th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <?php foreach ($produtos as $produto){ ?>
      <tr>
        <td><?php echo $produto->nome ?></td>
        <td><?php echo $produto->preco ?></td>
        <td><a href="/crud/produtos/alterar.php?id=<?php echo $produto->id ?>" >Alterar</a></td>
        <td><a href="#" onclick="if(confirm('Deseja excluir?')){ window.location.href='/crud/controllers/produtos/excluir.php?id=<?php echo $produto->id ?>' }">Excluir</a></td>
      </tr>
    <?php } ?>
  </table>
<?php } else { ?>
    <b>Nenhum registro cadastrado</b>
<?php } ?>
