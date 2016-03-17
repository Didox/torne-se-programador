<?php
/**
 * Created by PhpStorm.
 * User: RafaT
 * Date: 08/03/2016
 * Time: 18:10
 */
include_once('template/header.php');


$usuario = new Usuarios();
if(isset($_GET['acao']) && $_GET['acao'] == 'editar'):
    $id = (int)$_GET['id'];
    $resultado = $usuario->find($id);

    if (isset($_POST['atualizar'])):
        $nome  = $_POST['nome_cliente'];
        $telefone = $_POST['telefone'];
        $email = $_POST['email'];
        $usuario->setNome($nome);
        $usuario->setEmail($email);
        $usuario->setTelefone($telefone);
     if($usuario->update($id)):
        echo "<div class='alert alert-success'>
           <strong>Cadastro Inserido com Sucesso!</strong>
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
                            <input type="text"  class="form-control" name="nome_cliente" value="<?php echo $resultado->nome_cliente; ?>" placeholder="Nome:" />
                        </div>
                        <div class="form-group">
                            <label>E-mail</label>
                            <input type="text"  class="form-control" name="email" value="<?php echo $resultado->email; ?>" placeholder="Nome:" />
                        </div>
                        <div class="form-group">
                            <label>Telefone</label>
                            <input type="text"  class="form-control" name="telefone" value="<?php echo $resultado->telefone; ?>" placeholder="Telefone:" />
                        </div>
                        <div class="form-group">
                            <button type="submit" name="atualizar" class="btn btn-default">Atualizar Cliente</button>
                        </div>
                    </form>
                </div>
           </div>
        </div>
    </div>
<?php include_once('template/footer.php'); ?>