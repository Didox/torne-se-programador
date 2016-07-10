<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
corretor=request("corretor")
data_inicio  =replace(trim(request("data_inicio")),"'","")
data_final   =replace(trim(request("data_final")),"'","")
check=request("check")
if check = "1" then
  check_=" and acompanhamento.cod_acompanhamento = 1"
end if
if corretor <> "" then
   sql2=" where codigo="&corretor
end if%>
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
            <a href="<%=pagina%>.asp"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>RELATÓRIO INTERESSADOS</B></td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <tr>
          <td class="navdroplist" colspan=2>
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
        </tr>
      </table>
      <br>
      <hr>
      <table width=100% border=0 cellspacing="0" cellpadding="0">
      <%set corretores=conn.execute("select * from corretor "&sql2)%>
      <%do while not corretores.eof%>
       <tr>
        <td class="navdroplist" colspan=5>
          <u><b>CORRETOR:</b>&nbsp<%=corretores("nome")%></u>
        </td>
       </tr>
      <%if corretor <> "" then
          sql=" and visita.cod_corretor = "&corretor
        else
          sql=" and visita.cod_corretor = "&corretores("codigo")
        end if%>
      <%set visita=conn.execute("select distinct visita.*, corretor.nome as corretor_ from ((visita inner join corretor on corretor.codigo=visita.cod_corretor)inner join acompanhamento on acompanhamento.cod_visita=visita.codigo) where visita.status=0 "&sql&check_&" and visita.data_visita between convert(datetime ,'"&data_inicio&"', 103) and convert(datetime ,'"&data_final&"', 103)")%>
      <%if not visita.eof=true then%>    
          <%do while not visita.eof%>
            <tr>
              <td class="navdroplist" width=40><b>IMOVEL:</b></td>
              <%set imovel=conn.execute("select descricao from imoveis where codigo="&visita("cod_imovel"))%>
              <td class="navdroplist" colspan=5><%=imovel("descricao")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=40><b>NOME:</b></td>
              <td class="navdroplist" colspan=5><%=visita("nome")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=40><b>ENDEREÇO:</b></td>
              <td class="navdroplist" colspan=5><%=visita("endereco")%>, <%=visita("numero")%>&nbsp;<%=visita("complemento")%> - <%=visita("bairro")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=40><b>CIDADE:</b></td>
              <td class="navdroplist" width=190><%=visita("cidade")%></td>
              <td class="navdroplist" width=60><b>ESTADO:</b></td>
              <td class="navdroplist" width=60><%=visita("estado")%></td>
              <td class="navdroplist" width=15><b>CEP:</b></td>
              <td class="navdroplist" width=70><%=visita("cep")%></td>
            </tr>
            <tr>
              <td class="navdroplist" width=40><b>DDD/FONE:</b></td>
              <td class="navdroplist" width=60>(<%=visita("ddd")%>)&nbsp<%=visita("fone")%></td>
              <td class="navdroplist" width=60><b>EMAIL:</b></td>
              <td class="navdroplist"  width=60 colspan=2><%=visita("email")%></td>
            </tr>
            <%if check="1" then%>
            <tr>
              <td class="navdroplist" colspan=6>&nbsp</td>
            </tr>
            <%set acp=conn.execute("select * from acompanhamento where cod_visita="&visita("codigo"))%>
              <tr>
                <td colspan=4><b>ACOMPANHAMENTO DA VISITA</b></td>
              </td>
              <tr>
                <td colspan=4><%=acp("descricao")%></td>
              <td>
            <%end if%>
            <tr>
              <td class="navdroplist" colspan=6>&nbsp</td>
            </tr>
            <%visita.movenext
            loop%>
          <%else%>
            <tr>
              <td class="navdroplist" colspan=6><b>NENHUM REGISTRO ENCONTARDO</b></td>
            </tr>
            <tr>
              <td class="navdroplist" colspan=6>&nbsp</td>
            </tr>
           <%end if%>
           <%corretores.movenext
           loop%>
        </table>
      <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>