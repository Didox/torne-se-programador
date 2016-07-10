<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%cliente=request("cliente")
pagina=request("pagina")
currentPage = Request( "currentPage" )
Set contador = Server.CreateObject( "ADODB.Recordset" )
contador.activeConnection = conn
contador.CursorType = adOpenStatic
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 9
if ordem="" then
   ordem="nome"
end if
if pesquisa<>"" then
      sql="and nome like '%"&pesquisa&"%' "
end if
itens.Open "select * from administradores where status=0 "&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
          <table><tr><td></td></tr></table>
          <%set exibir=conn.execute("select * from administradores where codigo="&cliente)%>
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb">
                <B>DETALHE ADMINISTRADOR</B>
              </td>
              <td class="tb" align=right><a href="Imprimir_detalhe_administradores.asp?cliente=<%=exibir("codigo")%>&pagina=Main_administradores"><img src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
            </table>
          <table><tr height=10><td></td></tr></table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=130><b>NOME:</b></td>
              <td class="tb" colspan=3><%=exibir("nome")%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>EMAIL:</b></td>
              <td class="tb" colspan=3><%=exibir("email")%></td>
            </tr>
            <tr>
              <tr><td class="tb" width=130><b>LOGIN:</b></td>
              <td class="tb"><%=exibir("login")%></td></tr>
              <td class="tb" width=130><b>PERMISSÃO:</b></td>
              
              <td class="tb">
                <%if exibir("permissao")=1 then%>
		  PARCIAL
                <%else%>
		  TOTAL
                <%end if%>
              </td>
            </tr>
            <tr>
              <td class="tb" width=130><b>ACESSOS:</b></td>
              <td class="tb"><%=exibir("acessos")%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>ÚLTIMO ACESSO:</b></td>
              <td class="tb"><%=exibir("data_ultimo_acesso")%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>HORA:</b></td>
              <td class="tb">(<%=exibir("hora_ultimo_acesso")%>)</td>
            </tr>
          </table>
        </td>
      </tr>
    <table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>      
  </td>
</tr>
</table>
</body>
</html>