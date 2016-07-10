<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
data_inicio=replace(trim(request("data_inicio")),"'","")
data_final=replace(trim(request("data_final")),"'","")
Set corretor = Server.CreateObject( "ADODB.Recordset" )
corretor.activeConnection = conn
corretor.CursorType = 3
corretor.open "select * from corretor where data_inclusao between convert(datetime ,'"&data_inicio&"', 103) and convert(datetime ,'"&data_final&"', 103)",conn%>
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
            <a href="<%=pagina%>.asp"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>RELATÓRIO CORRETOR ANALÍTICO</B></td>
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
          
           QUANTIDADE DE REGISTRO:&nbsp<b><%=corretor.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
          <%do while not corretor.eof%>
            <tr>
              <td class="navdroplist" colspan=4 ><b>NOME:</b>&nbsp;<%=corretor("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" ><b>CONTRATO</b></td>
              <td class="navdroplist" ><b>IMOVEL</b></td>
              <td class="navdroplist" ><b>CLIENTE</b></td>
              <td class="navdroplist" ><b>SERVIÇO</b></td>
            <td>
            <%set itens = conn.execute("SELECT contrato.numero as contrato, clientes.nome AS cliente, servico.descricao AS servico , imoveis.descricao as imovel FROM ((((Contrato INNER JOIN clientes ON cod_cliente = clientes.codigo) INNER JOIN imoveis ON cod_imovel = imoveis.codigo)INNER JOIN corretor on corretor.codigo=contrato.cod_corretor) INNER JOIN servico ON tipo_servico = servico.codigo) where contrato.status=0 and contrato.cod_corretor="&corretor("codigo")) %>
            <%do while not itens.eof %>
            <tr>
              <td class="navdroplist" ><%=itens("contrato")%></td>
              <td class="navdroplist" ><%=itens("imovel")%></td>
              <td class="navdroplist" ><%=itens("cliente")%></td>
              <td class="navdroplist" ><%=itens("servico")%></td>
            <td>
            <%
             itens.movenext
             loop
            %>
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
            <%
              corretor.movenext
            loop%>
          </table>
          <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>