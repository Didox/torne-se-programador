<?php $link = mysql_connect('localhost', 'root', 'root');
if (!$link) {
    die('Não foi possível conectar: ' . mysql_error());
}

$db = mysql_select_db("estoque",$link);

if (!$db) {
    die('Banco de Dados não encontrado: ' . mysql_error());
}

?>