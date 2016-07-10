<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")%>
<%set foto=conn.execute("select * from registro_foto where codigo="&codigo)%>
<html>
<head>
<title><%=foto("descricao")%></title>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" marginheight="0" marginwidth="0" bgcolor="#FFFFFF">
<img src="../../imagens/fotos/<%=foto("arquivo")%>" alt="<%=foto("descricao")%>" onclick="window.close()">
</body>
</html>