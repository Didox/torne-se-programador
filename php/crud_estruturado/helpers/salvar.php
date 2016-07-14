<?php include 'conecta.php' ?>
<?php 
mysql_select_db("test", $conecta) or print(mysql_error());

if($_POST['id'] == "0"){
  $query = "insert into teste(nome, sobrenome)values('" . $_POST['nome'] . "', '" . $_POST['sobrenome'] . "')";
}
else{
  $query = "update teste set nome='" . $_POST['nome'] . "', sobrenome='" . $_POST['sobrenome'] . "' where id=". $_POST['id'];
}

echo $query;

if (mysql_query($query, $conecta)) {
    echo "Salvo com sucesso";
  header('Location: /crud');
  exit;
} else {
    echo "Erro: " . $query . "<br>" . mysql_error($conecta);
}

mysql_close($conecta);
?>
