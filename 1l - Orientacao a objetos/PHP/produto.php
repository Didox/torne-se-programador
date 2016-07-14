<?php
include dirname(__DIR__).'/db/cnn.php';

class Produto{
  public function __construct($id = 0, $nome = "", $preco = "")
  {
    $this->id = $id;
    $this->nome = $nome;
    $this->preco = $preco;
  }

  public $id = 0;
  public $nome = "";
  public $preco = 0;

  public function salvar(){
    openCnn();

    if($this->id == 0){
      $query = "insert into produtos(nome, preco)values('" . $this->nome . "', '" . $this->preco . "')";
    }
    else{
      $query = "update produtos set nome='" . $this->nome . "', preco='" . $this->preco . "' where id=". $this->id;
    }

    $return = false;

    if (mysql_query($query, $GLOBALS['CNN'])){
      $return = true;
    }

    closeCnn();

    return $return;
  }

  public static function find($id = 0){
    openCnn();

    $sql = "SELECT * FROM produtos";
    if($id != 0){
      $sql = $sql." where id=".$id;
    }

    $result = mysql_query($sql, $GLOBALS['CNN']);
    $produtos = [];
    while($consulta = mysql_fetch_array($result)){
      $p = new Produto();
      $p->id = $consulta["id"];
      $p->nome = $consulta["nome"];
      $p->preco = $consulta["preco"];
      $produtos[] = $p;
    }
    mysql_free_result($result); 
    closeCnn();

    return $produtos;
  }

  public static function excluir($id){
    openCnn();

    $return = false;

    $query = "delete FROM produtos where id=".$id;
    if (mysql_query($query, $GLOBALS['CNN'])){
      $return = true;
    }

    closeCnn();

    return $return;
  }
}

?>