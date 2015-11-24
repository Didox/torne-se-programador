<?php 
$conecta = mysql_connect("localhost", "root", "") or print (mysql_error()); 
mysql_select_db("test", $conecta) or print(mysql_error()); 
$sql = "SELECT * FROM teste"; 
$result = mysql_query($sql, $conecta); 
?>

<?php if(mysql_num_rows($result) > 0){ ?>
  <table border="1">
    <thead>
      <tr>
        <th>Nome</th>
        <th>Sobrenome</th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <?php while($consulta = mysql_fetch_array($result)) { ?>
      <tr>
        <td><?php echo $consulta["nome"] ?></td>
        <td><?php echo $consulta["sobrenome"] ?></td>
        <td><a href="/crud/alterar.php?id=<?php echo $consulta["id"] ?>" >Alterar</a></td>
        <td><a href="#" onclick="if(confirm('Deseja excluir?')){ window.location.href='/crud/helpers/excluir.php?id=<?php echo $consulta["id"] ?>' }">Excluir</a></td>
      </tr>
    <?php } ?>
<?php } else { ?>
    <b>Nenhum registro cadastrado</b>
<?php } ?>

<?php
mysql_free_result($result); 
mysql_close($conecta); 
?>
</table>