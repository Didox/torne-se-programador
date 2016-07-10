<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
data_inicio=replace(trim(request("data_inicio")),"'","")
data_final=replace(trim(request("data_final")),"'","")
check = request("check")
Set itens = Server.CreateObject( "ADODB.Recordset" )
itens.activeConnection = conn
itens.CursorType = 3
if check="0" or check="" then
 itens.open "select visita.codigo as codigo, visita.email as email_visita, visita.hora_visita as hora, visita.data_visita as data, visita.nome visita, visita.ddd as ddd_visita, visita.fone as fone_visita,imoveis.* ,imoveis.codigo as imovel, corretor.nome as corretor , corretor.email as email , corretor.ddd_fone as ddd , corretor.fone as fone from ((visita inner join corretor on visita.cod_corretor = corretor.codigo) inner join imoveis on visita.cod_imovel=imoveis.codigo)  where visita.data_visita between convert(datetime ,'"&data_inicio&"', 103) and convert(datetime ,'"&data_final&"', 103) and visita.status=0 ORDER BY corretor.nome",conn
else
 itens.open "select visita.codigo as codigo, visita.email as email_visita, visita.hora_visita as hora, visita.data_visita as data, visita.nome visita, visita.ddd as ddd_visita, visita.fone as fone_visita,imoveis.* ,imoveis.codigo as imovel, corretor.nome as corretor , corretor.email as email , corretor.ddd_fone as ddd , corretor.fone as fone from ((visita inner join corretor on visita.cod_corretor = corretor.codigo) inner join imoveis on visita.cod_imovel=imoveis.codigo)  where visita.data_visita between convert(datetime ,'"&data_inicio&"', 103) and convert(datetime ,'"&data_final&"', 103) and visita.status=0 AND visita.codigo NOT IN (SELECT cod_visita FROM acompanhamento WHERE status = 0) ORDER BY corretor.nome",conn
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
            <a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/logopb.gif" border=0></a>
          </td>
        </tR>
      </table>
      <br>
      <table width=100% align="center" bgcolor="#f7f7f7" border=0>
        <tr>
          <td class="navdroplist" align=center><B>RELATÓRIO DE VISITA</B></td>
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
       <tr><td class="navdroplist"><br></td></tr>
       <%do while not itens.eof%>
       <table><tr><td></td></tr></table>
          
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td><u><B>VISITA</B></u></td>
              <td><u><B>CORRETOR</B></u></td>
            </tr>
            <tr> 
               <td valign=top>
                  <table width=100% border=0 cellspacing="0" cellpadding="0">
	            <tr>
	              <td class="navdroplist" width=60><b>NOME:</b></td>
                      <td class="navdroplist" colspan=3><%=itens("visita")%></td>
	            </tr>
	            <tr> 
	               <td class="navdroplist" width=60><b>E-MAIL:</b></td>
	               <td class="navdroplist" colspan=3><%=itens("email_visita")%></td>
	            </tr>
	            <tr> 
	               <td class="navdroplist" width=60><b>DDD:</b></td>
	               <td class="navdroplist" colspan=3><%=itens("ddd_visita")%></td>
	            </tr>
	            <tr> 
	               <td class="navdroplist" width=60><b>FONE:</b></td>
	               <td class="navdroplist" colspan=3><%=itens("fone_visita")%></td>
	            </tr>
	            <tr> 
	               <td class="navdroplist" width=60><b>DATA:</b></td>
	               <td class="navdroplist" colspan=3><%=itens("data")%></td>
	            </tr>
	            <tr>
	               <td class="navdroplist" width=60><b>HORA:</b></td>
	               <td class="navdroplist" colspan=3><%=itens("hora")%></td>
	            </tr>
	          </table>
               </td>
               <td valign=top>
                  <table width=100% border=0 cellspacing="0" cellpadding="0">
	            <tr>
	              <td class="navdroplist" width=60><b>NOME:</b></td>
	              <td class="navdroplist" colspan=3><%=itens("corretor")%></td>
	            </tr>
	            <tr>
	              <td class="navdroplist" width=60><b>E-MAIL:</b></td>
	              <td class="navdroplist" colspan=3><%=itens("email")%></td>
	            </tr>
	            <tr>
	              <td class="navdroplist" width=60><b>DDD:</b></td>
	              <td class="navdroplist" colspan=3><%=itens("ddd")%></td>
	            </tr>
	            <tr>
	              <td class="navdroplist" width=60><b>FONE:</b></td>
	              <td class="navdroplist" colspan=3><%=itens("fone")%></td>
	            </tr>
	          </table>
               </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
               <td><u><B>IMOVEL</B></u></td>
            </tr>
            <tr>
               <td valign=top colspan=2>
                  <table  border=0 cellspacing="0" cellpadding="0">
	            <tr>
	              <td class="navdroplist" width=130><b>DESCRIÇÃO:</b></td>
	              <td class="navdroplist" colspan=3><%=itens("imovel")%></td>
	            </tr>
	            <tr>
	              <td class="navdroplist" width=130><b>ENDEREÇO:</b></td>
	              <td class="navdroplist" colspan=3><%=itens("endereco")%> &nbsp; - &nbsp; <%=itens("numero")%> <%=itens("complemento")%></td>
	            </tr>
	            <tr>
	              <tr><td class="navdroplist" width=130><b>BAIRRO:</b></td>
	              <%set bairro = conn.execute ("select * from bairro where codigo = "&itens("cod_bairro"))%>
	              <td class="navdroplist"><%=bairro("descricao")%></td></tr>
	              <td class="navdroplist" width=130><b>CIDADE:</b></td>
	              <%set cidade = conn.execute ("select * from cidade where codigo = "&itens("cod_cidade"))%>
	              <td class="navdroplist"><%=cidade("descricao")%></td>
	            </tr>
	            <tr>
	              <tr><td class="navdroplist" width=130><b>ESTADO:</b></td>
	              <%set estado = conn.execute ("select * from estado where codigo = "&itens("cod_estado"))%>
	              <td class="navdroplist"><%=estado("descricao")%></td></tr>
	            </tr>
	            <tr>
	              <td class="navdroplist" width=130><b>UNIDADE:</b></td>
	              <td class="navdroplist">
	                <%set unidade = conn.execute ("select * from unidade where codigo in ("&itens("cod_unidade")&")")
		          do while not unidade.eof%>             
	                    <%=unidade("descricao")%>
	                  <%unidade.movenext
	                  loop%>
	              </td>
	            </tr>
	            <tr>
	              <td class="navdroplist" width=130><b>ESTÁGIO DA OBRA:</b></td>
	              <td class="navdroplist">
	                <%set estagios_obra = conn.execute ("select * from estagios_obra where codigo in ("&itens("cod_estagios_obra")&")")
		          do while not estagios_obra.eof%>             
	                    <%=estagios_obra("descricao")%>
	                  <%estagios_obra.movenext
	                  loop%>
	              </td>
	            <tr>
	              <td class="navdroplist" width=130><b>DATA INCLUSÃO:</b></td>
	              <td class="navdroplist"><%=itens("data_inclusao")%></td>
	            </tr>
	            <tr>
	              <td class="navdroplist" width=130><b>PERFIL DO IMOVEL:</b></td>
	              <td class="navdroplist">
	              </td>
	            </tr>
	          </table>
	        </td>
            </tr>
            <tr>
              <td colspan=3>
                  <table width=300 align=left cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
	              <tr>
	                <td bgcolor=#AAAAAA width=100%>
	                  <span class="estilo"><font color="#FFFFFF">Comodo</font></span>
	                </td>
	                <td bgcolor=#AAAAAA align=center>
	                  <span class="estilo"><font color="#FFFFFF">Quantidade</font></span>
	                </td>
	                </tr>
	              <%set cbai=conn.execute("select * from perfil_imovel where cod_imovel="&itens("imovel")&" and status=0 ORDER BY codigo desc")%>
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
          <table width=300 align=right cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
              <tr>
                <td bgcolor=#AAAAAA width=100%>
                  <span class="estilo"><font color="#FFFFFF">Serviço</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Valor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_servico where cod_imovel="&itens("imovel")&" and status=0 ORDER BY codigo desc")%>
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
          </table>
         
         </td>
      </tr>
      
   <tr><td colspan=4 height=10></td></tr>
   <tr><td bgcolor=#CCCCCC colspan=4 height=3></td></tr>
   <tr><td colspan=4 height=10></td></tr>
      <%itens.MoveNext
       loop%>
    <tr>
      <td class="navdroplist">&nbsp;</td>
      <td class="navdroplist">&nbsp;</td>
      <td class="navdroplist">&nbsp;</td>
    </tr>
           
    </table>
    <%end if%>
    <br>
    <center><a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/voltar2.gif" border=0>&nbsp;Voltar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.print()"><img src="../img/impressora.gif" border=0>&nbspImprimir</a></center>
    </td>
  </tr>
</table>
</body>
</html>