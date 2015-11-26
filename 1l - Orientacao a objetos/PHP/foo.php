<br>
<br>
<br>

<?php
 
class MyClass{
  public $propriedade = "Minha propriedade";

  public function acao($attr){
    return "Minha function - " .$attr;
  }

  public function setProperty($newval){
    $this->prop1 = $newval;
  }
 
  public function getProperty(){
    return $this->prop1 . "<br />";
  }
}
 
$obj = new MyClass;
 
// === print objeto ===
//var_dump($obj);
?>

<?php echo $obj->propriedade; ?><br>
<?php echo $obj->acao('Propri'); ?>