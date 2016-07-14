<?php
$HOST = "localhost";
$USER = "root";
$PASS = "";
$DATABASE = "test";
$CNN = null;

function openCnn(){
  $GLOBALS['CNN'] = mysql_connect($GLOBALS['HOST'], $GLOBALS['USER'], $GLOBALS['PASS']) or print (mysql_error());
  mysql_select_db($GLOBALS['DATABASE'], $GLOBALS['CNN']) or print(mysql_error());
}

function closeCnn(){
  mysql_close($GLOBALS['CNN']);
}
?>