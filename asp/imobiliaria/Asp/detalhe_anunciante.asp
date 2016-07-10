<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
imovel=request("imovel")
codigo2=request("codigo2")
pagina=request("pagina")
Cliente = request("cod_cli")

strCli = "Select nome, ddd_fone as ddd, fone, email, estado, cidade from clientes where codigo = "&Cliente
Cli = conn.execute(strCli)
%>
<html>
<head>
<title>:::::www.plenanet.com.br:::::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><style type="text/css">
<!--
body {
	background-color: #e2ddc0;
}
-->
</style></head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 text="#333333" link="#333333" vlink="#333333" alink="#333333">

  
<table width="280" border=0 align=center cellpadding=0 cellspacing=0 bgcolor="E2DDC0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr> 
    <td align="center"> 
      <table width=270 cellspacing=1 cellpadding=1 border=0 bordercolor="#BDB66F">
        <tr> 
          <td width=130 height="20" class="txtp10b"> <b>Dados do Anunciente:</b> 
          </td>
        </tr>		
		<%
		
		if request("cod_cli") <> "0" then
			on error resume next
		%>
        <tr bgcolor="#B5AE67"> 
          <td colspan="2" height="20" bgcolor="#B5AE67"><b>Nome:</b><%=cli("nome")%></td>
        </tr>
        <tr  class="txtp10b"> 
          <td colspan="2" height="8">&nbsp;</td>
        </tr>
        <tr bgcolor="#B5AE67"> 
          <td colspan="2" height="20" bgcolor="#B5AE67"><b>Tel.</b> (<%=cli("ddd")%>) <%=cli("fone")%></td>
        </tr>
        <tr  class="txtp10b"> 
          <td colspan="2" height="8">&nbsp;</td>
        </tr>
        <tr bgcolor="#B5AE67"> 
          <td colspan="2" height="20" bgcolor="#B5AE67"><b>E-mail:</b><%=cli("email")%></td>
        </tr>
        <tr class="txtp10b"> 
          <td colspan="2"height="8">&nbsp;</td>
        </tr>
        <tr bgcolor="#B5AE67"> 
          <td colspan="2" height="20" bgcolor="#B5AE67"><b>Estado:</b>
		  <%=cli("estado")%>
		  </td>
        </tr>
        <tr class="txtp10b">
          <td colspan="2" height="20">&nbsp;</td>
        </tr>
        <tr bgcolor="#B5AE67"> 
          <td colspan="2" height="20" bgcolor="#B5AE67"><b>Cidade:</b>
		  <%=cli("Cidade")%>
		  </td>
        </tr>
		<%
			if err.number <> 0 then
			%>
						<tr> 
					  <td width=* height="20" class="txtp10b"><center><font color="red"><b>Os Dados do Anunciente não informados no cadastro do imovel</b></font></center> 
					  </td>
					</tr>
					 <tr bgcolor="#B5AE67"> 
					  <td colspan="2" height="20" bgcolor="#B5AE67">&nbsp;</td>
					</tr>
					</table>
			
				</td>
			  </tr>
			  <tr> 
				<td>&nbsp;</td>
			  </tr>
			<%
			end if
		else
		%>
		<tr> 
          <td width=* height="20" class="txtp10b"><center><font color="red"><b>Os Dados do Anunciente não informados no cadastro do imovel</b></font></center> 
          </td>
        </tr>
		 <tr bgcolor="#B5AE67"> 
          <td colspan="2" height="20" bgcolor="#B5AE67">&nbsp;</td>
		</tr>
		</table>

    </td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
 <%
	   End if
	   %>
  
  <tr> 
    <td class="tb" align=center><a href="javascript:window.close();"><img src="../img/fechar.gif" border=0></a></td>
  </tr>
</table>
      
</body>
</html>