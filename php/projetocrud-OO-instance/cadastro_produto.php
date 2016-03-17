<?php
/**
 * Created by PhpStorm.
 * User: RafaT
 * Date: 08/03/2016
 * Time: 18:10
 */
include_once('template/header.php');

$produtos = new Produtos();

if(isset($_POST['cadastro_produto'])):

$nome  = $_POST['nome'];
$descricao = $_POST['descricao'];
$preco = $_POST['preco'];

$produtos->setNome($nome);
$produtos->setdescricao($descricao);
$produtos->setpreco($preco);

if($produtos->insert()):
   echo " <div class='alert alert-success'>
        <strong>Cadastro Inserido com Sucesso!</strong>
    </div>";

# Insert
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
                            <input type="text"  class="form-control" name="nome" placeholder="Nome:" />
                        </div>
                        <div class="form-group">
                            <label>Descricao</label>
                            <textarea class="form-control" name="descricao" placeholder="descricao:"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Preço</label>
                            <input type="text"  class="form-control" name="preco" placeholder="Preço:" />
                        </div>
                        <div class="form-group">
                            <button type="submit" name="cadastro_produto" class="btn btn-default">Cadastrar Produto</button>
                        </div>
                    </form>

                </div>
           </div>
        </div>
    </div>
<?php include_once('template/footer.php');