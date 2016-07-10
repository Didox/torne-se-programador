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
            <a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>RELATÓRIO CORRETOR</B></td>
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
              <td class="navdroplist" width=60><b>NOME:</b></td>
              <td class="navdroplist" colspan=3><%=corretor("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>ENDEREÇO:</b></td>
              <td class="navdroplist" colspan=3><%=corretor("endereco")%>&nbsp;-&nbsp; <%=corretor("numero")%> &nbsp;-&nbsp;<%=corretor("complemento")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>BAIRRO:</b></td>
              <td class="navdroplist"><%=corretor("bairro")%></td>
              <td class="navdroplist" width=60><b>CIDADE:</b></td>
              <td class="navdroplist"><%=corretor("cidade")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>ESTADO:</b></td>
              <td class="navdroplist"><%=corretor("estado")%></td>
              <td class="navdroplist" width=60><b>CEP:</b></td>
              <td class="navdroplist"><%=corretor("cep")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>TELEFONE:</b></td>
              <td class="navdroplist">(<%=corretor("ddd_fone")%>)<%=corretor("fone")%></td>
              <td class="navdroplist" width=60><b>CELULAR:</b></td>
              <td class="navdroplist">(<%=corretor("ddd_cel")%>)<%=corretor("celular")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>CPF:</b></td>
              <td class="navdroplist"><%=corretor("cpf")%></td>
              <td class="navdroplist" width=60><b>RG:</b></td>
              <td class="navdroplist"><%=corretor("identidade")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>E-MAIL:</b></td>
              <td class="navdroplist"<%=corretor("email")%></td>
              <td class="navdroplist" width=60><b>UNIDADE:</b></td>
              <td class="navdroplist">
              <%set unidade=conn.execute("select * from unidade where codigo = "&corretor("cod_unidade"))%>
              <%=unidade("descricao")%>
              </td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>CPF:</b></td>
              <td class="navdroplist"><%=corretor("cpf")%></td>
              <td class="navdroplist" width=60><b>RG:</b></td>
              <td class="navdroplist"><%=corretor("identidade")%></td>
            </tr>
            <tr>
              <td class="navdroplist" colspan=1 width=60><b>CRECI:</b></td>
              <td class="navdroplist" colspan=1 width=60><%=corretor("creci")%></td>
              <td class="navdroplist" width=60><b>INCLUSÃO:</b></td>
              <td class="navdroplist"><%=corretor("data_inclusao")%></td>
            </tr>
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