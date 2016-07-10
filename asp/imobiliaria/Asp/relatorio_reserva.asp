<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
data_inicio=replace(trim(request("data_inicio")),"'","")
data_final=replace(trim(request("data_final")),"'","")
Set reserva = Server.CreateObject( "ADODB.Recordset" )
reserva.activeConnection = conn
reserva.CursorType = 3
reserva.open "select * from reserva where validade between convert(datetime ,'"&data_inicio&"', 103) and convert(datetime ,'"&data_final&"', 103)",conn%>
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
          <td class="navdroplist" align=center><B>RELATÓRIO RESERVAS</B></td>
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
          <table width=100% border=0 cellspacing="1" cellpadding="0">
          <%do while not reserva.eof%>
            <tr>
              <td class="navdroplist" width=130><b>NOME:</b></td>
              <td class="navdroplist" colspan=3><%=reserva("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=130><b>DDD:</b></td>
              <td class="navdroplist" colspan=3><%=reserva("ddd")%></td>
            </tr>
            <tr>
              <tr>
                 <td class="navdroplist" width=130><b>FONE:</b></td>
                 <td class="navdroplist"><%=reserva("fone")%></td>
              </tr>
              <td class="navdroplist" width=130><b>CORRETOR:</b></td>
              <td class="navdroplist">
               <%set corretor = conn.execute ("select * from corretor where codigo="&reserva("cod_corretor"))%>
               <%=corretor("nome")%>
              </td>
            </tr>
            <tr>
              <td class="navdroplist" width=130><b>IMOVEL:</b></td>
              <td class="navdroplist">
               <%set imoveis = conn.execute ("select * from imoveis where codigo="&reserva("cod_imovel"))%>
               <%=imoveis("descricao")%>
              </td>
            </tr>
            <tr>
              <td class="navdroplist" width=130><b>VALIDADE:</b></td>
              <td class="navdroplist"><%=reserva("validade")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=130><b>INCLUSÃO:</b></td>
              <td class="navdroplist"><%=reserva("data")%></td>
            </tr>
            
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
            
            <%reserva.movenext
            loop%>
          </table>
          <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>