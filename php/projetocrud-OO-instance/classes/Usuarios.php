<?php

require_once('Crud.php');
class Usuarios extends Crud
{
    protected $table = 'cadastroclientes';
    private $nome;
    private $telefone;
    private $email;

    public function setNome($nome){
        return $this->nome = $nome;
    }

    public function getNome(){
        return $this->nome;
    }

    public function setTelefone($telefone){
        return $this->telefone = $telefone;
    }

    public function getTelefone(){
        return $this->telefone;
    }

    public function setEmail($email){
        return $this->email = $email;
    }

    public function getEmail(){
        return $this->email;
    }

    public function insert(){
        $sql = "INSERT INTO $this->table (nome_cliente ,telefone , email) VALUES (:nome_cliente , :telefone , :email )";
        $stmt = DB::prepare($sql);
        $stmt->bindParam(':nome_cliente' , $this->nome);
        $stmt->bindParam(':telefone' , $this->telefone);
        $stmt->bindParam(':email' , $this->email);
        return $stmt->execute();

    }

    public function update($id)
    {
        $sql = "UPDATE $this->table SET nome_cliente = :nome_cliente , telefone = :telefone , email= :email WHERE id = :id";
        $stmt = DB::prepare($sql);
        $stmt->bindParam(':nome_cliente' , $this->nome);
        $stmt->bindParam(':telefone' , $this->telefone);
        $stmt->bindParam(':email' , $this->email);
        $stmt->bindParam(':id' , $id ,  PDO::PARAM_INT);
        return $stmt->execute();
    }
}