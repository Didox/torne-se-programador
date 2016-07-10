<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
Set reserva = Server.CreateObject( "ADODB.Recordset" )
reserva.activeConnection = conn
reserva.CursorType = 3
reserva.open "select reserva.* , corretor.nome as corretor , imoveis.descricao as imovel from ((reserva INNER JOIN corretor ON reserva.cod_corretor = corretor.codigo)INNER JOIN imoveis ON imoveis.codigo = reserva.cod_imovel) where reserva.validade < convert(datetime ,'"&date()&"', 103) and reserva.status=0",conn%>
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
            <a href="<%=pagina%>?codigo=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>RELATÓRIO RESERVAS VENCIDAS</B></td>
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
          
           QUANTIDADE DE REGISTRO:&nbsp<b><%=reserva.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
          <%if not reserva.eof then%>
          <%do while not reserva.eof%>  
            <tr> 
               <td class="tb" width=80><b>NOME:</b></td>
               <td class="tb" colspan=3><%=reserva("nome")%></td>
            </tr>
            <tr>
               <td class="tb" width=80><b>DDD/FONE:</b></td>
               <td class="tb" colspan=3>(<%=reserva("ddd")%>) <%=reserva("fone")%></td>
            </tr>
            <tr>
               <td class="tb" width=80><b>CORRETOR:</b></td>
               <td class="tb" colspan=3><%=reserva("corretor")%></td>
            </tr>
            <tr>
               <td class="tb" width=80><b>IMÓVEL:</b></td>
               <td class="tb" colspan=3><%=reserva("imovel")%></td>
            </tr>
            <tr>
               <td class="tb" width=80><b>DATA RESERVA:</b></td>
               <td class="tb" colspan=3><%=reserva("data")%></td>
            </tr>
            <tr>
               <td class="tb" width=80><b>VALIDADE:</b></td>
               <td class="tb" colspan=3><%=reserva("validade")%></td>
            </tr>
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
            <%reserva.movenext
            loop%>
            <%else%>
            <tr>
               <td  class="tb" width=100%><b>Nenhum registro encontrado.</b></td>
            </tr>
            <%end if%>          
          </table> 
          <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>