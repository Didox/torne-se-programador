<?php
/**
 * Created by PhpStorm.
 * User: RafaT
 * Date: 08/03/2016
 * Time: 18:10
 */
include_once('template/header.php');

$produtos = new Produtos();
$clientes = new Usuarios();
$pedidos = new Pedidos();
$pega_clientes = $clientes->findAll();
$pega_produtos = $produtos->findAll();

if(isset($_POST['comprar'])):

    $clientes_post = $_POST['cliente'];
    $produtos_post = $_POST['produto'];

    $pedidos->setCliente($clientes_post);
    $pedidos->setProduto($produtos_post);

if($pedidos->insert()):
    echo " <div class='alert alert-success'>
        <strong>Pedido Inserido com Sucesso!</strong>
    </div>";

    endif;
    endif;


?>
    <div id="page-wrapper">
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-6">

                    <form role="form" method="post">

                        <div class="form-group">
                            <label>Selecione para qual cliente deseja comprar </label>
                            <select class="form-control" name="cliente" >
                                <?php foreach($pega_clientes as $cliente ):?>
                                    <option value="<?php echo $cliente->id ?>"><?php echo $cliente->nome_cliente ?> </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Selecione um produto para Comprar </label>
                            <select class="form-control" name="produto">
                                <?php foreach($pega_produtos as $valores ):?>
                                    <option value="<?php echo $valores->id ?>"><?php echo $valores->nome_produto . ' | ' . $valores->preco ?> </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" name="comprar" class="btn btn-default">Comprar Produto</button>
                        </div>
                    </form>
                </div>
           </div>
        </div>
    </div>
<?php include_once('template/footer.php');