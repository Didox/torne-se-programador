<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
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
   ordem="descricao"
end if
if pesquisa<>"" then
      sql="and descricao like '%"&pesquisa&"%' "
end if
itens.Open "select * from planos where status=0 and codigo="&codigo&" "&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
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
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb">
                <B>DETALHE PLANO DE MIDIA</B>
              </td>
              <td align=right><a href="<%=pagina%>.asp"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
              <a href="Imprimir_detalhe_plano_midia.asp?codigo=<%=codigo%>&pagina=<%=pagina%>"><img src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
            </table>
          <table><tr height=10><td></td></tr></table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" colspan=2><b>TÍTULO:</b></td>
            </tr>
            <tr>
              <td class="tb" colspan=2><%=itens("titulo")%></a></td>
            </tr>
            <tr>
              <td class="tb" colspan=2><b>DESCRIÇÃO:</b></td>
            </tr>
            <tr>
              <td class="tb" colspan=2><%=itens("descricao")%></a></td>
            </tr>
            <tr>
              <tr><td class="tb" width=10%><b>VALOR:</b></td>
              <td class="tb">R$ <%=formatnumber(itens("valor"),2)%></td>
            </tr>
            <tr>
              <td class="tb" width=10%><b>VALIDADE:</b></td>
              <td class="tb"><%=itens("validade")%> <%if itens("validade")>1 then%> dias <%else%> dia <%end if%></td></tr>
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