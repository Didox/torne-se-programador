<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
codigo=request("codigo")
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3  
itens.Open "select * from corretor where codigo ="&codigo,conn
set contrato = conn.execute("select * from contrato where cod_corretor="&codigo&" order by numero")%>
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
            <a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table class="navdroplist" width=100% align="center" bgcolor="#f7f7f7">
        <tr>
          <td class="navdroplist" align=center>
            <B>RELATÓRIO CONTRATO(S)
            </B>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <tr>
          <td width=30% class="navdroplist">
            DATA:&nbsp<b><%=date()%></b>
          </td>
          <td class="navdroplist">
             HORA DA SOLICITAÇÃO:&nbsp<b><%=time()%></b>
          </td>
          <td class="navdroplist">
            CONTRATOS ENCONTRADOS:&nbsp;<b><%=itens.recordcount%></b>
          </td>
        </tr>
      </table>
      <table width=100% align="center" bgcolor="#FFFFFF">
        <tr>
          <td><hr></td>
        </tr>
      </table>
      <br>
       <%if codigo <> "" then%>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;EQUIPE:</b></td>
                 <%set equipe=conn.execute("select descricao from equipe where codigo="&itens("cod_equipe"))%>
              <td class="navdroplist" colspan=5><%=equipe("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;NOME:</b></td>
              <td class="navdroplist" colspan=5><%=itens("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;ENDEREÇO:</b></td>
              <td class="navdroplist" colspan=5><%=itens("endereco")%>&nbsp;-&nbsp; <%=itens("numero")%> &nbsp;-&nbsp;<%=itens("complemento")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;BAIRRO:</b></td>
              <td class="navdroplist"><%=itens("bairro")%></td>
              <td class="navdroplist" width=60><b>&nbsp;CIDADE:</b></td>
              <td class="navdroplist" colspan=3><%=itens("cidade")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;ESTADO:</b></td>
              <td class="navdroplist"><%=itens("estado")%></td>
              <td class="navdroplist" width=60><b>&nbsp;CEP:</b></td>
              <td class="navdroplist" colspan=3><%=itens("cep")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;TELEFONE:</b></td>
              <td class="navdroplist">(<%=itens("ddd_fone")%>)<%=itens("fone")%></td>
              <td class="navdroplist" width=60><b>&nbsp;CELULAR:</b></td>
              <td class="navdroplist" colspan=3>(<%=itens("ddd_cel")%>)<%=itens("celular")%></td>
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
              <td class="navdroplist" width=60><b>&nbsp;E-MAIL:</b></td>
              <td class="navdroplist" colspan=5><%=itens("email")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;CRECI:</b></td>
              <td class="navdroplist"><%=itens("creci")%></td>
              <td class="navdroplist" width=60><b>&nbsp;UNIDADE:</b></td>
              <%set unidade = conn.execute("select descricao from unidade where codigo="&itens("cod_unidade"))%>
              <td class="navdroplist" colspan=3><%=unidade("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>&nbsp;LOGIN:</b></td>
              <td class="navdroplist" colspan=5><%=itens("login")%></td>
            </tr>
          </table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="navdroplist" width=130><b>&nbsp;DATA INCLUSÃO:</b></td>
              <td class="navdroplist"><%=itens("data_inclusao")%></td>
            </tr>
          </table>
          <%end if%>
        <table width=100% align="center" bgcolor="#FFFFFF" border=0>
       <tr>
         <td colspan=11><br></td>
       </tr>
       <tr>
         <td class="navdroplist" colspan=11><b>CONTRATOS DESTE <%if cliente <> "" then%> CLIENTE <%else%> CORRETOR <%end if%></b></td>
       </tr>
        <%If contrato.EOF = true then%>
        <tr>
          <td align=center class="navdroplist"></td>
          <td  width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tr>
        </table>
        <%else%>
          <%do While Not contrato.EOF%>
            <tr>
              <td class="navdroplist" width=60><b>NÚMERO:</b></td>
              <td class="navdroplist" colspan=3><%=contrato("numero")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>CLIENTE:</b></td>
              <%set cliente = conn.execute("select nome from clientes where codigo="&contrato("cod_cliente"))%>
              <td class="navdroplist" colspan=3><%=cliente("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>CORRETOR:</b></td>
              <%set corretor = conn.execute("select nome from corretor where codigo="&contrato("cod_corretor"))%>
              <td class="navdroplist" colspan=3><%=corretor("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>IMÓVEL:</b></td>
              <%set imovel = conn.execute("select descricao from imoveis where codigo="&contrato("cod_imovel"))%>
              <td class="navdroplist" colspan=3><%=imovel("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>VALOR:</b></td>
              <td class="navdroplist" colspan=3><%=formatnumber(contrato("valor"),2)%></td>
            </tr>
            <tr>
              <td bgcolor=#CCCCCC colspan=4 height=1></td>
            </tr>
            <tr>
              <td colspan=4></td>
            </tr>
            <%cont=cont+1
             contrato.movenext
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