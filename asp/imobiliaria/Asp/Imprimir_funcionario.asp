<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pesquisa=request("pesquisa")
pagina=request("pagina")
opcao=request("opcao")
ordem=request("ordem")
ordem2=request("ordem2")
currentPage = Request( "currentPage" )
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
itens.Open "select * from funcionario where status=0 "&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="estilo.css">
</head>
<body bgcolor="#f7f7f7" link=black text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="../img/bkgd-main.gif">
<br>
<table width=90% align="center" bgcolor="white">  <tr>
    <td>
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td>
            <a href="<%=pagina%>.asp"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table class="navdroplist" width=100% align="center" bgcolor="#f7f7f7">
        <tr>
          <td class="navdroplist" align=center>
            <B>RELATÓRIO DE FUNCIONÁRIO(S)
            </B>
          </td>
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
          <td width=30% class="navdroplist"> 
            DATA:&nbsp<b><%=date()%></b>
          </td>
          <td class="navdroplist">
             HORA DA SOLICITAÇÃO:&nbsp<b><%=time()%></b>
          </td>
          <td class="navdroplist">
            FUNCIONÁRIOS ENCONTRADOS:&nbsp;<b><%=itens.recordcount%></b>
          </td>
        </tr>
      </table>
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td><hr></td>
        </tr>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <%If itens.EOF = true then%>
        <tr>
          <td align=center></td>
          <td  width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tR>
        </table>
        <%else%>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0 cellspacing="0" cellpadding="0">
        <%do while not itens.eof%>
         <tr>
           <td class="navdroplist" width=100><b>NOME:</b></td>
           <td class="navdroplist" colspan=5><%=itens("nome")%></td>
         </tr>
          <tr>
            <td class="navdroplist" width=100><b>ENDEREÇO:</b></td>
            <td class="navdroplist" colspan=4><%=itens("endereco")%>&nbsp; - &nbsp<%=itens("numero")%>&nbsp; <%=itens("complemento")%></td>
          </tr>
          <tr>
            <td class="navdroplist" width=100><b>BAIRRO:</b></td>
            <td class="navdroplist"><%=itens("bairro")%></td>
            <td class="navdroplist" width=100><b>CIDADE:</b></td>
            <td class="navdroplist"><%=itens("cidade")%></td>
          </tr>
          <tr>  
            <td class="navdroplist" width=100><b>ESTADO:</b></td>
            <td class="navdroplist"><%=itens("estado")%></td>
            <td class="navdroplist" width=100><b>CEP:</b></td>
            <td class="navdroplist"><%=itens("cep")%></td>
          </tr>
          <tr>
            <td class="navdroplist" width=100><b>DDD/TELEFONE:</b></td>
            <td class="navdroplist">(<%=itens("ddd_fone")%>) <%=itens("fone")%></td>
            <td class="navdroplist" width=100><b>DDD/CELULAR:</b></td>
            <td class="navdroplist">(<%=itens("ddd_cel")%>) <%=itens("celular")%></td>
          </tr>
          <tr>
            <td class="navdroplist" width=100><b>FUNÇÃO:</b></td>
            <td class="navdroplist">
              <%set funcao=conn.execute("select * from funcao where status=0 and codigo="&itens("cod_funcao"))%>
              <%=funcao("descricao")%>
            </td>
            <td class="navdroplist" width=100><b>UNIDADE:</b></td>
            <td class="navdroplist">
            <%set unidade=conn.execute("select * from unidade where status=0 and codigo="&itens("cod_unidade"))%>
            <%=unidade("descricao")%>
            </td>
          <tr>
             <td class="navdroplist" width=100><b>IDENTIDADE:</b></td>
             <td class="navdroplist" colspan=5><%=itens("identidade")%></td>
          </tr>
          <tr>
             <td class="navdroplist" width=100><b>ORGAO EMISSOR:</b></td>
             <td class="navdroplist"><%=itens("orgao_emissor")%></td>
             <td class="navdroplist" width=100><b>DATA EMISSAO:</b></td>
             <td class="navdroplist"><%=itens("data_emissao")%></td>
          </tr>
          <tr>
             <td class="navdroplist"><b>CPF:</b></td>
             <td class="navdroplist" colspan=5><%=itens("cpf")%></td>
          </tr>
          <tr>
             <td class="navdroplist" width=100><b>ESCOLARIDADE:</b></td>
             <%set escolaridade=conn.execute("select descricao from tipo_escolaridade where codigo="&itens("cod_escolaridade"))%>
             <td class="navdroplist"><%=escolaridade("descricao")%></td>
             <td class="navdroplist" width=100><b>ESTADO CIVIL:</b></td>
             <%set estado_civil=conn.execute("select * from tipo_estado_civil where codigo="&itens("estado_civil"))%>
             <td class="navdroplist" colspan=5><%=estado_civil("descricao")%></td>
          </tr>
          <tr>
             <td class="navdroplist" width=100><b>EMAIL:</b></td>
             <td class="navdroplist" colspan=5><%=itens("email")%></td>
          </tr>
          <tr>
           <td colspan=5>
            <table width=100% align="center" bgcolor="#FFFFFF" border=0 cellspacing="0" cellpadding="0"> 
             <tr>
               <td class="navdroplist" width=110><b>DATA NASCIMENTO:</b></td>
               <td class="navdroplist"><%=itens("data_nascimento")%></td>
             </tr>
             <tr>
               <td class="navdroplist" width=110><b>DATA DE INCLUSÃO:</b></td>
               <td class="navdroplist"><%=itens("data_inclusao")%></td>
             </tr>
            </table>
           </td>
         </tr>    
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="navdroplist" colspan=9 bgcolor="E8E8E8"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
         <%itens.MoveNext%>
       <%loop%>
    <%end if%>
    </table>
    <br>
    <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0><font class="navdroplist">&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>