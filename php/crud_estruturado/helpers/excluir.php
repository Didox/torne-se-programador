<?php include 'conecta.php' ?>
<?php 
mysql_select_db("test", $conecta) or print(mysql_error());
$query = "delete from teste where id=". $_GET['id'];

echo $query;

if (mysql_query($query, $conecta)) {
    echo "Apagado com sucesso";
	header('Location: /crud');
	exit;
} else {
    echo "Erro: " . $query . "<br>" . mysql_error($conecta);
}

mysql_close($conecta);
?>
