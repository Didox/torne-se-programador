<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
codigo=request("codigo")
opcao=request("opcao")
box=request("deletar")
ordem=request("ordem")
ordem2=request("ordem2")
pesquisa=request("pesquisa")
if box <> "" then
   conn.Execute ("update contas set status=1 where codigo IN ("&box&")")
end if
currentPage = Request( "currentPage" )
IF currentPage = "" THEN currentPage = 1
Set exibir = Server.CreateObject( "ADODB.Recordset" ) 
exibir.activeConnection = conn
exibir.CursorType = 3  
exibir.Open "select * from Funcionario where status=0 and codigo ="&codigo,conn
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.CursorType = adOpenStatic
if ordem="" then
   ordem="contas.descricao"
end if
if pesquisa<>"" then
   if opcao="1" then
      sql=" and contas.descricao like '%"&pesquisa&"%' "
   else
      if opcao="2" then
         sql=" AND contas.data like '%"&pesquisa&"%' "
      end if
  end if
end if%>
<%itens.open "select contas.*, setor.descricao as setor from (contas inner join setor on setor.codigo = contas.cod_setor) where contas.cod_funcionario="&codigo&" and contas.status = 0 "&sql&" ORDER BY "&ordem&" "&ordem2, conn%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="estilo.css">
</head>
<body bgcolor="#f7f7f7" link=black text="#000000" leftmargin="10" topmargin="0" marginwidth="0" marginheight="0" background="../img/bkgd-main.gif">
<br><br>
<table width=100% align="center" bgcolor="white">
  <tr>
    <td class="navdroplist">
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td class="navdroplist">
            <a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>IMPRESSÃO FUNCIONÁRIO(S)</B></td>
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
           QUANTIDADE DE REGISTRO:&nbsp<b><%=exibir.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
      <%If exibir.EOF = true then%>
        <tr>
          <td align=center></td>
          <td class="navdroplist" width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tR>
        </table>
      <%else%>
        <table width=100% border=1 cellspacing="0" cellpadding="0">
          <%do while not exibir.eof%>
          <tr>
              <td class="navdroplist" width=120><b>NOME:</b></td>
              <td class="navdroplist" colspan=3><%=exibir("nome")%></td>
            </tr>
            <td class="navdroplist" width=120><b>FUNÇÃO:</b></td>
            <td class="navdroplist" colspan=3>
            <%set funcao=conn.execute("select * from funcao where status=0 and codigo="&exibir("cod_funcao"))%>
            <%=funcao("descricao")%>
            </td>
            <tr>
              <td class="navdroplist" width=60><b>ENDEREÇO:</b></td>
              <td class="navdroplist" colspan=3><%=exibir("endereco")%>&nbsp; - &nbsp<%=exibir("numero")%>&nbsp; <%=exibir("complemento")%></td>
            </tr>
            <TR>
              <td class="navdroplist" ><b>BAIRRO:</b></td>
              <td class="navdroplist"><%=exibir("bairro")%></td>
              <td class="navdroplist"width=100><b>CIDADE:</b></td>
              <td class="navdroplist"><%=exibir("cidade")%></td>
            </tr>
            <TR>
              <td class="navdroplist"><b>ESTADO:</b></td>
              <td class="navdroplist"><%=exibir("estado")%></td>
              <td class="navdroplist"width=100><b>CEP:</b></td>
              <td class="navdroplist"><%=exibir("cep")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=120><b>DDD/TELEFONE:</b></td>
              <td class="navdroplist">(<%=exibir("ddd_fone")%>) <%=exibir("fone")%></td>
              <td class="navdroplist"width=100><b>DDD/CELULAR:</b></td>
              <td class="navdroplist">(<%=exibir("ddd_cel")%>) <%=exibir("celular")%></td>
            </tr>
            <TR>
              <td class="navdroplist"><b>ESTADO CIVIL:</b></td>
              <%set estado_civil=conn.execute("select * from tipo_estado_civil where codigo="&exibir("estado_civil"))%>
              <td class="navdroplist"><%=estado_civil("descricao")%></td>
              <td class="navdroplist" width=100><b>ESCOLARIDADE:</b></td>
              <%set escolaridade=conn.execute("select descricao from tipo_escolaridade where codigo="&exibir("cod_escolaridade"))%>
              <td class="navdroplist"><%=escolaridade("descricao")%></td>
            </tr>
            <TR>
              <td class="navdroplist" width=120><b>UNIDADE:</b></td>
              <td class="navdroplist">
              <%set unidade=conn.execute("select * from unidade where status=0 and codigo="&exibir("cod_unidade"))%>
              <%=unidade("descricao")%>
              <td class="navdroplist" width=100><b>DATA DE NASC:</b></td>
              <td class="navdroplist"><%=exibir("data_nascimento")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>IDENTIDADE:</b></td>
              <td class="navdroplist"><%=exibir("identidade")%></td>
              <td class="navdroplist" width=100><b>ORGÃO EMISSOR:</b></td>
              <td class="navdroplist"><%=exibir("orgao_emissor")%></td>
            </TR>
            <tr>
              <td class="navdroplist" width=120><b>DATA DE EMISSÃO:</b></td>
              <td class="navdroplist" colspan=3><%=exibir("data_emissao")%></td>
            </tr>
            <TR>
              <td class="navdroplist" width=60 ><b>CPF:</b></td>
              <td class="navdroplist" colspan=3><%=exibir("cpf")%></td>
            </tr>            
            <tr>
              <td class="navdroplist" width=120><b>EMAIL:</b></td>
              <td class="navdroplist" colspan=3><%=exibir("email")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=120><b>DATA DE INCLUSÃO:</b></td>
              <td class="navdroplist" colspan=3><%=exibir("data_inclusao")%></td>
            </tr>
            </tr>
          <%exibir.movenext
            loop%>
            </table>
     <%end if%>
    <br>
    <br>
    <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>