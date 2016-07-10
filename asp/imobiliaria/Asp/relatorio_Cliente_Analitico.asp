<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
data_inicio=replace(trim(request("data_inicio")),"'","")
data_final=replace(trim(request("data_final")),"'","")
Set clientes = Server.CreateObject( "ADODB.Recordset" )
clientes.activeConnection = conn
clientes.CursorType = 3
clientes.open "select * from clientes where data_inclusao between convert(datetime ,'"&data_inicio&"', 103) and convert(datetime ,'"&data_final&"', 103)",conn%>
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
          <td class="navdroplist" align=center><B>RELATÓRIO CLIENTE ANALÍTICO</B></td>
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
          
           QUANTIDADE DE REGISTRO:&nbsp<b><%=clientes.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
          <%do while not clientes.eof%>
            <tr>
              <td class="navdroplist" colspan=3 ><b>NOME:</b>&nbsp;<%=clientes("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=250 ><b>CONTRATO</b></td>
              <td class="navdroplist" ><b>IMOVEL</b></td>
              <td class="navdroplist" ><b>SERVIÇO</b></td>
            <td>
            <%set itens = conn.execute("SELECT contrato.numero as contrato, clientes.nome AS cliente, servico.descricao AS servico , imoveis.descricao as imovel FROM (((Contrato INNER JOIN clientes ON cod_cliente = clientes.codigo) INNER JOIN imoveis ON cod_imovel = imoveis.codigo) INNER JOIN servico ON tipo_servico = servico.codigo) where contrato.status=0 and cod_cliente="&clientes("codigo")) %>
            <%do while not itens.eof
            if itens("contrato") <> "" then%>
              <tr>
                <td class="navdroplist" width=250 ><%=itens("contrato")%></td>
                <td class="navdroplist" ><%=itens("imovel")%></td>
                <td class="navdroplist" ><%=itens("servico")%></td>
              <td>
            <%else%>
              <tr>
                <td class="navdroplist" ></td>
                <td class="navdroplist" >Não há Registros cadastrados.</td>
                <td class="navdroplist" ></td>
                <td class="navdroplist" ></td>
              <td>
            <%end if
             itens.movenext
             loop
            %>
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
            <%
              clientes.movenext
            loop%>
          </table>
          <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>