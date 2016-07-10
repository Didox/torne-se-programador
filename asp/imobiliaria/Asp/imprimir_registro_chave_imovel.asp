<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
codigo=request("codigo")
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3  
itens.Open "select registro_chave_imovel.* , imoveis.descricao as imovel from (registro_chave_imovel inner join imoveis on imoveis.codigo=registro_chave_imovel.cod_imovel ) where registro_chave_imovel.cod_imovel ="&codigo,conn
%>
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
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B><%=itens("imovel")%></B></td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <tr>
          <td width=20></td>
          <td class="navdroplist">
             SOLICITANTE:&nbsp<b><%=verificador("nome")%></b>
          </td>
          <td width=200></td>
          <td class="navdroplist">
           QUANTIDADE DE REGISTRO:&nbsp<b><%=itens.recordcount%></b>
          </td>
        </tr>
        <tr>
        <td width=20></td>
          <td class="navdroplist">
            DATA:&nbsp<b><%=date()%></b>
          </td>
          <td width=200></td>
          <td class="navdroplist">
             HORA:&nbsp<b><%=time()%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
      <%If itens.EOF = true then%>
        <tr>
          <td align=center></td>
          <td class="navdroplist" width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tR>
      </table>
      <%else%>
        <table width=100% border=0 cellspacing="1" cellpadding="0">
          
            <tr>
              <td class="navdroplist"><b>CORRETOR:</b></td>
              <td class="navdroplist"><b>DATA SAÍDA:</b></td>
              <td class="navdroplist"><b>DATA CHEGADA:</b></td>
              <td class="navdroplist"><b>HORA SAÍDA:</b></td>
              <td class="navdroplist"><b>HORA CHEGADA:</b></td>
            </tr>
            <%do while not itens.eof%>
              <tr>
                 <td class="navdroplist">
                   <%set corretor = conn.execute("select nome from corretor where codigo="&itens("cod_corretor"))%>
                   <%=corretor("nome")%>
                 </td>
                 <td class="navdroplist" align="center"><%=itens("data_saida")%></td>
                 <td class="navdroplist" align="center"><%=itens("data_chegada")%></td>
                 <td class="navdroplist" align="center"><%=itens("hora_saida")%></td>
                 <td class="navdroplist" align="center"><%=itens("hora_chegada")%></td>
               </tr>
               <tr><td colspan=5 height=10></td></tr>
               <tr><td bgcolor=#CCCCCC colspan=5 height=1></td></tr>
               <tr><td colspan=5 height=10></td></tr>
            <%itens.movenext
            loop%>
          </table>
     <%end if%>
    <br>
    <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0><span class="navdroplist">&nbsp;Imprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>