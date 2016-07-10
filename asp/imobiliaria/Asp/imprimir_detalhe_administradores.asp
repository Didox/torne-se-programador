<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pesquisa=request("pesquisa")
pagina=request("pagina")
cliente=request("cliente")
opcao=request("opcao")
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
   ordem="nome"
end if
if pesquisa<>"" then
   if opcao="1" then
      sql="and nome like '%"&pesquisa&"%' "
   else
      pesquisa=replace(pesquisa,".","")
      pesquisa=replace(pesquisa,"-","")
      sql="and cpf='"&pesquisa&"' "
   end if
end if
itens.Open "select * from administradores where status=0 and codigo ="&cliente,conn%><html>
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
            <a href="<%=pagina%>.asp?contrario=<%=contrario%>&cliente=<%=cliente%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>IMPRESSÃO ADMINISTRADOR</B></td>
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
       <%do while not itens.eof%>
       <tr>
          <td class="navdroplist"><b>NOME:</b></td>
          <td class="navdroplist"><%=itens("nome")%></td>
       </tr>
       <tr>
         <td class="navdroplist"><b>EMAIL:</b></td>
         <td class="navdroplist"><%=itens("email")%></td>       	
       </tr>
       <tr>
         <td class="navdroplist"><b>LOGIN:</b></td>
         <td class="navdroplist"><%=itens("login")%></td>       	
       </tr>
       <tr>
         <td class="navdroplist"><b>PERMISSÃO:</b></td>
              <td class="navdroplist">
                <%if itens("permissao")=1 then%>
		  PARCIAL
                <%else%>
		  TOTAL
                <%end if%>
              </td>
       </tr>
       <tr>
         <td class="navdroplist"><b>ACESSOS:</b></td>
         <td class="navdroplist"><%=itens("acessos")%></td>       	
       </tr>
       <tr>
         <td class="navdroplist" width=130><b>ÚLTIMO ACESSO:</b></td>
         <td class="navdroplist"><%=itens("data_ultimo_acesso")%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=130><b>HORA:</b></td>
         <td class="navdroplist">(<%=itens("hora_ultimo_acesso")%>)</td>
       </tr>
      <%itens.MoveNext
       loop%>
    <tr>
      <td class="navdroplist">&nbsp;</td>
      <td class="navdroplist">&nbsp;</td>
      <td class="navdroplist">&nbsp;</td>
    </tr>
    
    </table>
    <%end if%>
    <br>
    <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>