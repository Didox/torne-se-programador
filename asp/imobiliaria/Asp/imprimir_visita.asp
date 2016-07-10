<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pesquisa=request("pesquisa")
opcao=request("opcao")
pagina=request("pagina")
ordem=request("ordem")
ordem2=request("ordem2")
currentPage = Request( "currentPage" )
Set contador = Server.CreateObject( "ADODB.Recordset" )
contador.activeConnection = conn
contador.CursorType = adOpenStatic
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 9
if ordem="" then
   ordem="visita.nome"
end if
if pesquisa<>"" then
   if opcao="1" then
      sql="and visita.nome like '%"&pesquisa&"%' "
   else
      if opcao="2" then
         sql="AND imoveis.descricao like '%"&pesquisa&"%' "
      else
         if isdate(pesquisa) and len(pesquisa)=10 then
            sql="and visita.data_visita=convert(datetime ,'"&pesquisa&"',103) "   
         end if
     end if
   end if
end if
itens.Open "select visita.*, corretor.nome as corretor, servico.descricao as servico, visita.codigo as codigo, visita.hora_visita as hora, visita.data_visita as data, visita.nome as nome, imoveis.descricao as imovel from (((visita inner join imoveis on visita.cod_imovel=imoveis.codigo)inner join servico on visita.cod_servico=servico.codigo) inner join corretor on visita.cod_corretor=corretor.codigo) where visita.status=0 "&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
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
            <a href="<%=pagina%>.asp?contrario=<%=contrario%>&codigo=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>RELATÓRIO DE INTERRESADO(S)</B></td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
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
      <table width=100% align="center" bgcolor="#FFFFFF" border=1>
        <%do while not itens.eof%>
           <tr>
             <td class="navdroplist" width=40><b>CLIENTE:</b></td>
             <td class="navdroplist" colspan=3><%=itens("nome")%></td>
           </tr>
           <tr>
             <td class="navdroplist" width=40><b>DDD/TELEFONE:</b></td>
             <td class="navdroplist">(<%=itens("ddd")%>) / <%=itens("fone")%></td>
             <td class="navdroplist" width=40><b>IMÓVEL:</b></td>
             <td class="navdroplist"><%=itens("imovel")%></td>
           </tr>
           <tr>
             <td class="navdroplist" width=40><b>VISITA:</b></td>
             <td class="navdroplist"><%=itens("data")%></td>
             <td class="navdroplist" width=40><b>HORA:</b></td>
             <td class="navdroplist"><%=itens("hora")%></td>
           </tr>
           <tr>
             <td class="navdroplist" width=40><b>CORRETOR:</b></td>
             <td class="navdroplist"><%=itens("corretor")%></td>
             <td class="navdroplist" width=40><b>SERVIÇO:</b></td>
             <td class="navdroplist"><%=itens("servico")%></td>
           </tr>
           <%if itens("cod_classificacao_interessado") <> "0" then%>
             <tr>
               <td class="navdroplist" width=60><b>CLASSIFICAÇÃO:</b></td>
               <%set classif=conn.execute("select descricao from classificacao_interessado where codigo="&itens("cod_classificacao_interessado"))%>
               <td class="navdroplist" colspan=3><%=classif("descricao")%></td>
             </tr>
           <%end if%>
           <tr>
             <td>&nbsp;</td>
           </tr>
           <tr>
             <td class="navdroplist" colspan=9 bgcolor="E8E8E8"></td>
           </tr>  
           <tr>
             <td>&nbsp;</td>
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