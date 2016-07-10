<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
codigo2=request("codigo2")
pagina=request("pagina") 
sqldet = "SELECT TOP 6 registro_foto.*, registro_foto.descricao as reg_descricao, registro_foto.arquivo AS arquivo, imoveis.descricao, registro_foto.descricao AS foto FROM (registro_foto INNER JOIN imoveis ON registro_foto.cod_imovel = imoveis.codigo)  WHERE registro_foto.status = 0 AND registro_foto.cod_imovel = "&codigo2&""&sql_filtro
'response.write sqldet
set destaque=conn.execute(sqldet)
set imovel=conn.execute("select imoveis.*,  bairro.descricao as bairro, cidade.descricao as cidade, estado.descricao as estado from (((imoveis INNER JOIN bairro on bairro.codigo=imoveis.cod_bairro)INNER JOIN cidade on cidade.codigo=imoveis.cod_cidade)INNER JOIN estado on estado.codigo=imoveis.cod_estado) where imoveis.codigo="&codigo2)

Set rsPE = conn.execute("Select * from perfil_empreendimento where cod_imovel = "&codigo2)
Set rsPL = conn.execute("Select * from perfil_lazer where cod_imovel = "&codigo2)
Set rsPS = conn.execute("Select * from perfil_seguranca where cod_imovel = "&codigo2)
Set rsPI = conn.execute("Select * from perfil_imovel where cod_imovel = "&codigo2)
%>

