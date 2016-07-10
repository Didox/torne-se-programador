<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%funcionario=request("funcionario")
opcao=request("opcao")
pesquisa=request("pesquisa")
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.open "select contas.*, setor.descricao as setor, funcionario.nome as funcionario from ((contas inner join setor on setor.codigo = contas.cod_setor) inner join funcionario on funcionario.codigo = contas.cod_funcionario) where contas.cod_funcionario="&funcionario&" and contas.tipo_funcionario=1 and contas.status = 0", conn%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
          <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?currentPage=<%=currentPage%>&funcionario=<%=funcionario%>"name="form1">
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb">
                <B>DETALHE PAGAMENTO FUNCIONÁRIO
                </B>
              </td>
              <td class="tb" align=right><a href="Imprimir_detalhe_funcionarios.asp?funcionario=<%=funcionario%>&pagina=Main_funcionario"><img src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
          </table>
          <table><tr height=10><td></td></tr></table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=70><b>FUNCIONÁRIO: </b></td>
              <td class="tb"><%=itens("funcionario")%></td>
            </tr>
            <tr>
              <td class="tb" width=70><b>SETOR:</b></td>
              <td class="tb"><%=itens("setor")%></td>
            <tr>
          </table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=150><b>NÚMERO DO DOCUMENTO:</b></td>
              <td class="tb"><%=itens("numero")%></td>
            </tr>
          </table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=70><b>DATA:</b></td>
              <td class="tb"><%=itens("data")%></td>
            </tr>
            <tr>
              <td class="tb" width=70><b>VALOR:</b></td>
              <td class="tb"><%=formatnumber(itens("valor"),2)%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>DESCRIÇÃO:</b></td>
              <td class="tb"><%=itens("descricao")%></td>
            </tr>
            <tr><td height=5></td></tr>
          </table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>      
    </td>
  </tr>
</table>
</body>
</html>