<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
pesquisa=replace(trim(request("pesquisa")),"'","")
sql_filtro = replace(request("sql_filtro"),"$","%")
sql = replace(request("sql"),"$","%")
opcao=request("opcao")
ordem=request("ordem")
ordem2=request("ordem2")
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
itens.Open "select * from corretor where status=0 "&sql&sql_filtro&" ORDER BY "&ordem&" "&ordem2,conn%>
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
            <B>RELATÓRIO CORRETORE(S)
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
            CORRETORES ENCONTRADOS:&nbsp;<b><%=itens.recordcount%></b>
          </td>
        </tr>
      </table>
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td class="navdroplist" colspan=9 bgcolor="E8E8E8"></td>
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
        <%do while not itens.eof
        set contrato = conn.execute("select count(*) as contratos from contrato where cod_corretor="&itens("codigo"))%>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0>
          <tr>
            <td class="navdroplist" width=60><b>&nbsp;EQUIPE:</b></td>
            <%set equipe=conn.execute("select descricao from equipe where codigo="&itens("cod_equipe"))%>
            <td class="navdroplist" colspan=5><%=equipe("descricao")%></td>
          </tr>
          <tr>
            <td class="navdroplist"><b>NOME:</b></td>
            <td class="navdroplist" width=220 colspan=5><%=Ucase(itens("nome"))%></td>
          </tr>
          <tr>
            <td class="navdroplist" width=100><b>DATA INCLUSÃO:</b></td>
            <td class="navdroplist" width=60><%=Ucase(itens("data_inclusao"))%></td>
            <td class="navdroplist"><b>CONTRATOS:</b></td>
            <td class="navdroplist" colspan=3>
              <%contador.Open "select * from contrato where cod_corretor="&itens("Codigo")&" and status=0",conn%>
              <%=contador.recordcount%>
              <%contador.close%>
            </td>
          </tr>            
          </tr>
          <tr>
            <td class="navdroplist" width=60><b>ENDEREÇO:</b></td>
            <td class="navdroplist" colspan=3 width=300><%=Ucase(itens("endereco"))%>&nbsp;-&nbsp; <%=Ucase(itens("numero"))%> &nbsp;-&nbsp;<%=Ucase(itens("complemento"))%></td>
            <td class="navdroplist" width=60><b>BAIRRO:</b></td>
            <td class="navdroplist"><%=Ucase(itens("bairro"))%></td>
          </tr>
          <tr>
            <td class="navdroplist"><b>CIDADE:</b></td>
            <td class="navdroplist" width=160><%=Ucase(itens("cidade"))%></td>
            <td class="navdroplist" width=60><b>ESTADO:</b></td>
            <td class="navdroplist" width=10><%=Ucase(itens("estado"))%></td>
            <td class="navdroplist" width=60><b>CEP:</b></td>
            <td class="navdroplist"><%=Ucase(itens("cep"))%></td>
          </tr>
          <tr>
            <td class="navdroplist" width=60><b>TELEFONE:</b></td>
            <td class="navdroplist">(<%=Ucase(itens("ddd_fone"))%>)<%=Ucase(itens("fone"))%></td>
            <td class="navdroplist"><b>CELULAR:</b></td>
            <td class="navdroplist" colspan=3>(<%=Ucase(itens("ddd_cel"))%>)<%=Ucase(itens("celular"))%></td>
          </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;CPF:</b></td>
              <td class="navdroplist" colspan=5><%=itens("cpf")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;IDENTIDADE:</b></td>
              <td class="navdroplist"><%=itens("identidade")%></td>
              <td class="navdroplist" width=110><b>&nbsp;ORGÃO EMISSOR:</b></td>
              <td class="navdroplist"><%=itens("orgao_emissor")%></td>
              <td class="navdroplist" width=110><b>&nbsp;DATA EMISSÃO:</b></td>
              <td class="navdroplist"><%=itens("data_emissao")%></td>
              </td>
            </tr>
          <tr>
            <td class="navdroplist" width=60><b>E-MAIL:</b></td>
            <td class="navdroplist" colspan=5><%=Ucase(itens("email"))%></td>
          </tr>
          <tr>
            <td class="navdroplist" width=60><b>CRECI:</b></td>
            <td class="navdroplist"><%=Ucase(itens("creci"))%></td>
            <td class="navdroplist"><b>UNIDADE:</b></td>
            <%set unidade = conn.execute("select descricao from unidade where codigo="&Ucase(itens("cod_unidade")))%>
            <td class="navdroplist" width=100 colspan=3><%=unidade("descricao")%></td>
          </tr>
          <tr>
            <td class="navdroplist" width=60><b>LOGIN:</b></td>
            <td class="navdroplist"><%=Ucase(itens("login"))%></td>
            <td class="navdroplist" width=60><b>CONTRATOS:</b></td>
            <td class="navdroplist" colspan=3><%=contrato("contratos")%></td>
          </tr>
          <tr>
            <td class="navdroplist" width=100><b>DATA PAGTO:</b></td>
            <td class="navdroplist" width=60><%=Ucase(itens("pagamento"))%></td>
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
        </table>
        <br>
       <%itens.MoveNext
      loop%>
     </table>
    <%end if%>
    <br>
    <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0><font class="navdroplist">&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>