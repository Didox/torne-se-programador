<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%contrario=request("contrario")
pagina=request("pagina")
pesquisa=request("pesquisa")
opcao=request("opcao")
ordem2=request("ordem2")
imovel=request("imovel")
currentPage = Request( "currentPage" )
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "aDODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3
itens.PageSize = 3
if ordem="" then
   ordem="veiculo_comunicacao.descricao"
end if
if pesquisa<>"" then
   sql=" and veiculo_comunicacao.descricao like '%"&pesquisa&"%' "
end if
itens.Open "select registro_midia.*, imoveis.descricao as imovel, veiculo_comunicacao.descricao as veiculo_comunicacao , unidade_metrica.descricao as unidade_metrica from (((registro_midia INNER JOIN unidade_metrica on registro_midia.cod_unidade_metrica = unidade_metrica.codigo)Inner Join veiculo_comunicacao on registro_midia.cod_veiculo_comunicacao=veiculo_comunicacao.codigo)inner join imoveis on imoveis.codigo=registro_midia.cod_imovel) where registro_midia.status=0 and cod_imovel="&imovel&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
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
            <a href="<%=pagina%>.asp?imovel=<%=imovel%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>RELATÓRIO REGISTRO MÍDIA</B></td>
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
        <tr>
          <td class="navdroplist">
            HOTEL: <b><%=itens("imovel")%></b>
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
           <td class="navdroplist"><b>VEÍCULO DE COMUNICAÇÃO:</b></td>
           <td class="navdroplist"><b>UNIDADE MÉTRICA:</b></td>
           <td class="navdroplist" align=center><b>EXIBIÇÕES:</b></td>
         </tr>
       <tr><td class="navdroplist"><br></td></tr>
       <%do while not itens.eof%>
       <tr>
         <td class="navdroplist"><%=itens("veiculo_comunicacao")%></td>
           <td class="navdroplist"><%=itens("unidade_metrica")%></td>
           <td class="navdroplist" align=center><%=itens("quantidade")%></td>
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