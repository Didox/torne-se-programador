<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
Set contrato = Server.CreateObject( "ADODB.Recordset" )
contrato.activeConnection = conn
contrato.CursorType = 3
contrato.open "select * from contrato where reajuste < convert(datetime ,'"&date()&"', 103) and status=0",conn%>
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
          <td class="navdroplist" align=center><B>RELATÓRIO REAJUSTES VENCIDOS</B></td>
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
          
           QUANTIDADE DE REGISTRO:&nbsp<b><%=contrato.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
           <table width=100% border=0 cellspacing="0" cellpadding="0">
             <%if not contrato.eof then%>
             <% do while not contrato.eof%>
             <table width=100% border=0 cellspacing="0" cellpadding="0">
               <tr>
                  <td class="navdroplist" width=130><b>NÚMERO:</b></td>
                  <td class="navdroplist" colspan=3><%=contrato("numero")%></td>
               </tr>
               <tr>
                  <td class="navdroplist" width=130><b>CORRETOR:</b></td>
                  <%set corretor = conn.execute("select * from corretor where codigo="&contrato("cod_corretor"))%>
                  <td class="navdroplist" colspan=3><%=corretor("nome")%></td>
               </tr>
               <tr>
                  <td class="navdroplist" width=130><b>CLIENTE:</b></td>
                  <%set cliente = conn.execute ("select * from clientes where codigo = "&contrato("cod_cliente"))%>
                  <td class="navdroplist"><%=cliente("nome")%></td></tr>
                  <td class="navdroplist" width=130><b>SERVIÇO:</b></td>
                  <%set servico = conn.execute ("select * from servico where codigo = "&contrato("tipo_servico"))%>
                  <td class="navdroplist"><%=servico("descricao")%></td>
               </tr>
               <tr>
                   <td class="navdroplist" width=130><b>IMÓVEL:</b></td>
                   <%set imovel = conn.execute ("select * from imoveis where codigo = "&contrato("cod_imovel"))%>
                   <td class="navdroplist"><%=imovel("descricao")%></td></tr>
                   <td class="navdroplist" width=130><b>FIADOR 1:</b></td>
                   <%set fiador1 = conn.execute ("select * from fiador where codigo = "&contrato("cod_fiador1"))%>
                   <td class="navdroplist"><%=fiador1("nome")%></td></tr>
                   <%set fiador2 = conn.execute ("select * from fiador where codigo = "&contrato("cod_fiador2"))%>
                   <%if contrato("cod_fiador2") > 0 then%>
                   <td class="navdroplist" width=130><b>FIADOR 2:</b></td>
                   <td class="navdroplist"><%=fiador2("nome")%></td>
                   <%end if%>
   	       </tr>
               <tr>
                  <td class="navdroplist" width=130><b>ESTÁGIO DA OBRA:</b></td>
                   <td class="navdroplist">
                   <%set estagios_obra = conn.execute ("select * from estagios_obra where codigo = "&imovel("cod_estagios_obra"))
	             do while not estagios_obra.eof%>             
                   <%=estagios_obra("descricao")%>
                   <%estagios_obra.movenext
                     loop%>
                   </td>
               </tr>
               <tr>
                   <td class="navdroplist" width=130><b>DATA INCLUSÃO:</b></td>
                   <td class="navdroplist"><%=contrato("data_inclusao")%></td><tr>
               </tr>
                     <tr>
             <td class="navdroplist" width=130><b>TIPO DE SERVIÇO:</b></td>            
            <table width=250 cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <font color="#FFFFFF">Serviço</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <font color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Valor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_servico where cod_imovel="&imovel("codigo")&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                  <%set servico=conn.execute("select * from servico where codigo="&cbai("cod_servico"))%>
                  <%=servico("descricao")%>
                <td align=center>
                  R$<%=formatnumber(cbai("valor"),2)%>
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
              </tr>
             <td class="navdroplist" width=130><b>TIPO DE COMODO:</b></td>            
            </table>
            <table width=250 cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <font color="#FFFFFF">Comodo</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <font color="#FFFFFF">&nbsp;&nbsp;&nbsp;Quantidade&nbsp;&nbsp;&nbsp;</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_imovel where cod_imovel="&imovel("codigo")&" and status=0 ORDER BY codigo desc")%>
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
            </table>
            <table width=100% border=0 cellspacing="0" cellpadding="0">
              <tr><td colspan=4 height=10></td></tr>
              <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
              <tr><td colspan=4 height=10></td></tr>
            </table>
            <%contrato.movenext
              loop%>
            <%else%>
               <tr>
                 <td  class="navdroplist" width=100%><b>Nenhum registro encontrado.</b></td>
               </tr>
            <%end if%> 
              <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
           </table>
    </td>
  </tr>
</table>
</body>
</html>