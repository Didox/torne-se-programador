<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pesquisa=replace(trim(request("pesquisa")),"'","")
sql_filtro = replace(request("sql_filtro"),"$","%")
opcao=request("opcao")
box=request("deletar")
ordem=request("ordem")
ordem2=request("ordem2")
data_inicio=request("data_inicio")
data_final=request("data_final")
check_acompanhamento=request("check_acompanhamento")
check_visita=request("check_visita")

if box <> "" then
   conn.Execute ("update corretor set status=1 where codigo IN ("&box&")")
end if

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
itens.Open "select * from corretor where status=0 "&sql&sql_filtro&" ORDER BY "&ordem&" "&ordem2,conn

if isdate(data_inicio) and isdate(data_final) and data_inicio<=data_final then%>
<script>
  location.href="imprimir_agenda_corretor.asp?pagina=main_agenda_corretor&data_inicio=<%=data_inicio%>&data_final=<%=data_final%>&check_visita=<%=check_visita%>&check_acompanhamento=<%=check_acompanhamento%>";
</script>
<%end if%>
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
          <table width=100% bgcolor=#CCCCCC>
            <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?currentPage=<%=currentPage%>"name="form1">
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_16.gif"></td>
              <td class="tb"><B>PAINEL DE CONTROLE CHAVES</B></td>
            </tr>
          </table>  
          <iframe src="Chave.asp" name=iframe1 frameborder=2 scrolling=no bordercolor="#000000" width=580 height=300></iframe>  
        </td>
      </tr>
      </form>
    </table>
    <table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>      
    </td>
  </tr>
</table>
</body>
</html>

