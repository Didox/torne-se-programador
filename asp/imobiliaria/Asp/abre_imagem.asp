<!--#INCLUDE FILE ="chamar_banco.asp"-->
<%
Set rsImg = conn.execute("Select * from registro_foto where codigo = "&request("codimg"))
%>
<html>
<head>
<title>Plenanet - Seu Portal Imobiliário</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="estilo.css" type="text/css">
</head>
<body>
<form name="formimg" id="formimg">
<img src="../../imagens/fotos/<%=rsImg("arquivo")%>" name="pict" border="0">
</form>
</body>
</html>
<script language="javascript">
function showpic(){
  larg = document.formimg.pict.width;
  alt = document.formimg.pict.height;
  //alert(larg);
  //alert(alt);
  window.open('imagem.asp?codigo=<%=rsImg("codigo")%>','IMM','resizable=yes,scrollbars=no,toolbar=no,location=no,status=no,directories=no,width='+larg+',height='+alt+',top=20,left=20');
}
setTimeout('showpic();',1000);
</script>