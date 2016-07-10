<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
codigo=request("codigo")
Set visita = Server.CreateObject( "ADODB.Recordset" ) 
visita.activeConnection = conn
visita.CursorType = 3  
radio=request("radio")
opcao=request("opcao")
corretor=request("corretor")
imovel=request("imovel")
box=request("deletar")
ordem=request("ordem")
ordem2=request("ordem2")
pesquisa=replace(trim(ucase(request("pesquisa"))),"'","")
visita.open "select visita.*, visita.codigo as codigo, visita.email as email_visita, visita.hora_visita as hora, visita.data_visita as data, visita.nome visita, visita.ddd as ddd_visita, visita.fone as fone_visita,imoveis.* ,imoveis.codigo as imovel, corretor.nome as corretor , corretor.email as email , corretor.ddd_fone as ddd , corretor.fone as fone from ((visita inner join corretor on visita.cod_corretor = corretor.codigo) inner join imoveis on visita.cod_imovel=imoveis.codigo)  where visita.status=0 and visita.codigo ="&codigo,conn
if box <> "" then
   conn.Execute ("update acompanhamento set status=1 where codigo IN ("&box&")")
end if
currentPage = Request( "currentPage" )
Set contador = Server.CreateObject( "ADODB.Recordset" )
contador.activeConnection = conn
contador.CursorType = adOpenStatic
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 3
if ordem="" then
   ordem="acompanhamento.descricao"
end if
if pesquisa <> "" then
  if radio = 1 then
    sql=" and acompanhamento.descricao like '%"&pesquisa&"%' "
  else
    if radio = 2 then
      sql=" and tipo_acompanhamento.descricao like '%"&pesquisa&"%' "
    else
      if isdate(pesquisa) then
      sql=" and acompanhamento.data = convert(datetime,'"&pesquisa&"',103)"
      end if
    end if
  end if
