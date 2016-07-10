<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pesquisa=request("pesquisa")
pagina=request("pagina")
codigo=request("codigo")
currentPage = Request( "currentPage" )
Set contador = Server.CreateObject( "ADODB.Recordset" )
contador.activeConnection = conn
contador.CursorType = 3
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3  
itens.PageSize = 9
if ordem="" then
   ordem="descricao"
end if
if pesquisa<>"" then
   if opcao="1" then
      sql="and descricao like '%"&pesquisa&"%' "
   else
      pesquisa=replace(pesquisa,".","")
      pesquisa=replace(pesquisa,"-","")
   end if
end if
itens.Open "select * from contas where status=0 and codigo ="&codigo,conn%><html>
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
            <a href="<%=pagina%>.asp?contrario=<%=contrario%>&cliente=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>IMPRESSÃO CONTA</B></td>
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
            <tr>
              <td class="navdroplist" width=130><b>NÚMERO:</b></td>
              <td class="navdroplist"><%=itens("numero")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=130><b>DESCRIÇÃO:</b></td>
              <td class="navdroplist" colspan=3><%=itens("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=130><b>TIPO:</b></td>
              <% if itens("tipo")=1 then%>
                <td class="navdroplist">ENTRADA</td>
              <%else%>
                <td class="navdroplist">SAÍDA</td>         
              <%end if%>
            </tr>
            <tr>
              <tr><td class="navdroplist" width=130><b>TIPO CONTA:</b></td>
              <%set tipo = conn.execute("select descricao from tipo_conta where codigo="&itens("cod_tipo_conta"))%>
              <td class="navdroplist"><%=tipo("descricao")%></td></tr>
              <%set setor = conn.execute("select descricao from setor where codigo="&itens("cod_setor"))%>
              <td class="navdroplist" width=130><b>SETOR:</b></td>
              <td class="navdroplist"><%=setor("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=130><b>DATA:</b></td>
              <td class="navdroplist"><%=itens("data")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=130><b>VALOR:</b></td>
              <td class="navdroplist">R$<%=formatnumber(itens("valor"),2)%></td>
            </tr>
    </table>
    <%end if%>
    <br>
    <center><a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>