<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
data_inicio=replace(trim(request("data_inicio")),"'","")
data_final=replace(trim(request("data_final")),"'","")
Set imoveis = Server.CreateObject( "ADODB.Recordset" )
imoveis.activeConnection = conn
imoveis.CursorType = 3
imoveis.open "select * from imoveis where data_inclusao between convert(datetime ,'"&data_inicio&"', 103) and convert(datetime ,'"&data_final&"', 103)",conn%>
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
          <td class="navdroplist" align=center><B>RELATÓRIO IMOVEIS</B></td>
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
          
           QUANTIDADE DE REGISTRO:&nbsp<b><%=imoveis.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
          <table width=100% border=0 cellspacing="1" cellpadding="0">
          <%do while not imoveis.eof%>
            <tr>
              <td class="navdroplist" width=75><b>DESCRIÇÃO:</b></td>
              <td class="navdroplist" colspan=3><%=imoveis("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=75><b>ENDEREÇO:</b></td>
              <td class="navdroplist" colspan=3><%=imoveis("endereco")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=75><b>NUMERO:</b></td>
              <td class="navdroplist"><%=imoveis("numero")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=75><b>COMPLEMENTO:</b></td>
              <td class="navdroplist"><%=imoveis("complemento")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=75><b>UNIDADE:</b></td>
              <td class="navdroplist">
              <%set unidade = conn.execute("select * from unidade where codigo = "&imoveis("cod_unidade"))%>
              <%=unidade("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=75><b>BAIRRO:</b></td>
              <td class="navdroplist">
              <%set bairro = conn.execute("select * from bairro where codigo = "&imoveis("cod_bairro"))%>
              <%=bairro("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=75><b>CIDADE:</b></td>
              <td class="navdroplist">
              <%set cidade = conn.execute("select * from cidade where codigo = "&imoveis("cod_cidade"))%>
              <%=cidade("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=75><b>ESTADO:</b></td>
              <td class="navdroplist">
              <%set estado = conn.execute("select * from estado where codigo = "&imoveis("cod_estado"))%>
              <%=estado("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=75><b>ESTAGIO DA OBRA:</b></td>
              <td class="navdroplist">
              <%set obra = conn.execute("select * from estagios_obra where codigo = "&imoveis("cod_estagios_obra"))%>
              <%if not obra.eof then%>
              <%=obra("descricao")%>
              <%end if%>
              </td>
            </tr>
            <tr>
            <td class="tb" width=130 colspan=2><b>TIPO DE SERVIÇO:</b>            
            <table width=250 cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">Serviço</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Valor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_servico where cod_imovel="&imoveis("codigo")&" ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                  <%set servico=conn.execute("select * from servico where codigo="&cbai("cod_servico"))%>
                  <%=servico("descricao")%>
                <td align=center>
                  <%set moed = conn.execute("select * from tipo_moeda where status=0 and codigo="&cbai("cod_moeda"))%>
                  <%=moed("sigla")%><%=formatnumber(cbai("valor"),2)%>
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
              </tr>
                <td class="tb" width=130><b>TIPO DE COMODO:</b></td>            
                <table width=250 cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
                <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">Comodo</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">&nbsp;&nbsp;&nbsp;Quantidade&nbsp;&nbsp;&nbsp;</font></span>
                </td>
                </tr>
                <%set cbai=conn.execute("select * from perfil_imovel where cod_imovel="&imoveis("codigo")&" ORDER BY codigo desc")%>
                <%do while not cbai.eof %>
                <tr>
                <td>
                  <%set comodo_nome=conn.execute("select * from tipo_comodo where codigo="&cbai("cod_comodo"))%>
                  <%=comodo_nome("descricao")%>
                <td align=center>
                  <%=cbai("quantidade")%>
                </td>
                </tr>
                <%cbai.movenext%>
               <%loop%>
              <tr><td class="tb" width=130><b>TIPO DE PLANO:</b></td></tr>
              <table width=250 cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Quantidade</font></span>
                </td>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">Plano</font></span>
                </td>
                <td bgcolor=#AAAAAA a lign=center>
                  <span class="estilo"><font color="#FFFFFF">Valor</font></span>
                </td>
              </tr>
              <%set plano1=conn.execute("select * from perfil_plano where cod_imovel="&imoveis("codigo")&" and status=0 ORDER BY codigo desc")%>
              <%do while not plano1.eof %>
              <tr>
                <td align=center>
                  <%=plano1("quantidade")%>
                </td>
                <td>
                  <%set plano_nome=conn.execute("select * from tipo_conta where codigo="&plano1("cod_tipo_conta"))%>
                  <%=plano_nome("descricao")%>
                <td align=center>
                  <%set moed = conn.execute("select * from tipo_moeda where status=0 and codigo="&plano1("cod_moeda"))%>
                  <%=moed("sigla")%><%=formatnumber(plano1("valor"),2)%>
                </td>
              </tr>
              <%plano1.movenext%>
              <%loop%>
            </table>            
             </td>
            </tr>
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
            <%
              imoveis.movenext
            loop%>
          </table>
          <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>