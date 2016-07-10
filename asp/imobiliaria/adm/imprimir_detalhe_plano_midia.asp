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
<title></title>
<link rel="stylesheet" href="estilo.css">
</head>
<body bgcolor="#f7f7f7" link=black text="#000000" leftmargin="10" topmargin="0" marginwidth="0" marginheight="0" background="../img/bkgd-main.gif">
<br><br>
<table width=90% align="center" bgcolor="white">
  <tr>
    <td class="navdroplist">
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td class="navdroplist">
            <a href="<%=pagina%>.asp?contrario=<%=contrario%>&imovel=<%=imovel%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>IMPRIMIR PLANO MIDIA</B></td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        
        <tr>
          
          <td class="navdroplist">
             SOLICITANTE:&nbsp<b><%=verificador("nome")%></b>
          </td>
        </tr>
        <tr>
          <td class="navdroplist"  width=30%>
            DATA:&nbsp<b><%=date()%></b>
          </td>
          <td class="navdroplist">
             HORA:&nbsp<b><%=time()%></b>
          </td>
          <td class="navdroplist">
           QUANTIDADE DE REGISTRO:&nbsp<b>1</b>
          </td>
          
        </tr>
       
      </table>
      <br>
      <hr>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <%If itens.EOF = true then%>
        <tr>
          <td align=center></td>
          <td class="navdroplist" width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tR>
        </table>
        <%else%>
            <tr>
              <td class="navdroplist" colspan=2><b>TÍTULO:</b></td>
            </tr>
            <tr>
              <td class="navdroplist" colspan=2><%=itens("titulo")%></a></td>
            </tr>
            <tr>
              <td class="navdroplist" colspan=2><b>DESCRIÇÃO:</b></td>
            </tr>
            <tr>
              <td class="navdroplist" colspan=2><%=itens("descricao")%></a></td>
            </tr>
            <tr>
              <tr><td class="navdroplist" width=10%><b>VALOR:</b></td>
              <td class="navdroplist">R$ <%=formatnumber(itens("valor"),2)%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=10%><b>VALIDADE:</b></td>
              <td class="navdroplist"><%=itens("validade")%> <%if itens("validade")>1 then%> dias <%else%> dia <%end if%></td></tr>
            </tr>
        </table>
    <%end if%>
    <br>
    <center><a href="Detalhe_plano_midia.asp?codigo=<%=codigo%>&pagina=<%=pagina%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>