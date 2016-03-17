<?php

require_once('Crud.php');
class Pedidos extends Crud
{
    protected $table = 'cadastroprodutos';
    protected $table2 = 'cadastroclientes';
    protected $table3 = 'pedidos';
    private $cliente;
    private $produto;

    public function setCliente($cliente){
        return $this->cliente = $cliente;
    }

    public function setProduto($produto){
        return $this->produto = $produto;
    }


    public function insert(){
        $sql = "INSERT INTO $this->table3 (id_produto , id_cliente) VALUES (:id_produto , :id_cliente)";
        $stmt = DB::prepare($sql);
        $stmt->bindParam(':id_produto' , $this->produto);
        $stmt->bindParam(':id_cliente' , $this->cliente);
        return $stmt->execute();

    }

    public function findPedidos(){
        $sql = "SELECT * FROM $this->table as a INNER JOIN $this->table2 as b INNER JOIN $this->table3 as c on c.id_produto = a.id AND id_cliente = b.id ORDER BY c.id";
        $stmt = DB::prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function deletePedidos($id){
        $sql = "DELETE FROM $this->table3 WHERE id = :id";
        $stmt = DB::prepare($sql);
        $stmt->bindParam(':id' , $id, PDO::PARAM_INT);
        return $stmt->execute();
    }
    public function update($id)
    {
        $sql = "UPDATE $this->table SET nome = :nome , descricao = :descricao , preco= :preco WHERE id = :id";
        $stmt = DB::prepare($sql);
        $stmt->bindParam(':nome' , $this->nome);
        $stmt->bindParam(':descricao' , $this->descricao);
        $stmt->bindParam(':preco' , $this->preco);
        $stmt->bindParam(':id' , $id ,  PDO::PARAM_INT);
        return $stmt->execute();
    }
}