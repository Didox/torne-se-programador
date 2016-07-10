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
itens.Open "select * from fiador where status=0 "&sql&" ORDER BY "&ordem&" "&ordem2,conn
%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="estilo.css">
</head>
<body bgcolor="#f7f7f7" link=black text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="../img/bkgd-main.gif">
<br>
<table width=90% align="center" bgcolor="white" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <table width=100% align="center" bgcolor="#FFFFFF"cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <a href="<%=pagina%>.asp"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table class="navdroplist" width=100% align="center" bgcolor="#f7f7f7" cellspacing="0" cellpadding="0">
        <tr>
          <td class="navdroplist" align=center>
            <B>RELATÓRIO FIADOR(ES)
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
            FIADORES ENCONTRADOS:&nbsp;<b><%=itens.recordcount%></b>
          </td>
        </tr>
      </table>
      <table width=100% align="center" bgcolor="#FFFFFF" cellspacing="0" cellpadding="0">
        <tr>
          <td><hr></td>
        </tr>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0 cellspacing="0" cellpadding="0">
        <%If itens.EOF = true then%>
        <tr>
          <td align=center></td>
          <td  width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tR>
        </table>
        <%else%>
        <%do while not itens.eof%>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0 cellspacing="0" cellpadding="0">
          <tr>
              <td class="navdroplist" width=60><b>NOME:</b></td>
              <td class="navdroplist" colspan=3><%=itens("nome")%></td>
            </tr>
        </table>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=125><b>DATA DE NASCIMENTO:</b></td>
              <td class="navdroplist"><%=itens("data_nascimento")%></td>
            </tr>
        </table>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=60><b>SEXO:</b></td>
              <td class="navdroplist" colspan=3>
                <%if ITENS("sexo")="0" then%>
                  MASCULINO
                <%else%>
                  FEMININO
                <%end if%>
              </td>
            </tr>
        </table>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=90><b>ESTADO CIVIL:</b></td>
              <td class="navdroplist" colspan=3>
                 <%set estado_civil = conn.execute("select * from tipo_estado_civil where codigo="&itens("estado_civil"))%>
                 <%=estado_civil("descricao")%>
              </td>
            </tr>
        </table>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=60><b>ESCOLARIDADE:</b></td>
              <td class="navdroplist" colspan=3>
                 <%set escola = conn.execute ("select * from tipo_escolaridade where codigo="&ITENS("cod_escolaridade"))%>
                 <%=escola("descricao")%>
              </td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>ENDEREÇO:</b></td>
              <td class="navdroplist" colspan=3><%=itens("endereco")%>&nbsp;-&nbsp; <%=itens("numero")%> &nbsp;-&nbsp;<%=itens("complemento")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>BAIRRO:</b></td>
              <td class="navdroplist"><%=itens("bairro")%></td>
              <td class="navdroplist" width=120><b>CIDADE:</b></td>
              <td class="navdroplist"><%=itens("cidade")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>ESTADO:</b></td>
              <td class="navdroplist"><%=itens("estado")%></td>
              <td class="navdroplist" ><b>CEP:</b></td>
              <td class="navdroplist"><%=itens("cep")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>TELEFONE:</b></td>
              <td class="navdroplist" colspan=2>(<%=itens("ddd_fone")%>)<%=itens("fone")%></td>
              <%cel=itens("ddd_cel")
                if cel = 0 then
                  response.write("<td></td>")
                else
              %>
              <td class='navdroplist' width=60><b>CELULAR:</b></td>
              <td class="navdroplist">(<%=itens("ddd_cel")%>)<%=itens("celular")%></td>
              <%end if%>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>CPF:</b></td>
              <td class="navdroplist"><%=itens("cpf")%></td>
              <td class="navdroplist" ><b>RG:</b></td>
              <td class="navdroplist"><%=itens("identidade")%></td>
            </tr>
        </table>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=120><b>DATA DE EMISSÃO:</b></td>
              <td class="navdroplist" width=60><%=itens("DATA_EMISSAO")%></td>
              <td class="navdroplist" width=100><b>ORGÃO EMISSOR:</b></td>
              <td class="navdroplist"><%=itens("ORGAO_EMISSOR")%></td>
            </tr>
        </table>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=60><b>E-MAIL:</b></td>
              <td class="navdroplist" colspan=3><%=itens("email")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>EMPRESA:</b></td>
              <td class="navdroplist" colspan=3><%=itens("empresa")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>PROFISSÃO:</b></td>
              <td class="navdroplist"><%=itens("profissao")%></td>
              <td class="navdroplist" width=110><b>DATA DE ADMISSÃO:</b></td>
              <td class="navdroplist"><%=itens("data_admissao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>RENDA:</b></td>
              <td class="navdroplist">R$ <%=formatnumber(itens("renda"),2)%></td>
              <td class="navdroplist" width=100><b>RENDA EXTRA:</b></td>
              <td class="navdroplist">R$ <%=formatnumber(itens("renda_extra"),2)%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>BANCO:</b></td>
              <td class="navdroplist" colspan=3>
                 <%set bancos=conn.execute("select * from bancos where codigo="&itens("cod_banco"))%>
                 <%=bancos("descricao")%>
              </td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>AGÊNCIA:</b></td>
              <td class="navdroplist"><%=itens("agencia")%></td>
              <td class="navdroplist" ><b>CONTA:</b></td>
              <td class="navdroplist"><%=itens("conta")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>CARTÓRIO:</b></td>
              <td class="navdroplist" colspan=3><%=itens("cartorio")%></td>
            </tr>
        </table>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=90><b>TIPO DE IMÓVEL:</b></td>
              <td class="navdroplist">
                <%set tipo_imovel = conn.execute("select * from tipo_imovel_cliente where codigo="&itens("tipo_imovel"))%>
                <%=tipo_imovel("descricao")%>
              </td>
              <td class="navdroplist" width=110><b>DATA DE INCLUSÃO:</b></td>
              <td class="navdroplist"><%=ITENS("DATA_INCLUSAO")%></td>
            </tr>
        </table>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0 cellspacing="0" cellpadding="0">
          <tr>
            <td class="navdroplist" width=60><b>CLIENTE:</b></td>
            <%set contrato = conn.execute("select * from (contrato INNER JOIN clientes ON contrato.cod_cliente=clientes.codigo)INNER JOIN imoveis ON contrato.cod_imovel=imoveis.codigo where cod_fiador1="&itens("codigo")&" or cod_fiador2="&itens("codigo"))%>
            <td class="navdroplist">
                <%if not contrato.eof = true then%>
                  <%=contrato("nome")%>
                <%end if%>                
            </td>
            <td class="navdroplist" width=60><b>IMÓVEL:</b></td>
            <td class="navdroplist" colspan=3>
              <%if not contrato.eof = true then%>
                 <%=contrato("descricao")%>
              <%end if%>
            </td>
          </tr>
          <tr>
            <td class="navdroplist"><b>CONTRATOS:</b></td>
            <td class="navdroplist">
              <%contador.Open "select * from contrato where cod_corretor="&itens("Codigo")&" and status=0",conn%>
              <%=contador.recordcount%>
              <%contador.close%>
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
       <%itens.MoveNext
       loop%>
    <%end if%>
    </table>
    <br>
    <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0><font class="navdroplist">&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>