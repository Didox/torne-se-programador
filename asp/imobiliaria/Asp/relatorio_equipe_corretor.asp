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
if equipe <> "0" then
  sql2=" and codigo="&equipe
end if
if corretor<>"0" and equipe <>"0" then
  sql=" and codigo="&corretor
end if
Set contrato = Server.CreateObject( "ADODB.Recordset" )
contrato.activeConnection = conn
contrato.CursorType = 3
set contador=conn.execute("select count(codigo) as total from equipe where status=0 "&sql2)%>
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
          <td class="navdroplist" align=center><B>RELATÓRIO POR EQUIPE</B></td>
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
      <%set equipe_=conn.execute("select distinct * from equipe where status=0 "&sql2&" order by descricao")%>
      <%if equipe <> "0" or equipe = "" then%>
        <table width=100% border=0 cellspacing="0" cellpadding="0">
        <%if equipe_.eof=false then%>
          <%do while not equipe_.eof%>
              <tr>
                <td class="navdroplist" width=130><u><b>EQUIPE:&nbsp;&nbsp;<%=equipe_("descricao")%></b></u></td>
              </tr>
              <%set supervisor = conn.execute("select * from corretor where cod_equipe="&equipe_("codigo")&sql)%>
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
              <tr><td colspan=4 height=5></td></tr>
              <tr>
                <td>
                   <table width=100% border=0 cellspacing="0" cellpadding="0">
                     <tr>
                       <td class="navdroplist"><b>CORRETORES DA EQUIPE</b></td>
                     </tr>
                   </table>
                   <table width=100% border=0 cellspacing="0" cellpadding="0">
                    <%if not supervisor.eof then%>
                      <%do while not supervisor.eof%>
                       <tr>
                        <td class="navdroplist"><b>NOME:</b>&nbsp;&nbsp;<%=supervisor("nome")%></td>
                       </tr>
                       <tr>
                        <td class="navdroplist" colspan=2><b>ENDEREÇO:</b>&nbsp;&nbsp;<%=supervisor("endereco")%>, <%=supervisor("numero")%> - <%=supervisor("complemento")%>&nbsp;&nbsp<%=supervisor("bairro")%></td>
                       </tr>
                       <tr>
                        <td class="navdroplist" colspan=2><b>CIDADE:</b>&nbsp;&nbsp;<%=supervisor("cidade")%> - <%=supervisor("estado")%></td>
                       </tr>
                       <tr>
                       <%set unidade = conn.execute("select descricao from unidade where codigo="&supervisor("cod_unidade"))%>
                        <td cla ss="navdroplist" colspan=2><b>UNIDADE:</b>&nbsp;&nbsp;<%=unidade("descricao")%></td>
                       </tr>
                       <tr>
                        <%set contrato=conn.execute("select count(codigo) as  total from contrato where cod_corretor="&supervisor("codigo"))%>
                       <td class="navdroplist" colspan=2><b>CONTRATOS:</b>&nbsp;&nbsp;<%=contrato("total")%></td>
                       </tr>
                       <tr><td colspan=4 height=5></td></tr>
                        <%supervisor.movenext%>
                        <%loop%>
                      <%else%>
                       <tr>
                        <td>NENHUM SUPERVISOR CADASTRADO</td>
                       </tr>
                    <%end if%>
                   </table>
                 </td>
               </tr>
            <%equipe_.movenext
           loop
         end if
         else%>
         <table width=100% border=0 cellspacing="0" cellpadding="0">
         <%if equipe_.eof=false then%>
          <%do while not equipe_.eof%>
          <%set supervisor=conn.execute("select * from corretor where cod_equipe="&equipe_("codigo")&" and status=0 order by nome")%>
           <tr>
             <td><b>EQUIPE:</b>&nbsp;<%=equipe_("descricao")%></td>
           </tr>
           <tr>
           <%if equipe_("cod_supervisor") = "0" then%>
             <td><b>EQUIPE SEM SUPERVISOR</b></td>
           <%else%>
             <td><b>SUPERVISOR:</b>&nbsp;<%=supervisor("nome")%></td>
           <%end if%>
           <tr><td colspan=4 height=5></td></tr>
           <tr>
                <td>
                   <table width=100% border=0 cellspacing="0" cellpadding="0">
                     <tr>
                       <td class="navdroplist"><b>CORRETORES DA EQUIPE</b></td>
                     </tr>
                   </table>
                   <table width=100% border=0 cellspacing="0" cellpadding="0">
                    <%if not supervisor.eof then%>
                      <%do while not supervisor.eof%>
                       <tr>
                        <td class="navdroplist"><b>NOME:</b>&nbsp;&nbsp;<%=supervisor("nome")%></td>
                       </tr>
                       <tr>
                        <td class="navdroplist" colspan=2><b>ENDEREÇO:</b>&nbsp;&nbsp;<%=supervisor("endereco")%>, <%=supervisor("numero")%> - <%=supervisor("complemento")%>&nbsp;&nbsp<%=supervisor("bairro")%></td>
                       </tr>
                       <tr>
                        <td class="navdroplist" colspan=2><b>CIDADE:</b>&nbsp;&nbsp;<%=supervisor("cidade")%> - <%=supervisor("estado")%></td>
                       </tr>
                       <tr>
                       <%set unidade = conn.execute("select descricao from unidade where codigo="&supervisor("cod_unidade"))%>
                        <td cla ss="navdroplist" colspan=2><b>UNIDADE:</b>&nbsp;&nbsp;<%=unidade("descricao")%></td>
                       </tr>
                       <tr>
                        <%set contrato=conn.execute("select count(codigo) as  total from contrato where cod_corretor="&supervisor("codigo"))%>
                       <td class="navdroplist" colspan=2><b>CONTRATOS:</b>&nbsp;&nbsp;<%=contrato("total")%></td>
                       </tr>
                       <tr><td bgcolor="#f5f5f5" colspan=4 height=3></td></tr>
                        <%supervisor.movenext%>
                        <%loop%>
                       <tr><td bgcolor="#g5g5g5" colspan=4 height=1></td></tr>
                       <tr><td colspan=4 height=4></td></tr>
                      <%else%>
                       <tr>
                        <td><b>NENHUM CORRRETOR CADASTRADO</b></td>
                       </tr>
                    <%end if%>
                   </table>
                 </td>
               </tr>
           </tr>
           <%equipe_.movenext
             loop%>
         <%else%>
           <tr>
             <td><b>EQUIPE SEM SUPERVISOR CADASTRADO</b></td>
           </tr>
         <%end if%>
         <%end if%>
        </table> 
       <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
     </table> 
    </td>
  </tr>
</table>
</body>
</html>