<html>
<head>
<title>Detalhes do Imóvel</title>
<script language="javascript" src="formatacao.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="estilo.css" type="text/css">
<style type="text/css">
<!--
body {
	background-color: #e2ddc0;
}
-->
</style></head>
<script language="javascript">
  function pop_preco(url)
  {
    window.open(url,"pop_preco","resizable=yes,scrollbars=no,location=no,top=0,left=100,width=300,height=200");
  }
  function linkImagem() {
     window.location="#linkImagem";
  }
  function changetext(whichcontent){

  if (document.all||document.getElementById){
  cross_el=document.getElementById? document.getElementById("descriptions"):document.all.descriptions
cross_el.innerHTML='<font face="Verdana"><small>'+whichcontent+'<font></small>'
  }
  else if (document.layers){
  document.d1.document.d2.document.write('<font face="Verdana"><small>'+whichcontent+'</small></font>')
  document.d1.document.d2.document.close()
 }
}
 </script>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table width="610"  border="0" align="center" cellpadding="2" cellspacing="0">
  <tr>
    <td><img src="../../imagens/botoes/detalhes.gif" width="610" height="34"></td>
  </tr>
  <tr>
    <td><table width="100%"  border="0" cellspacing="1" cellpadding="1">
      <tr>
        <td width="180" align="center">
        <%if not destaque.eof then%>
        <img src="../../imagens/fotos/<%=destaque("arquivo")%>" width="162" height="290">
        <%else%>
        <img src="../../imagens/nao-disponivel.gif">
        <%end if%>        </td>
        <td valign="top"><table width="100%" height="290"  border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td height="22" class="txtr10b">Im&oacute;vel: </td>
            <td class="texto"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <%if imovel("tipo_imovel") <> "" then
                  Set rsTipo = conn.execute("Select descricao from tipo_imovel where codigo="&imovel("tipo_imovel"))
                  tipo = rsTipo("descricao")		
              end if%>
                <tr>
                  <td><%if imovel("descricao") <> "" then response.write "<b>"&imovel("descricao")&"</b>, " end if%><%=imovel("subtipo_imovel")%>, <%=tipo%></td>
                  <td width="86" align="right"><a href="javascript:history.back()"><img src="../../imagens/voltar1.gif" width="86" height="26" border="0"></a></td>
                </tr>
              </table></td>
          </tr>
          <tr bgcolor="D9D3AF">
            <td width="28%" height="22" bgcolor="D9D3AF" class="txtr10b"> Endere&ccedil;o:</td>
            <td width="72%" class="texto"><%=imovel("endereco")%></td>
          </tr>
          <tr>
            <td height="22" class="txtr10b">&Aacute;rea Priv.:</td>
            <td class="texto"><%=imovel("cod_metragem")%> m&sup2;</td>
          </tr>
          <tr bgcolor="D9D3AF">
            <td height="22" bgcolor="D9D3AF" class="txtr10b">Descri&ccedil;&atilde;o do im&oacute;vel:</td>
            <td class="texto"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="123" height="17">Dormit&oacute;rios:</td>
                <td width="175"><%=imovel("Dormitorio")%></td>
              </tr>
              <tr>
                <td height="17">Suite(s):</td>
                <td><%=imovel("suites")%></td>
              </tr>
              <tr>
                <td height="17">Vaga(s) de garagem:</td>
                <td><%=imovel("garagem")%></td>
              </tr>
              <%if imovel("cod_categoria") <> "" then
                  cate = conn.execute("Select descricao from tipo_categoria where codigo="&imovel("cod_categoria"))%>
              <tr>
                  <td height="17">Categoria:</td>
                  <td><%=cate("descricao")%></td>
              </tr>
              <%end if%>
              <tr>
                <td height="17">Imóvel com dívida:</td>
                <td><%if imovel("divida") = "1" then response.write "Sim" else response.write "Não" end if%></td>
              </tr>
              <%if imovel("cod_idade_imovel") <> "" then
                  idade = conn.execute("Select descricao from tipo_idade_imovel where codigo="&imovel("cod_idade_imovel"))%>
              <tr>
                <td height="17">Idade Imóvel:</td>
                <td><%=idade("descricao")%></td>
              </tr>
              <%end if%>
            </table></td>
          </tr>
          <tr>
            <td height="22" class="txtr10b">Destalhes do im&oacute;vel:</td>
            <td class="texto">
              <%If not rsPE.eof then%>
                  <span class="estilo"><b>Infraestrutura:</b>
                        <table width=100% cellspacing=1 cellpadding=1 border=0>
                          <tr bgcolor="#B5AE67" class="texto">
                            <td width=50% height="18"> <font color="#FFFFFF">Descrição</font></td>
                            <td width="50%" height="18" align=center> <font color="#FFFFFF">Quantidade</font> </td>
                          </tr>
                          <%do while not rsPE.eof %>
                          <tr>
                            <td width="80%" height="18">
                              <%set empreendimento_nome=conn.execute("select * from tipo_empreendimento where codigo="&rsPE("cod_empreendimento"))%>
                            <%=empreendimento_nome("descricao")%> </td>
                            <td width="30%" height="18" align=center> <%=rsPE("quantidade")%> </td>
                          </tr>
                          <%rsPE.movenext%>
                          <%loop%>
                        </table>
                  </span>
              <%End IF%>
              <%If not rsPL.eof then%><br>
                  <span class="estilo"><b>Lazer:</b>
                        <table width=100% cellspacing=1 cellpadding=1 border=0>
                          <tr>
                            <td bgcolor=#B5AE67 width=100%> <font color="#FFFFFF">Descrição</font> </td>
                          </tr>
                          <%do while not rsPL.eof %>
                          <tr>
                            <td>
                              <%set lazer_nome=conn.execute("select * from lazer where codigo="&rsPL("cod_lazer"))%>
                              <%=lazer_nome("descricao")%> </td>
                          </tr>
                          <%rsPL.movenext%>
                          <%loop%>
                        </table>
                  </span>
              <%End IF%>
              <%If not rsPS.eof then%><br>
                  <span class="estilo"><b>Segurança:</b>
                        <table width=100% cellspacing=1 cellpadding=1 border=0>
                          <tr>
                            <td bgcolor=#B5AE67 width=100%> <font color="#FFFFFF">Descrição</font> </td>
                          </tr>
                          <%do while not rsPS.eof %>
                          <tr>
                            <td>
                              <%set seguranca_nome=conn.execute("select * from seguranca where codigo="&rsPS("cod_seguranca"))%>
                              <%=seguranca_nome("descricao")%> </td>
                          </tr>
                          <%rsPS.movenext%>
                          <%loop%>
                        </table>
                  </span>
              <%End IF%>            </td>
          </tr>
          <tr bgcolor="D9D3AF">
            <td height="22" bgcolor="D9D3AF" class="txtr10b">Observa&ccedil;&otilde;es:</td>
            <td class="texto"><%=imovel("observacao")%></td>
          </tr>
          <tr>
            <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr align="center">
                <%if session("tipo")="2" or session("tipo")="" then%>
                <td width="50%"><a href="cad_contato.asp?codigo=<%=session("cod")%>&codigo2=<%=codigo%>&imovel=<%=codigo2%>&pagina=popup.asp"><img src="../../imagens/botoes/interresado.gif" width="123" height="26" border="0"></a></td>
                <%end if%>
                <td width="50%"><a href="javascript:pop_preco('detalhe_preco.asp?codigo=<%=session("cod")%>&codigo2=<%=codigo%>&imovel=<%=codigo2%>')"><img src="../../imagens/botoes/pre&#231;o.gif" width="157" height="25" border="0"></a></td>
              </tr>
            </table></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <%if codigo <> 0 or codigo <> "" then
  sqlpic = "Select DISTINCT tipo_fotos.* from tipo_fotos INNER JOIN registro_foto ON registro_foto.cod_comodo = tipo_fotos.codigo where registro_foto.cod_imovel = "&codigo2&" AND registro_foto.status = 0"
  'response.write sqlpic
  Set fotos = conn.execute(sqlpic)%>
  <%
  If not fotos.eof then
    While not fotos.eof%>
  <tr>
    <td>&nbsp;<font class='estilo'><b><%=UCase(fotos("descricao"))%></b></font></td>
  </tr>
  <tr>
    <td>
    <%
    sqlim = "SELECT registro_foto.*, registro_foto.descricao as reg_descricao, registro_foto.arquivo AS arquivo, imoveis.descricao, registro_foto.descricao AS foto FROM (registro_foto INNER JOIN imoveis ON registro_foto.cod_imovel = imoveis.codigo)  WHERE registro_foto.status = 0 AND registro_foto.cod_imovel = "&codigo2&" AND registro_foto.cod_comodo = "&fotos("codigo")&""&sql_filtro
    'response.write sqlim
    Set pic = conn.execute(sqlim)
    %>
    <table border="0" cellspacing="8" cellpadding="0">
      <tr>
        <%count=0%>
        <%do while not pic.eof %>
  	      <td class='estilo'> 
  	        <table border=0 class='estilo' cellspacing='0' cellpadding='0' height='80'>
  	          <tr>
  	            <td>
  	              <a href='javascript:abreImagem(<%=pic("codigo")%>)'><img src='../../imagens/fotos/<%=pic("arquivo")%>' width='76' height='76' border='0'></a>
  	              <!--a href='javascript:showpic(<%'=pic("codigo")%>)'><img src='../../imagens/fotos/<%'=pic("arquivo")%>' width='76' height='76' border='0'></a-->
  	            </td>
  	          </tr>
  	          <tr>
  	           <td class='estilo' align='center'><%=pic("reg_descricao")%></td> 
  	          </tr> 
  	        </table>  	      </td>
        <%If count = 6 then
            count = 0
            response.write "</tr><tr>"
          Else
            count=count+1
          End If
        pic.movenext
        loop%>
         </script>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="../../imagens/white.jpg" width="1" height="1"></td>
  </tr>
  <%fotos.MoveNext
    WEND
  Else%>
  <tr>
    <td>
    <table border="0" cellpadding="0" cellspacing="8">
      <tr>
          <%count=0%>
          <%do while not destaque.eof %>
  	         <td class='estilo' align='center'>
  	           <table border=0 class='estilo' cellspacing='0' cellpadding='0' height='80' align=center>
  	             <tr>
  	               <td align='center'><a href='javascript:abreImagem(<%=destaque("codigo")%>)'><img src='../../imagens/fotos/<%=destaque("arquivo")%>' width='76' height='76' border='0'></a></td> 
  	             </tr>
  	             <tr>
  	               <td align='center' class='estilo'><%=destaque("reg_descricao")%></td> 
  	             </tr>
  	           </table>  	         </td>
          <%If count = 6 then
              count = 0
              response.write "</tr><tr>"
            Else
              count=count+1
            End If
          destaque.movenext
          loop%>
         </script>
      </tr>
    </table>
    
    </td>
  </tr>
  <%End If%>
  <%end if%>
  <IFRAME name="mos_img" scrolling="no" frameborder="0" WIDTH=0 HEIGHT=0>
	</IFRAME>
	<form target="mos_img" name="ped_form3" method="post" action="abre_imagem.asp">
			<input type="hidden" name="codimg" value="">
	</form>
	<script language=Javascript>
	function abreImagem(cod){
	  document.ped_form3.codimg.value = cod;
		document.ped_form3.submit();
  }
	</script>
</table>
</body>
</html>