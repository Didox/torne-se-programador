<?php
/**
 * Created by PhpStorm.
 * User: RafaT
 * Date: 08/03/2016
 * Time: 18:10
 */
include_once('template/header.php');

$usuario = new Usuarios();

if(isset($_POST['cadastrar'])):

$nome  = $_POST['nome'];
$telefone = $_POST['telefone'];
$email = $_POST['email'];

$usuario->setNome($nome);
$usuario->setTelefone($telefone);
$usuario->setEmail($email);

# Insert
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
                            <label>E-mail</label>
                            <input type="text"  class="form-control" name="email" placeholder="Nome:" />
                        </div>
                        <div class="form-group">
                            <label>Telefone</label>
                            <input type="text"  class="form-control" name="telefone" placeholder="Telefone:" />
                        </div>
                        <div class="form-group">
                            <button type="submit" name="cadastrar" class="btn btn-default">Cadastrar Cliente</button>
                        </div>
                    </form>
                    <?php if($usuario->insert()):?>
                        <div class="alert alert-success">
                            <strong>Cadastro Inserido com Sucesso!</strong>
                         </div>
                    <?php endif; ?>
                </div>
           </div>
        </div>
    </div>
<?php include_once('template/footer.php');