end if
itens.Open "SELECT acompanhamento.* FROM (acompanhamento INNER JOIN tipo_acompanhamento ON acompanhamento.acompanhamento = tipo_acompanhamento.codigo) WHERE acompanhamento.status = 0 AND  acompanhamento.cod_visita ="&codigo&sql&" ORDER BY "&ordem&" "&ordem2,conn%>
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
          <td class="navdroplist" align=center><B>IMPRESSÃO VISITA</B></td>
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
           QUANTIDADE DE REGISTRO:&nbsp<b><%=visita.recordcount%></b>
          </td>
        </tr>
      </table>
      <br>
      <hr>
      <table width=100% align="center" bgcolor="#FFFFFF" border=0>
      <%If visita.EOF = true then%>
        <tr>
          <td align=center></td>
          <td class="navdroplist" width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tr>
        </table>
      <%else%>
        <table width=100% border=0 cellspacing="0" cellpadding="0">
          <%do while not visita.eof%>
            <tr> 
               <td valign=top>
                  <table width=100% border=0 cellspacing="0" cellpadding="0">
                    <tr>
                      <td><u><B>VISITA</B></u></td>
                    </tr>
                    <tr>
	              <td class="navdroplist" width=60><b>NOME:</b></td>
                      <td class="navdroplist" colspan=3><%=visita("visita")%></td>
	            </tr>
	            <tr> 
	               <td class="navdroplist" width=60><b>E-MAIL:</b></td>
	               <td class="navdroplist" colspan=3><%=visita("email_visita")%></td>
	            </tr>
	            <tr> 
	               <td class="navdroplist" width=60><b>DDD:</b></td>
	               <td class="navdroplist" colspan=3><%=visita("ddd_visita")%></td>
	            </tr>
	            <tr> 
	               <td class="navdroplist" width=60><b>FONE:</b></td>
	               <td class="navdroplist" colspan=3><%=visita("fone_visita")%></td>
	            </tr>
	            <tr> 
	               <td class="navdroplist" width=60><b>DATA:</b></td>
	               <td class="navdroplist" colspan=3><%=visita("data")%></td>
	            </tr>
	            <tr>
	               <td class="navdroplist" width=60><b>HORA:</b></td>
	               <td class="navdroplist" colspan=3><%=visita("hora")%></td>
	            </tr>
	            <%if visita("cod_classificacao_interessado") <> "0" then%>
                      <tr>
                         <td class="navdroplist" width=60><b>CLASSIFICAÇÃO:</b></td>
                         <%set classif=conn.execute("select descricao from classificacao_interessado where codigo="&visita("cod_classificacao_interessado"))%>
                         <td class="navdroplist"><%=classif("descricao")%></td>
                      </tr>
                    <%end if%>
	            <tr>
                      <td colspan=3 height=2>&nbsp;</td>
                    </tr>
                    <tr>
                      <td colspan=3><u><B>CORRETOR</B></u></td>
                    </tr>
	            <tr>
	              <td class="navdroplist" width=60><b>NOME:</b></td>
	              <td class="navdroplist" colspan=3><%=visita("corretor")%></td>
	            </tr>
	            <tr>
	              <td class="navdroplist" width=60><b>E-MAIL:</b></td>
	              <td class="navdroplist" colspan=3><%=visita("email")%></td>
	            </tr>
	            <tr>
	              <td class="navdroplist" width=60><b>DDD:</b></td>
	              <td class="navdroplist" colspan=3><%=visita("ddd")%></td>
	            </tr>
	            <tr>
	              <td class="navdroplist" width=60><b>FONE:</b></td>
	              <td class="navdroplist" colspan=3><%=visita("fone")%></td>
	            </tr>
	            <tr>
                      <td colspan=3 height=2>&nbsp;</td>
                    </tr>
                    <tr>
                      <td colspan=3><u><B>IMÓVEL</B></u></td>
                    </tr>
	            <tr>
	              <td class="navdroplist" width=130><b>DESCRIÇÃO:</b></td>
	              <td class="navdroplist" colspan=3><%=visita("imovel")%></td>
	            </tr>
	            <tr>
	              <td class="navdroplist" width=130><b>ENDEREÇO:</b></td>
	              <td class="navdroplist" colspan=3><%=visita("endereco")%> &nbsp; - &nbsp; <%=visita("numero")%> <%=visita("complemento")%></td>
	            </tr>
	            <tr>
	              <tr><td class="navdroplist" width=130><b>BAIRRO:</b></td>
	              <%set bairro = conn.execute ("select * from bairro where codigo = "&visita("cod_bairro"))%>
	              <td class="navdroplist"><%=bairro("descricao")%></td></tr>
	              <td class="navdroplist" width=130><b>CIDADE:</b></td>
	              <%set cidade = conn.execute ("select * from cidade where codigo = "&visita("cod_cidade"))%>
	              <td class="navdroplist"><%=cidade("descricao")%></td>
	            </tr>
	            <tr>
	              <tr><td class="navdroplist" width=130><b>ESTADO:</b></td>
	              <%set estado = conn.execute ("select * from estado where codigo = "&visita("cod_estado"))%>
	              <td class="navdroplist"><%=estado("descricao")%></td></tr>
	            </tr>
	            <tr>
	              <td class="navdroplist" width=130><b>UNIDADE:</b></td>
	              <td class="navdroplist">
	                <%set unidade = conn.execute ("select * from unidade where codigo in ("&visita("cod_unidade")&")")
		          do while not unidade.eof%>             
	                    <%=unidade("descricao")%>
	                  <%unidade.movenext
	                  loop%>
	              </td>
	            </tr>
	            <tr>
	              <td class="navdroplist" width=130><b>ESTÁGIO DA OBRA:</b></td>
	              <td class="navdroplist">
	                <%set estagios_obra = conn.execute ("select * from estagios_obra where codigo in ("&visita("cod_estagios_obra")&")")
		          do while not estagios_obra.eof%>             
	                    <%=estagios_obra("descricao")%>
	                  <%estagios_obra.movenext
	                  loop%>
	              </td>
	            <tr>
	              <td class="navdroplist" width=130><b>DATA INCLUSÃO:</b></td>
	              <td class="navdroplist"><%=visita("data_inclusao")%></td>
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
                        <td bgcolor=#AAAAAA>
                        <span class="navdroplist"><font color="#FFFFFF">COMODO</font></span>
	                </td>
                        <td bgcolor=#AAAAAA align=center>
                        <span class="navdroplist"><font color="#FFFFFF">QUANTIDADE</font></span>
	                </td>
	              </tr>
	              <%set cbai=conn.execute("select * from perfil_imovel where cod_imovel="&visita("imovel")&" and status=0 ORDER BY codigo desc")%>
	              <%do while not cbai.eof %>
	              <tr>
	                <td  class="navdroplist" >
	                  <%set comodo_nome=conn.execute("select * from tipo_comodo where codigo="&cbai("cod_comodo"))%>
	                  <%=comodo_nome("descricao")%>
	                <td align=center  class="navdroplist" >
	                  <%=cbai("quantidade")%>
	                </td>
	              </tr>
	               <%cbai.movenext%>
 	             <%loop%>
                     <tr>
                       <td bgcolor=#AAAAAA>
                       <span class="navdroplist"><font color="#FFFFFF">SERVIÇO</font></span>
                       <td bgcolor=#AAAAAA align=center>
                       <span class="navdroplist"><font color="#FFFFFF">VALOR</font></span>
                     </tr>
                     <%set cbai=conn.execute("select * from perfil_servico where cod_imovel="&visita("imovel")&" and status=0 ORDER BY codigo desc")%>
                     <%do while not cbai.eof %>
                     <tr>
                       <td><%set servico=conn.execute("select * from servico where codigo="&cbai("cod_servico"))%>
                           <%=servico("descricao")%></span>
                       <td align=center  class="navdroplist" >
                           R$<%=formatnumber(cbai("valor"),2)%>
                       </td>
                     </tr>
                     <%cbai.movenext%>
                     <%loop%>
                     </tr>
                 </table>
         </td>
      </tr>
       <%visita.MoveNext
       loop%>
     </table>
     <%end if%>
     <br>
     <table width=100% cellspacing=0 cellpadding=0 border=0>
       <tr>
         <td class="navdroplist"><u><b>ACOPANHAMENTOS DESTA VISITA</b></u></td>
       </tr>
       <tr>
         <td class="navdroplist"></td>
       </tr>
     </table>
     <table width=100% cellspacing=0 cellpadding=0 border=0>
     <%If itens.EOF = true then%>
        <tr>
          <td align=center></td>
          <td class="navdroplist" width=100%><b>NENHUM REGISTRO ENCONTRADO!</b></td>
        </tR>
        </table>
     <%else%>
     <%do while not itens.eof%>
     <%set tipo = conn.execute("select * from tipo_acompanhamento where codigo = "&itens("acompanhamento"))%>
       <tr>
        <td class="navdroplist"><b>TIPO:</b></td>
        <td class="navdroplist"><%=tipo("descricao")%></td>
       </tr>
       <tr>
        <td class="navdroplist" width=5><b>DATA:</b></td>
        <td class="navdroplist"><%=itens("data")%></td>
       </tr>
       <tr>
          <td class="navdroplist" width=20><b>DESCRIÇÃO:</b></td>
          <td class="navdroplist"><%=itens("descricao")%></td>
       </tr>
     </table>
     <table width=100% cellspacing=0 cellpadding=0 border=0>
       <tr>
          <%if itens("cod_acompanhamento") = "1" then%>
            <td class="navdroplist" colspan=2><b>ACOMPANHAMENTO EFETUADO</b></td>
          <%else%>
            <td class="navdroplist" colspan=2><b>ACOMPANHAMENTO NÃO EFETUADO</b></td>
          <%end if%>
       </tr>
       <tr>
         <td colspan=4></td>
       </tr>
       <tr>
         <td class="navdroplist" colspan=4 bgcolor="E8E8E8"></td>
       </tr>
       <tr>
         <td colspan=4></td>
       </tr>
     <%itens.MoveNext
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