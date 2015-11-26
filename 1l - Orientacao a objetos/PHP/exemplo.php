<br>
<br>
<br>

<?php
// http://code.tutsplus.com/tutorials/object-oriented-php-for-beginners--net-12762

class MyClass{

  public function __construct($teste = '')
  {
    echo 'The class "', __CLASS__, '" was initiated!<br />' . $teste . "<br>";
  }

  public function __destruct()
  {
      echo 'The class "', __CLASS__, '" was destroyed.<br />';
  }

  public function __toString()
  {
      echo "Using the toString method: ";
      return $this->getProperty();
  }

  public $propriedade = "Minha propriedade";
  public $prop1 = "";

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

class MyOtherClass extends MyClass
{
  public function newMethod()
  {
      echo "From a new method in " . __CLASS__ . ".<br />";
  }
}

// class MyOtherClass extends MyClass
// {
//   public function __construct()
//   {
//     parent::__construct();
//     echo "A new constructor in " . __CLASS__ . ".<br />";
//   }
 
//   public function newMethod()
//   {
//     echo "From a new method in " . __CLASS__ . ".<br />";
//   }
// }
 
$obj = new MyClass('bla bla bla');

// Create a new object
$newobj = new MyOtherClass;
 
// Output the object as a string
echo $newobj->newMethod();
 
// Use a method from the parent class
echo $newobj->getProperty();
 
// === print objeto ===
//var_dump($obj);
?>

<?php echo $obj->propriedade; ?><br>
<?php echo $obj->acao('Propri'); ?>