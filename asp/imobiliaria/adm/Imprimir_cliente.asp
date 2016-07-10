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
itens.Open "select * from clientes where status=0 "&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
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
            <B>RELATÓRIO CLIENTE(S)
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
            CLIENTES ENCONTRADOS:&nbsp;<b><%=itens.recordcount%></b>
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
       <tr>
         <td colspan=8><br></td>
       </tr>
       <%do while not itens.eof
       set contrato = conn.execute("select count(*) as contratos from contrato where cod_cliente="&itens("codigo"))%>
       <tr>
         <td class="navdroplist" width=60><b>NOME:</b></td>
         <td class="navdroplist" colspan=3><%=itens("nome")%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=60><b>ENDEREÇO:</b></td>
         <td class="navdroplist" colspan=3><%=itens("endereco")%>&nbsp;-&nbsp; <%=itens("numero")%> &nbsp;-&nbsp;<%=itens("complemento")%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=60><b>BAIRRO:</b></td>
         <td class="navdroplist"><%=itens("bairro")%></td>
         <td class="navdroplist" width=60><b>CIDADE:</b></td>
         <td class="navdroplist"><%=itens("cidade")%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=60><b>ESTADO:</b></td>
         <td class="navdroplist"><%=itens("estado")%></td>
         <td class="navdroplist" width=60><b>CEP:</b></td>
         <td class="navdroplist"><%=itens("cep")%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=60><b>TELEFONE:</b></td>
         <td class="navdroplist">(<%=itens("ddd_fone")%>)<%=itens("fone")%></td>
         <td class="navdroplist" width=60><b>CELULAR:</b></td>
         <td class="navdroplist">(<%=itens("ddd_cel")%>)<%=itens("celular")%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=60><b>CPF:</b></td>
         <td class="navdroplist"><%=itens("cpf")%></td>
         <td class="navdroplist" width=60><b>RG:</b></td>
         <td class="navdroplist"><%=itens("identidade")%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=60><b>E-MAIL:</b></td>
         <td class="navdroplist" colspan=3><%=itens("email")%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=60><b>BANCO:</b></td>
         <td class="navdroplist">
           <%set bancos=conn.execute("select * from bancos where codigo="&itens("cod_banco"))%>
           <%=bancos("descricao")%>
         </td>
         <td class="navdroplist" width=60><b>AGÊNCIA:</b></td>
         <td class="navdroplist"><%=itens("agencia")%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=60><b>CONTA:</b></td>
         <td class="navdroplist"><%=itens("conta")%></td>
         <td class="navdroplist" width=60><b>RENDA:</b></td>
         <td class="navdroplist">R$ <%=formatnumber(itens("renda"),2)%></td>
       </tr>
       <tr>
         <td class="navdroplist" width=60><b>PROFISSÃO:</b></td>
         <td class="navdroplist"><%=itens("profissao")%></td>
         <td class="navdroplist" width=60><b>CONTRATOS:</b></td>
         <td class="navdroplist"><%=contrato("contratos")%></td>
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
        <%itens.MoveNext
       loop%>
    <%end if%>
    </table>
    <br>
    <center><a href="javascript:window.print()"><img src="../img/impressora.gif" border=0><font class="navdroplist">&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>