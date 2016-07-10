<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
data_inicio=replace(trim(request("data_inicio")),"'","")
data_final=replace(trim(request("data_final")),"'","")
Set administradores = Server.CreateObject( "ADODB.Recordset" )
administradores.activeConnection = conn
administradores.CursorType = 3
administradores.open "select * from administradores where data_inclusao between convert(datetime ,'"&data_inicio&"', 103) and convert(datetime ,'"&data_final&"', 103)",conn%>
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
          <td class="navdroplist" align=center><B>RELATÓRIO ADMINISTRADOR</B></td>
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
          
           QUANTIDADE DE REGISTRO:&nbsp<b><%=administradores.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
          <table width=100% border=0 cellspacing="1" cellpadding="0">
          <%do while not administradores.eof%>
            <tr>
              <td class="navdroplist" width=75><b>NOME:</b></td>
              <td class="navdroplist" colspan=3><%=administradores("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=75><b>E-MAIL:</b></td>
              <td class="navdroplist" colspan=3><%=administradores("email")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=75><b>LOGIN:</b></td>
              <td class="navdroplist"><%=administradores("login")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=75><b>PERMISSÃO:</b></td>
              <td class="navdroplist">
              <%if administradores("permissao") = 1 then%>
              PARCIAL
              <%else%>
              TOTAL
              <%end if%>
              </td>
            </tr>
            <tr>
              <td class="navdroplist" width=75><b>ULTIMO ACESSO:</b></td>
              <td class="navdroplist"><%=administradores("data_ultimo_acesso")%> - <%=administradores("hora_ultimo_acesso")%></td>
            </tr>
            
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
            
            <%
              administradores.movenext
            loop%>
          </table>
          <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>