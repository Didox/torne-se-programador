<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
data_inicio=replace(trim(request("data_inicio")),"'","")
data_final=replace(trim(request("data_final")),"'","")
Set cliente = Server.CreateObject( "ADODB.Recordset" )
cliente.activeConnection = conn
cliente.CursorType = 3
cliente.open "select * from clientes where data_inclusao between convert(datetime ,'"&data_inicio&"', 103) and convert(datetime ,'"&data_final&"', 103)",conn%>
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
          <td class="navdroplist" align=center><B>RELATÓRIO CLIENTE</B></td>
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
          
           QUANTIDADE DE REGISTRO:&nbsp<b><%=cliente.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
          <%do while not cliente.eof%>
            <tr>
              <td class="navdroplist" width=60><b>NOME:</b></td>
              <td class="navdroplist" colspan=3><%=cliente("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>ENDEREÇO:</b></td>
              <td class="navdroplist" colspan=3><%=cliente("endereco")%>&nbsp;-&nbsp; <%=cliente("numero")%> &nbsp;-&nbsp;<%=cliente("complemento")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>BAIRRO:</b></td>
              <td class="navdroplist"><%=cliente("bairro")%></td>
              <td class="navdroplist" width=60><b>CIDADE:</b></td>
              <td class="navdroplist"><%=cliente("cidade")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>ESTADO:</b></td>
              <td class="navdroplist"><%=cliente("estado")%></td>
              <td class="navdroplist" width=60><b>CEP:</b></td>
              <td class="navdroplist"><%=cliente("cep")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>TELEFONE:</b></td>
              <td class="navdroplist">(<%=cliente("ddd_fone")%>)<%=cliente("fone")%></td>
              <td class="navdroplist" width=60><b>CELULAR:</b></td>
              <td class="navdroplist">(<%=cliente("ddd_cel")%>)<%=cliente("celular")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>CPF:</b></td>
              <td class="navdroplist"><%=cliente("cpf")%></td>
              <td class="navdroplist" width=60><b>RG:</b></td>
              <td class="navdroplist"><%=cliente("identidade")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>E-MAIL:</b></td>
              <td class="navdroplist" colspan=3><%=cliente("email")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>BANCO:</b></td>
              <td class="navdroplist">
                <%set bancos=conn.execute("select * from bancos where codigo="&cliente("cod_banco"))%>
                <%if not bancos.eof then%>
                <%=bancos("descricao")%>
                <%end if%>
              </td>
              <td class="navdroplist" width=60><b>AGÊNCIA:</b></td>
              <td class="navdroplist"><%=cliente("agencia")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>CONTA:</b></td>
              <td class="navdroplist"><%=cliente("conta")%></td>
              <td class="navdroplist" width=60><b>RENDA:</b></td>
              <td class="navdroplist">R$ <%=formatnumber(cliente("renda"),2)%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>PROFISSÃO:</b></td>
              <td class="navdroplist" colspan=3><%=cliente("profissao")%></td>
            </tr>
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
            
            <%
              cliente.movenext
            loop%>
          </table>
          <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>