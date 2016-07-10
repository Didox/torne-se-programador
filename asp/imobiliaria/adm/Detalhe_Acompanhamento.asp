<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
corretor=request("corretor")
imovel=request("imovel")
pagina=request("pagina")
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
   ordem="descricao"
end if
if pesquisa<>"" then
      sql="and descricao like '%"&pesquisa&"%' "
end if
itens.Open "select * from acompanhamento where status=0 "&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
          <table><tr><td></td></tr></table>
            <%set exibir=conn.execute("select * from acompanhamento where codigo="&codigo)%>
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb">
                <B>DETALHE ACOMPANHAMENTO</B>
              </td>
              <td class="tb" align=right><a href="Imprimir_detalhe_acompanhamento.asp?codigo=<%=exibir("codigo")%>&pagina=<%=pagina%>&corretor=<%=corretor%>&imovel=<%=imovel%>"><img src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
            </table>
          <table><tr height=10><td></td></tr></table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=130><b>CORRETOR:</b></td>
              <%set corretor = conn.execute("select * from corretor where codigo="&exibir("cod_corretor"))%>
              <td class="tb"><a href="Detalhe_corretor.asp?codigo=<%=corretor("codigo")%>&pagina=Main_corretor"><%=corretor("nome")%></a></td>
            </tr>
            <tr>
              <td class="tb" width=130><b>IMÓVEL:</b></td>
              <%set imovel = conn.execute("select * from imoveis where codigo="&exibir("cod_imovel"))%>
              <%set contrato = conn.execute("select * from contrato where cod_imovel="&imovel("codigo"))%>
              <td class="tb"><a href="Detalhe_Imovel.asp?codigo=<%=imovel("codigo")%>&pagina=Main_Imoveis"><%=imovel("descricao")%></a></td>
            </tr>
            <tr>
              <tr><td class="tb" width=130><b>ACOMPANHAMENTO:</b></td>
              <%set acompanhamento = conn.execute("select * from tipo_acompanhamento where codigo="&exibir("acompanhamento"))%>
              <td class="tb"><%=acompanhamento("descricao")%></td></tr>
              <td class="tb" width=130><b>DATA:</b></td>
              <td class="tb"><%=exibir("data")%></td></tr>
            </tr>
            <tr>
              <td class="tb" width=130><b>DESCRIÇÃO:</b></td>
              <td class="tb"><%=exibir("descricao")%></td>
            </tr>
            <tr>
               <%if itens("acompanhamento") = 1 then%>
                 <td class="tb" colspan=3><b>ACOMPANHAMENTO EFETUADO</b></td>
               <%else%>
                 <td class="tb" colspan=3><b>ACOMPANHAMENTO NÃO EFETUADO</b></td>
               <%end if%>
            </tr>
          </table>
        </td>
      </tr>
    <table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>      
  </td>
</tr>
</table>
</body>
</html>