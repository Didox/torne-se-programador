<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
data_inicio=replace(trim(request("data_inicio")),"'","")
data_final=replace(trim(request("data_final")),"'","")
equipe=request("equipe")
corretor=request("corretor")
if corretor<>"0" and equipe = "0" then
  sql=" and corretor.codigo="&corretor
end if
Set contrato = Server.CreateObject( "ADODB.Recordset" )
contrato.activeConnection = conn
contrato.CursorType = 3
set contador = conn.execute("select count(corretor.codigo) as total from (corretor inner join equipe on equipe.codigo=corretor.cod_equipe) where corretor.status=0 "&sql)
%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="estilo.css">
</head>
<body bgcolor="#f7f7f7" link=black text="#000000" leftmargin="10" topmargin="0" marginwidth="0" marginheight="0" background="../img/bkgd-main.gif">
<br><br>
<table width=90% align="center" bgcolor="white" border=0>
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
          <td class="navdroplist" align=center><B>RELATÓRIO CORRETOR</B></td>
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
          <td class="navdroplist">
           QUANTIDADE DE REGISTRO:&nbsp<b><%=contador("total")%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>     
      <%set corretor=conn.execute("select distinct corretor.*, equipe.cod_supervisor as cod_supervisor,equipe.descricao as equipe_ from (corretor inner join equipe on equipe.codigo=corretor.cod_equipe) where corretor.status=0 "&sql&" order by nome")%>
        <table width=100% border=0 cellspacing="0" cellpadding="0">
        <%if corretor.eof=false then%>
          <%do while not corretor.eof%>
              <tr>
                <td class="navdroplist" width=130><u><b>EQUIPE:&nbsp;&nbsp;<%=corretor("equipe_")%></b></u></td>
              </tr>
              <%set supervisor = conn.execute("select * from corretor where codigo="&corretor("cod_supervisor"))%>
              <%if corretor("cod_supervisor") = 0 then%>
              <tr><td class="navdroplist" >EQUIPE SEM SUPERVISOR CADASTRADO</td></tr>
              <%else%>
                <tr>
                  <td class="navdroplist" colspan=2><b>SUPERVISOR:&nbsp;&nbsp;<%=supervisor("nome")%></b></td>
                </tr>
              <tr>
                <td class="navdroplist" colspan=2><b>ENDEREÇO:</b>&nbsp;&nbsp;<%=supervisor("endereco")%>, <%=supervisor("numero")%> - <%=supervisor("complemento")%>&nbsp;&nbsp<%=supervisor("bairro")%></td>
              </tr>
              <tr>
                <td class="navdroplist" colspan=2><b>CIDADE:</b>&nbsp;&nbsp;<%=supervisor("cidade")%> - <%=supervisor("estado")%></td>
              </tr>
              <tr>
                <%set unidade = conn.execute("select descricao from unidade where codigo="&supervisor("cod_unidade"))%>
                <td class="navdroplist" colspan=2><b>UNIDADE:</b>&nbsp;&nbsp;<%=unidade("descricao")%></td>
              </tr>
              <tr>
              <%set contrato=conn.execute("select count(codigo) as  total from contrato where cod_corretor="&supervisor("codigo"))%>
                <td class="navdroplist" colspan=2><b>CONTRATOS:</b>&nbsp;&nbsp;<%=contrato("total")%></td>
              </tr>
              <tr>
              <%set visita=conn.execute("select count(codigo) as  total from visita where cod_corretor="&supervisor("codigo"))%>
                <td class="navdroplist" colspan=2><b>VISTAS AGENDAS:</b>&nbsp;&nbsp;<%=visita("total")%></td>
              </tr>
              <tr>
              <%set acompanhamento=conn.execute("select count(codigo) as  total from acompanhamento where cod_corretor="&supervisor("codigo")&" and cod_acompanhamento=1")%>
                <td class="navdroplist" colspan=2><b>ACOMPANHAMENTOS AFETUADOS:</b>&nbsp;&nbsp;<%=acompanhamento("total")%></td>
              </tr>
              <tr>
              <%set acompanhamento=conn.execute("select count(codigo) as  total from acompanhamento where cod_corretor="&supervisor("codigo")&" and cod_acompanhamento=0")%>
                <td class="navdroplist" colspan=2><b>ACOMPANHAMENTOS PENDENTES:</b>&nbsp;&nbsp;<%=acompanhamento("total")%></td>
              </tr>
              <%end if%>
              <tr><td colspan=4 height=5></td></tr>
              <tr>
                <td>
                <%if corretor("codigo") = corretor("cod_supervisor") then%>
                   <table width=100% border=0 cellspacing="0" cellpadding="0">
                     <tr>
                       <td class="navdroplist">O CORRETOR É O SUPERVISOR DA EQUIPE</td>
                     </tr>
                   </table>
                <%else%>
                   <table width=100% border=0 cellspacing="0" cellpadding="0">
                     <tr>
                       <td class="navdroplist"><b>CORRETOR</b></td>
                     </tr>
                   </table>
                   <table width=100% border=0 cellspacing="0" cellpadding="0">
                     <tr>
                       <td class="navdroplist"><b>NOME:</b>&nbsp;&nbsp;<%=corretor("nome")%></td>
                     </tr>
                     <tr>
                       <td class="navdroplist" colspan=2><b>ENDEREÇO:</b>&nbsp;&nbsp;<%=corretor("endereco")%>, <%=corretor("numero")%> - <%=corretor("complemento")%>&nbsp;&nbsp<%=corretor("bairro")%></td>
                     </tr>
                     <tr>
                       <td class="navdroplist" colspan=2><b>CIDADE:</b>&nbsp;&nbsp;<%=corretor("cidade")%> - <%=corretor("estado")%></td>
                     </tr>
                     <tr>
                     <%set unidade = conn.execute("select descricao from unidade where codigo="&corretor("cod_unidade"))%>
                       <td cla ss="navdroplist" colspan=2><b>UNIDADE:</b>&nbsp;&nbsp;<%=unidade("descricao")%></td>
                     </tr>
                     <tr>
                     <%set contrato=conn.execute("select count(codigo) as  total from contrato where cod_corretor="&corretor("codigo"))%>
                       <td class="navdroplist" colspan=2><b>CONTRATOS:</b>&nbsp;&nbsp;<%=contrato("total")%></td>
                     </tr>
                     <tr>
                     <%set acompanhamento=conn.execute("select count(codigo) as  total from acompanhamento where cod_corretor="&corretor("codigo")&" and cod_acompanhamento=1")%>
                       <td class="navdroplist" colspan=2><b>ACOMPANHAMENTOS AFETUADOS:</b>&nbsp;&nbsp;<%=acompanhamento("total")%></td>
                     </tr>
                     <tr>
                     <%set acompanhamento=conn.execute("select count(codigo) as  total from acompanhamento where cod_corretor="&corretor("codigo")&" and cod_acompanhamento=0")%>
                       <td class="navdroplist" colspan=2><b>ACOMPANHAMENTOS PENDENTES:</b>&nbsp;&nbsp;<%=acompanhamento("total")%></td>
                     </tr>
                     <tr><td colspan=4 height=5></td></tr>
                   </table>
                 </td>
               </tr>
            <%end if
             corretor.movenext
           loop
         end if%>
        </table> 
       <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
     </table> 
    </td>
  </tr>
</table>
</body>
</html>