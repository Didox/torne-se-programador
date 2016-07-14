<?php
/**
 * Created by PhpStorm.
 * User: RafaT
 * Date: 08/03/2016
 * Time: 18:10
 */
include_once('template/header.php');


$produto = new Produtos();
if(isset($_GET['acao']) && $_GET['acao'] == 'editar'):
    $id = (int)$_GET['id'];
    $resultado = $produto->find($id);

  if (isset($_POST['atualizar_produto'])):
    $nome  = $_POST['nome_produto'];
    $descricao = $_POST['descricao'];
    $preco = $_POST['preco'];
    $produto->setNome($nome);
    $produto->setpreco($preco);
    $produto->setdescricao($descricao);
    if($produto->update($id)):
   echo" <div class='alert alert-success'>
        <strong>Produto Atualizado com Sucesso!</strong>
    </div>";
endif;
endif;
endif;
?>
    <div id="page-wrapper">
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-6">

                    <form role="form" method="post">

                        <div class="form-group">
                            <label>Nome</label>
                            <input type="text"  class="form-control" name="nome_produto" value="<?php echo $resultado->nome_produto; ?>" placeholder="Nome:" />
                        </div>
                        <div class="form-group">
                            <label>E-mail</label>
                            <input type="text"  class="form-control" name="preco" value="<?php echo $resultado->preco; ?>" placeholder="Nome:" />
                        </div>
                        <div class="form-group">
                            <label>descricao</label>
                            <input type="text"  class="form-control" name="descricao" value="<?php echo $resultado->descricao; ?>" placeholder="descricao:" />
                        </div>
                        <div class="form-group">
                            <button type="submit" name="atualizar_produto" class="btn btn-default">Atualizar Produto</button>
                        </div>
                    </form>
                </div>
           </div>
        </div>
    </div>
<?php include_once('template/footer.php'); ?>