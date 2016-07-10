<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%contrario=request("contrario")
imovel=request("imovel")
pagina=request("pagina")
pesquisa=request("pesquisa")
codigo=request("codigo")
currentPage = Request( "currentPage" )
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "aDODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3
itens.PageSize = 3
itens.Open "select * from contato where status=0 and cod_imovel="&imovel&" and codigo="&codigo,conn%>
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
            <a href="<%=pagina%>.asp?contrario=<%=contrario%>&imovel=<%=imovel%>&codigo=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>IMPRIMIR DETALHE CONTATO</B></td>
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
           QUANTIDADE DE REGISTRO:&nbsp<b>1</b>
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
             <td class="navdroplist" width=130><b>IMOVEL:</b></td>
             <%set imovel = conn.execute("select * from imoveis where codigo="&itens("cod_imovel"))%>
             <td class="navdroplist"><a href="Detalhe_Imovel.asp?codigo=<%=imovel("codigo")%>&pagina=Main_Imoveis"><%=ucase(imovel("descricao"))%></a></td>
           </tr>
           <tr>
             <td class="navdroplist" width=130><b>OPÇÃO:</b></td>
             <%set opcao = conn.execute("select * from opcao where codigo="&itens("cod_opcao"))%>
             <td class="navdroplist" colspan=3><%=ucase(opcao("descricao"))%></td>
           </tr>
           <tr>
             <td class="navdroplist" width=130><b>DESCRIÇÃO:</b></td>
             <td class="navdroplist" colspan=3><%=ucase(itens("descricao"))%></td>
           </tr>
           <tr>
             <td class="navdroplist" width=130><b>INTERESSADO:</b></td>
             <td class="navdroplist" colspan=3><%=ucase(itens("interessado"))%></td>
           </tr>
           <tr>
             <td class="navdroplist" width=130><b>DDD/FONE:</b></td>
             <td class="navdroplist"><%=itens("ddd")%> - <%=itens("fone")%></td><tr>
           </tr>
           <tr>
             <td class="navdroplist" width=130><b>EMAIL:</b></td>
             <td class="navdroplist"><%=ucase(itens("email"))%></td><tr>
           </tr>
           <tr>
             <td class="navdroplist" width=130><b>DATA CONTATO:</b></td>
             <td class="navdroplist"><%=itens("data_contato")%></td><tr>
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