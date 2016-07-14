<?php

require_once('Crud.php');
class Produtos extends Crud
{
    protected $table = 'cadastroprodutos';
    private $nome;
    private $descricao;
    private $preco;

    public function setNome($nome){
        return $this->nome = $nome;
    }

    public function getNome(){
        return $this->nome;
    }

    public function setdescricao($descricao){
        return $this->descricao = $descricao;
    }

    public function getdescricao(){
        return $this->descricao;
    }

    public function setpreco($preco){
        return $this->preco = $preco;
    }

    public function getpreco(){
        return $this->preco;
    }

    public function insert(){
        $sql = "INSERT INTO $this->table (nome_produto ,descricao , preco) VALUES (:nome_produto , :descricao , :preco )";
        $stmt = DB::prepare($sql);
        $stmt->bindParam(':nome_produto' , $this->nome);
        $stmt->bindParam(':descricao' , $this->descricao);
        $stmt->bindParam(':preco' , $this->preco);
        return $stmt->execute();

    }

    public function update($id)
    {
        $sql = "UPDATE $this->table SET nome_produto = :nome_produto , descricao = :descricao , preco= :preco WHERE id = :id";
        $stmt = DB::prepare($sql);
        $stmt->bindParam(':nome_produto' , $this->nome);
        $stmt->bindParam(':descricao' , $this->descricao);
        $stmt->bindParam(':preco' , $this->preco);
        $stmt->bindParam(':id' , $id ,  PDO::PARAM_INT);
        return $stmt->execute();
    }
}