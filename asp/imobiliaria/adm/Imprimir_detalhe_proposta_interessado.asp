<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
codigo=request("codigo")
codigo2=request("codigo2")
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3  
itens.open "select * from proposta_visita where codigo="&codigo2,conn%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="estilo.css">
</head>
<body bgcolor="#f7f7f7" link=black text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="../img/bkgd-main.gif">
<br>
<table width=90% align="center" bgcolor="white">  <tr>
    <td>
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td>
            <a href="<%=pagina%>.asp?codigo=<%=codigo%>&codigo2=<%=codigo2%>&pagina=Detalhe_Proposta_Visita"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table class="navdroplist" width=100% align="center" bgcolor="#f7f7f7">
        <tr>
          <td class="navdroplist" align=center>
            <B>
              <%=itens("descricao")%>
            </B>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td><hr></td>
        </tr>
      </table>
      <br>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" colspan=2><%=itens("texto")%></td>
              <td class="navdroplist"><b></b></td>
            </tr>
          </table>
    <br>
    <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0><font class="navdroplist">&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>