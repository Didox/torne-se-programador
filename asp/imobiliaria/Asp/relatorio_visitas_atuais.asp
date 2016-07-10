<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
Set visita = Server.CreateObject( "ADODB.Recordset" )
visita.activeConnection = conn
visita.CursorType = 3
visita.open "select visita.* , corretor.nome as corretor , imoveis.descricao as imovel from ((visita INNER JOIN corretor ON visita.cod_corretor = corretor.codigo)INNER JOIN imoveis ON imoveis.codigo = visita.cod_imovel) where visita.data_visita = convert(datetime ,'"&date()&"', 103) and visita.status=0 and visita.visita=0",conn%>
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
            <a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>RELATÓRIO VISITA(S) DO DIA</B></td>
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
          
           QUANTIDADE DE REGISTRO:&nbsp<b><%=visita.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <%if not visita.eof then%>
            <%do while not visita.eof%>
            <tr> 
               <td class="navdroplist" width=60><b>NOME:</b></td>
               <td class="navdroplist" colspan=3><%=visita("nome")%></td>
            </tr>
            <tr>
               <td class="navdroplist" width=60><b>E-MAIL:</b></td>
               <td class="navdroplist" colspan=3><%=visita("email")%></td>
            </tr>
            <tr>
               <td class="navdroplist" width=60><b>DDD:</b></td>
               <td class="navdroplist" colspan=3><%=visita("ddd")%></td>
            </tr>
            <tr>
               <td class="navdroplist" width=60><b>FONE:</b></td>
               <td class="navdroplist" colspan=3><%=visita("fone")%></td>
            </tr>
            <tr> 
               <td class="navdroplist" width=60><b>VISITA:</b></td>
               <td class="navdroplist" colspan=3><%=visita("data_visita")%></td>
            </tr>
            <tr>
               <td class="navdroplist" width=60><b>HORA:</b></td>
               <td class="navdroplist" colspan=3><%=visita("hora_visita")%></td>
            </tr>
            <tr>
               <td class="navdroplist" width=60><b>CORRETOR:</b></td>
               <td class="navdroplist" colspan=3><%=visita("corretor")%></td>
            </tr>
            <tr>
               <td class="navdroplist" width=60><b>IMÓVEL:</b></td>
               <td class="navdroplist" colspan=3><%=visita("imovel")%></td>
            </tr> 
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
            <%visita.movenext
            loop%>
            <%else%>
            <tr>
               <td  class="navdroplist" width=100%><b>Nenhum registro encontrado.</b></td>
            </tr>
            <%end if%>          
          </table> 
          <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>