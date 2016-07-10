<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
cliente=request("cliente")
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3  
itens.Open "select * from RESERVA where status=0 and codigo ="&cliente,conn%>
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
          <td class="navdroplist" align=center><B>IMPRESSÃO RESERVA</B></td>
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
           QUANTIDADE DE REGISTRO:&nbsp<b><%=itens.recordcount%></b>
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
          <%do while not itens.eof%>
            <tr>
              <td class="tb" width=130><b>NOME:</b></td>
              <td class="tb" colspan=3><%=itens("nome")%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>DDD:</b></td>
              <td class="tb" colspan=3><%=itens("ddd")%></td>
            </tr>
            <tr>
              <tr>
                 <td class="tb" width=130><b>FONE:</b></td>
                 <td class="tb"><%=itens("fone")%></td>
              </tr>
              <td class="tb" width=130><b>CORRETOR:</b></td>
              <td class="tb">
               <%set corretor = conn.execute ("select * from corretor where codigo="&itens("cod_corretor"))%>
               <%=corretor("nome")%>
              </td>
            </tr>
            <tr>
              <td class="tb" width=130><b>IMOVEL:</b></td>
              <td class="tb">
               <%set imoveis = conn.execute ("select * from imoveis where codigo="&itens("cod_imovel"))%>
               <%=imoveis("descricao")%>
              </td>
            </tr>
            <tr>
              <td class="tb" width=130><b>VALIDADE:</b></td>
              <td class="tb"><%=itens("validade")%></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>INCLUSÃO:</b></td>
              <td class="tb"><%=itens("data")%></td>
            </tr>
            
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
            
            <%itens.movenext
            loop%>
          </table>
     <%end if%>
    <br>
    <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>