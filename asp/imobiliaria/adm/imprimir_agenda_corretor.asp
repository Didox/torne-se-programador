<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
contrario=request("contrario")
data_inicio=request("data_inicio")
data_final=request("data_final")
check_visita=request("check_visita")
check_acompanhamento=request("check_acompanhamento")
pagina=request("pagina")
opcao=request("opcao")
ordem=request("ordem")
ordem2=request("ordem2")

currentPage = Request( "currentPage" )
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "aDODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = 3
itens.PageSize = 3

currentPage = Request( "currentPage" )
IF currentPage = "" THEN currentPage = 1
Set itens2 = Server.CreateObject( "aDODB.Recordset" ) 
itens2.activeConnection = conn
itens2.CursorType = 3
itens2.PageSize = 3

if check_acompanhamento = "2" then
  if data_inicio <> "" and data_final <> "" then
     sql=" and acompanhamento.data between convert(datetime,'"&data_inicio&"',103) and convert(datetime,'"&data_final&"',103)"
  end if
  itens.Open "select corretor.* , imoveis.descricao as imovel , acompanhamento.* ,acompanhamento.codigo as codigo, tipo_acompanhamento.descricao as tipo_acompanhamento from (((acompanhamento INNER JOIN Tipo_acompanhamento ON acompanhamento.cod_acompanhamento=tipo_acompanhamento.codigo)INNER JOIN imoveis ON imoveis.codigo=acompanhamento.cod_imovel)INNER JOIN corretor ON corretor.codigo=acompanhamento.cod_corretor) where acompanhamento.status=0 "&sql&" ORDER BY  tipo_acompanhamento.descricao "&ordem2,conn
end if

if check_visita = "1" then
  if data_inicio <> "" and data_final <> "" then
     sql=" and visita.data_visita between convert(datetime,'"&data_inicio&"',103) and convert(datetime,'"&data_final&"',103)"
  end if
  itens2.Open "select visita.*, corretor.nome as corretor, servico.descricao as servico, visita.codigo as codigo, visita.hora_visita as hora, visita.data_visita as data, visita.nome as nome, imoveis.descricao as imovel from (((visita inner join imoveis on visita.cod_imovel=imoveis.codigo)inner join servico on visita.cod_servico=servico.codigo) inner join corretor on visita.cod_corretor=corretor.codigo) where visita.status=0 "&sql&" ORDER BY visita.nome"&ordem2,conn
end if
%>
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
            <a href="<%=pagina%>.asp?contrario=<%=contrario%>&codigo=<%=codigo%>&data=<%=data%>&tipo=2"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
     <%if check_acompanhamento="" and check_visita="" then%>
     <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>Selecione o tipo de pesquisa desejada.</B></td>
        </tR>
      </table>
     <%end if%>
     <%if check_acompanhamento = "2" then%>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>IMPRIMIR ACOMPANHAMENTO</B></td>
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
           QUANTIDADE DE REGISTRO:&nbsp<b><%=itens.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <%If itens.EOF = true then%>
        <tr>
          <td align=center></td>
          <td class="navdroplist" width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tR>
        </table>
        <%else%>
           <%do while not itens.eof%>
           <tr>
              <td class="navdroplist"><b>CORRETOR:</b></td>
              <td class="navdroplist"><%=itens("nome")%></td>
              <td class="navdroplist"><b>IMÓVEL:</b></td>
              <td class="navdroplist"><%=itens("imovel")%></td>
            </tr>
            <tr>
              <td class="navdroplist"><b>ACOMPANHAMENTO:</b></td>
              <td class="navdroplist"><%=itens("tipo_acompanhamento")%></td>
              <td class="navdroplist"><b>DATA:</b></td>
              <td class="navdroplist"><%=itens("data")%></td>
            </tr>
            <tr>
              <td class="navdroplist"><b>DESCRIÇÃO:</b></td>
              <td class="navdroplist"><%=itens("descricao")%></td>
            </tr>
            <tr><td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td></tr>
          <%itens.MoveNext%>
          <%loop%>   
    </table>
    <%end if%>
    <%end if%>
    <br>
    <%if check_visita = "1" then%>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>IMPRIMIR VISITA</B></td>
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
           QUANTIDADE DE REGISTRO:&nbsp<b><%=itens2.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <%If itens2.EOF = true then%>
        <tr>
          <td align=center></td>
          <td class="navdroplist" width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tR>
        </table>
        <%else%>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
        <%do while not itens2.eof%>
           <tr>
             <td class="navdroplist" width=40><b>CLIENTE:</b></td>
             <td class="navdroplist" colspan=3><%=itens2("nome")%></td>
           </tr>
           <tr>
             <td class="navdroplist" width=40><b>DDD/TELEFONE:</b></td>
             <td class="navdroplist">(<%=itens2("ddd")%>) / <%=itens2("fone")%></td>
             <td class="navdroplist" width=40><b>IMÓVEL:</b></td>
             <td class="navdroplist"><%=itens2("imovel")%></td>
           </tr>
           <tr>
             <td class="navdroplist" width=40><b>VISITA:</b></td>
             <td class="navdroplist"><%=itens2("data")%></td>
             <td class="navdroplist" width=40><b>HORA:</b></td>
             <td class="navdroplist"><%=itens2("hora")%></td>
           </tr>
           <tr>
             <td class="navdroplist" width=40><b>CORRETOR:</b></td>
             <td class="navdroplist"><%=itens2("corretor")%></td>
             <td class="navdroplist" width=40><b>SERVIÇO:</b></td>
             <td class="navdroplist"><%=itens2("servico")%></td>
           </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan=4 height=10></td></tr>
            <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
            <tr><td colspan=4 height=10></td>
           </tr><tr>
            <td>&nbsp;</td>
          </tr>  
      <%itens2.MoveNext
       loop%>
     </table>  
       <%end if%>  
    <%end if%>
    <center><a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>