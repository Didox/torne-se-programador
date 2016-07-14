<?php include 'conecta.php' ?>
<?php 
mysql_select_db("test", $conecta) or print(mysql_error()); 
$sql = "SELECT * FROM teste where id=" . $_GET["id"]; 
$result = mysql_query($sql, $conecta); 
?>

<?php 
if($consulta = mysql_fetch_array($result)){
  $id = $consulta["id"];
  $nome = $consulta["nome"];
  $sobrenome = $consulta["sobrenome"];
}
?>

<?php
mysql_free_result($result); 
mysql_close($conecta); 
?>
</table>