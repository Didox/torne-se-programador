<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
codigo=request("codigo")
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3  
itens.Open "select * from fiador where codigo ="&codigo,conn
set contrato = conn.execute("select * from contrato where cod_fiador1="&codigo&" or cod_fiador2="&codigo&" order by numero")%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="estilo.css">
</head>
<body bgcolor="#f7f7f7" link=black text="#000000" leftmargin="10" topmargin="0" marginwidth="0" marginheight="0" background="../img/bkgd-main.gif">
<br><br>
<table width=90% align="center" bgcolor="white">
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
          <td class="navdroplist" align=center><B>IMPRESSÃO FIADOR</B></td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <tr>
          <td class="navdroplist"  width=30%>
            DATA:&nbsp<b><%=date()%></b>
          </td>
          <td class="navdroplist">
             HORA:&nbsp<b><%=time()%></b>
          </td>
          <td class="navdroplist">
           QUANTIDADE DE REGISTRO:&nbsp<b><%=itens.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
      <table width=100%  align="center" bgcolor="#FFFFFF" border=0>
      <%If itens.EOF = true then%>
        <tr>
          <td align=center></td>
          <td class="navdroplist" width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tr>
        </table>
      <%else%>
        <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr><td class="navdroplist" colspan=4><b>DADOS DO FIADOR</b></td></tr>
            <tr><td colspan=4></td></tr>
          <%do while not itens.eof%>
            <tr>
              <td class="navdroplist" width=60><b>NOME:</b></td>
              <td class="navdroplist" colspan=3><%=itens("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>DATA DE NASCIMENTO:</b></td>
              <td class="navdroplist" colspan=3><%=itens("data_nascimento")%></td>
            </tr>
            <TR>
              <td class="navdroplist" width=60><b>SEXO:</b></td>
              <td class="navdroplist" colspan=3>
                <%if ITENS("sexo")="0" then%>
                  MASCULINO
                <%else%>
                  FEMININO
                <%end if%>
              </td>
            </TR>
            <tr>
              <td class="navdroplist" width=60><b>ESTADO CIVIL:</b></td>
              <td class="navdroplist" colspan=3>
                 <%set estado_civil = conn.execute("select * from tipo_estado_civil where codigo="&itens("estado_civil"))%>
                 <%=estado_civil("descricao")%>
              </td>
            </tr>
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
              <td class="navdroplist">(<%=itens("ddd_fone")%>)<%=itens("fone")%></td>
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
            <tr>
              <td class="navdroplist" width=60><b>DATA DE EMISSÃO:</b></td>
              <td class="navdroplist"><%=itens("DATA_EMISSAO")%></td>
              <td class="navdroplist" ><b>ORGÃO EMISSOR:</b></td>
              <td class="navdroplist"><%=itens("ORGAO_EMISSOR")%></td>
            </tr>
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
              <td class="navdroplist" ><b>DATA DE ADMISSÃO:</b></td>
              <td class="navdroplist"><%=itens("data_admissao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=60><b>RENDA:</b></td>
              <td class="navdroplist">R$ <%=formatnumber(itens("renda"),2)%></td>
              <td class="navdroplist" ><b>RENDA EXTRA:</b></td>
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
              <td class="navdroplist"><%=itens("cartorio")%></td>
            </tr> 
            <tr>
              <td class="navdroplist" width=60><b>TIPO DE IMÓVEL:</b></td>
              <td class="navdroplist">
                <%set tipo_imovel = conn.execute("select * from tipo_imovel_cliente where codigo="&itens("tipo_imovel"))%>
                <%=tipo_imovel("descricao")%>
              </td>
              <td class="navdroplist"><b>DATA DE INCLUSÃO:</b></td>
              <td class="navdroplist"><%=ITENS("DATA_INCLUSAO")%></td>
            </tr>
            </tr>
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
            <%
              itens.movenext
            loop%>
          <br>
          <tr><td class="navdroplist" colspan=4><b>CONTRATOS DO FIADOR</b></td></tr>
          <tr><td colspan=4></td></tr>
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
            <tr><td colspan=4 height=7></td></tr>
            <tr>
              <td bgcolor=#CCCCCC colspan=4 height=1></td>
            </tr>
            <tr><td colspan=4 height=7></td></tr>
            <%cont=cont+1
             contrato.movenext
            loop%>
          </table>
     <%end if%>
    <br>
    <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>