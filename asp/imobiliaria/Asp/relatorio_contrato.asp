<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
TIPO=request("TIPO")
data_inicio  =replace(trim(request("data_inicio")),"'","")
data_final   =replace(trim(request("data_final")),"'","")
Set contrato = Server.CreateObject( "ADODB.Recordset" )
contrato.activeConnection = conn
contrato.CursorType = 3
contrato.open "SELECT contrato.codigo AS codigo, contrato.numero AS numero,corretor.nome AS corretor, imoveis.descricao AS imovel, clientes.nome AS nome, servico.descricao AS servico, fiador.nome AS fiador1, contrato.status AS status FROM (((((contrato INNER JOIN clientes ON contrato.cod_cliente = clientes.codigo) INNER JOIN imoveis ON contrato.cod_imovel = imoveis.codigo) INNER JOIN servico ON contrato.tipo_servico = servico.codigo) inner join corretor on contrato.cod_corretor=corretor.codigo) inner join fiador on contrato.cod_fiador1=fiador.codigo) where contrato.status=0 and  contrato."&tipo&" between convert(datetime ,'"&data_inicio&"', 103) and convert(datetime ,'"&data_final&"', 103)",conn%>
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
          <td class="navdroplist" align=center><B>RELATÓRIO CONTRATOS</B></td>
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
          
           QUANTIDADE DE REGISTRO:&nbsp<b><%=contrato.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
          <%do while not contrato.eof%>
            <tr>
              <td class="navdroplist" width=80><b>N° CONTRATO:</b></td>
              <td class="navdroplist" colspan=3><%=contrato("numero")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>CORRETOR:</b></td>
              <td class="navdroplist" colspan=3><%=contrato("corretor")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>CLIENTE:</b></td>
              <td class="navdroplist" colspan="3"><%=contrato("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>IMOVEL:</b></td>
              <td class="navdroplist" colspan="3"><%=contrato("imovel")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>FIADOR 1:</b></td>
              <td class="navdroplist"><%=contrato("fiador1")%></td>
              <%set det_contrato = conn.execute("select * from contrato where numero="&contrato("numero"))%>
              <td class="navdroplist" width=60><b>FIADOR 2:</b></td>
              <%set fiador2 = conn.execute("select nome from fiador where codigo="&det_contrato("cod_fiador2"))%>
              <%if fiador2.eof then
                response.write("<td></td>")
              else%>
              <td class="navdroplist"><%=fiador2("nome")%></td>
              <%end if%>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>SERVIÇO:</b></td>
              <td class="navdroplist"><%=contrato("servico")%></td>
              <td class="navdroplist" width=60><b>VALOR:</b></td>
              <td class="navdroplist">R$ <%=formatnumber(det_contrato("valor"),2)%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=100><b>INICIO CONTRATO:</b></td>
              <td class="navdroplist">&nbsp;<%=det_contrato("data_inicio")%></td>
              <td class="navdroplist" width=60><b>VENCIMENTO:</b></td>
              <td class="navdroplist">&nbsp;<%=det_contrato("data_vencimento")%></td>
            </tr>
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
            
            <%
              contrato.movenext
            loop%>
          </table>
          <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>