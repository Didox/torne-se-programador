<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
pesquisa=replace(trim(request("pesquisa")),"'","")
pagina=request("pagina")
opcao=request("opcao")
box=request("deletar")
ordem=request("ordem")
ordem2=request("ordem2")
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 3
if ordem="" then
   ordem="contas.descricao"
end if
if pesquisa<>"" then
   if opcao="1" then
      sql="and contas.descricao like '%"&pesquisa&"%' "
   else
      sql="and contas.data like convert(datetime,'"&pesquisa&"',103) "
   end if
end if
itens.open "select * from contas where cod_funcionario="&codigo&" and status=0 "&sql&" ORDER BY "&ordem&" "&ordem2, conn%>
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
          <%set exibir=conn.execute("select * from Funcionario where codigo="&codigo)%>
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb">
                <B>DETALHE FUNCIONÁRIO
                </B>
              </td>
              <td class="tb" align=right><a href="Main_Funcionario.asp"><img src="../img/voltar.gif" border=0></a></td>
              <td class="tb" align=right><a href="Imprimir_funcionarios.asp?codigo=<%=codigo%>&opcao=<%=opcao%>&ordem2=<%=ordem2%>&ordem=<%=ordem%>&pesquisa=<%=pesquisa%>&pagina=detalhe_funcionario"><img src="../img/icone-imprimir.gif" border=0></a></td>
            </tr>
          </table>
          <table><tr height=10><td></td></tr></table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=120><b>NOME:</b></td>
              <td class="tb" colspan=5><%=exibir("nome")%></td>
            </tr>
            <tr>
              <td class="tb" width=120><b>FUNÇÃO:</b></td>
              <td class="tb" colspan=5>
              <%set funcao=conn.execute("select * from funcao where status=0 and codigo="&exibir("cod_funcao"))%>
              <%=funcao("descricao")%>
              </td>
            </tr>
            <tr>
              <td class="tb" width=120><b>ENDEREÇO:</b></td>
              <td class="tb" colspan=5><%=exibir("endereco")%>&nbsp; - &nbsp<%=exibir("numero")%>&nbsp; <%=exibir("complemento")%></td>
            </tr>
            <tr>
              <td class="tb" width=120><b>BAIRRO:</b></td>
              <td class="tb" width=100><%=exibir("bairro")%></td>
            </tr>
            <tr>
              <td class="tb" width=120><b>CIDADE:</b></td>
              <td class="tb"><%=exibir("cidade")%></td>
              <td class="tb" width=110><b>ESTADO:</b></td>
              <td class="tb"><%=exibir("estado")%></td>
            </TR>
            <TR>
              <td class="tb" width=120><b>CEP:</b></td>
              <td class="tb"><%=exibir("cep")%></td>
              <td class="tb" width=110><b>DDD/TELEFONE:</b></td>
              <td class="tb">(<%=exibir("ddd_fone")%>) <%=exibir("fone")%></td>
            </TR>
            <TR>
              <td class="tb" width=120><b>DDD/CELULAR:</b></td>
              <td class="tb">(<%=exibir("ddd_cel")%>) <%=exibir("celular")%></td>
              <td class="tb" width=110><b>ESTADO CIVIL:</b></td>
              <%set estado_civil=conn.execute("select * from tipo_estado_civil where codigo="&exibir("estado_civil"))%>
              <td class="tb"><%=estado_civil("descricao")%></td>
            </tr>
            <TR>
              <td class="tb" width=120><b>ESCOLARIDADE:</b></td>
              <%set escolaridade=conn.execute("select descricao from tipo_escolaridade where codigo="&exibir("cod_escolaridade"))%>
              <td class="tb"><%=escolaridade("descricao")%></td>
              <td class="tb" width=120><b>UNIDADE:</b></td>
              <td class="tb">
              <%set unidade=conn.execute("select * from unidade where status=0 and codigo="&exibir("cod_unidade"))%>
              <%=unidade("descricao")%>
              </td>
            </TR>
            <TR>
              <td class="tb" width=120><b>DATA DE NASCIMENTO:</b></td>
              <td class="tb" colspan=4><%=exibir("data_nascimento")%></td>
            </tr>
            <tr>
              <td class="tb" width=120><b>IDENTIDADE:</b></td>
              <td class="tb"><%=exibir("identidade")%></td>
              <td class="tb" width=110><b>ORGÃO EMISSOR:</b></td>
              <td class="tb"><%=exibir("orgao_emissor")%></td>
            </TR>
            <tr>
              <td class="tb" width=120><b>DATA DE EMISSÃO:</b></td>
              <td class="tb"><%=exibir("data_emissao")%></td>
            </TR>
            <TR>
              <td class="tb" width=120><b>CPF:</b></td>
              <td class="tb" colspan=4><%=exibir("cpf")%></td>
            </tr>            
            <tr>
              <td class="tb" width=120><b>EMAIL:</b></td>
              <td class="tb" colspan=5><%=exibir("email")%></td>
            </tr>
            <tr>
              <td class="tb" width=120><b>DATA DE INCLUSÃO:</b></td>
              <td class="tb" colspan=5><%=exibir("data_inclusao")%></td>
            </tr>
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