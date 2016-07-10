<%@ LANGUAGE = VBScript.Encode %>
<% 

Response.Expires = 0
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

response.buffer = true %>
<!--#include file="conexao.asp"-->

<%
sU = Request.ServerVariables("HTTP_USER_AGENT")



If len(request("cod_idm"))>0 then 'o usuario quer trocar de idioma
  Set rsIdm = conexao.execute("select cod_idm from menu_idioma where cod_idm="&request("cod_idm")&"")
     If not rsIdm.eof then 'idioma existe, alterar o cookie
	   response.cookies("siteIdm")("cod_idm")=rsIdm("cod_idm")
	   response.expires = date + 1
	 else 'idioma nao existe, dar um refresh e voltar ao idioma inicial
	   response.cookies("siteIdm")("cod_idm")=""
	   response.expires = date + 1
	 End If
Else 'esta entrando pela primeira vez
   Set rsIdm = conexao.execute("select top 1 cod_idm from menu_idioma order by cod_idm")
   response.cookies("siteIdm")("cod_idm")=rsIdm("cod_idm")
   response.expires = date + 1
End If

Set rsCodHome = server.createobject("ADODB.Recordset")
rsCodHome.open "select cod_pagina from menu_site where cod_idm="&request.cookies("siteIdm")("cod_idm")&" and item_menu='H'", conexao, 3, 3

cod_pagina = ""
cod_pagina = rsCodHome("cod_pagina")

Set rsCodHome=nothing
 %>
<!--#include file="est_pag.asp"-->
<%

Set rsTitulos = conexao.execute("select * from menu_site where cod_pagina="&cod_pagina&" ")

if rsTitulos.eof then
  response.redirect "default.asp"
end if

Set rsInstitucional = conexao.execute("select * from institucional_textos where cod_pagina="&cod_pagina&" and Publicar='S' order by ID DESC")
%>
<html>
<head>
<title></title>
<meta name="description" 	content="BigSolutions // Criação e Desenvolvimento.">
<meta name="copyright" 		content="Copyright ©2001 - BigSolutions - All rights reserved">
<meta http-equiv="Author" 	name="Boris Mesel" content="Programação:DanielOgusuku // Design:AndréSalles">
<meta http-equiv="Reply-to" 	content="bigsolutions@bigsolutions.com.br">
<link rel="stylesheet" href="style3.css" type="text/css">



<style type="text/css">
<!--
a {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; text-decoration: none}
-->
</style>

<script language="javascript" src=script.js>
</script>


<%
  dt1 = year(now)
  If month(now)<10 then : dt1 = dt1 & "0" & month(now) : Else : dt1 = dt1 & month(now) : End If
  If day(now)  <10 then : dt1 = dt1 & "0" &   day(now) : Else : dt1 = dt1 &   day(now) : End If
%>
<!--#include file="pop_inc.asp"-->


<%If request.cookies("sbsv3")("CODUSER") <> "" then
	If session("abriu") = "" then
    		session("abriu") = 1 %>
		<script language="javascript">
    	      		window.open('pop_logado.asp','Pop','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,menubar=no,top=70,left=190,width=350,height=138');
		</script>		
<%	End if
End if
%>

</head>
<body bgcolor="#FFFFFF" text="black" link=#CCCCCC vlink=#CCCCCC alink=#FF0000 topmargin=0 leftmargin=0 marginwidth=0 marginheight=0>
<p><a name="topo"></a>
<%
resolucao = request.cookies("sbsv3")("RESOLUC")
%>
<!--#include file="topo.asp"-->
<table border=0 width=780 bgcolor=<%=back_cor%> cellspacing=0 cellpadding=0 <%If site_posicao <> "" and site_posicao <> "justify" then%>align="<%=site_posicao%>"<%End If%>>
  <tr> 
<%
If menu_exibe = "S" then%>
  <%If menu_estilo <> 4 then%>
    <td width=155 background="imagens/back_menu.gif" valign=top bgcolor="#<%=menu2_bg%>" rowspan="2"><!--#include file="coluna-esquerda.asp"--></td>
  <%End If%>
<%End IF%>
    <td valign="top" align="center" height="100%"> 
      <table border=0 width=100% cellspacing=0  cellpadding=0>
        <tr> 
          <td align="center" valign="top"> 
             <table border="0" cellpadding="0" cellspacing="0" width="100%"><!------ onde onde onde eu te falei---->
              <tr>
			  <td><img src="imagens/white.gif" width="7"></td>
              <td width="70%" valign=top align="center"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
		          <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tr><td width="100%"> 
                  <% If rsTitulos("imagem_titulo")<>"" then %>
                  <img src="imagens/<%=rsTitulos("imagem_titulo")%>">
                  <% Else %>
                  <% If rsTitulos("titulo_fonte_formatacao")<>"" then 
ff = rsTitulos("titulo_fonte_formatacao")
fc = replace(rsTitulos("titulo_fonte_formatacao"),"<","</")
else
ff=""
fc=""
End If 
session("titulo_item") = ""
titulo_item = rsTitulos("titulo_item")
session("titulo_item") = rsTitulos("titulo_item")
%>
                  <div id="Layer2" style="position:absolute; width:400px; height:30px; z-index:2; top: 124px; left: 174px"> 
                    <font color="#<%=rsTitulos("titulo_fonte_cor")%>" size="<%=rsTitulos("titulo_fonte_tam")%>" face="<%=rsTitulos("titulo_fonte")%>"><%=ff%><%=titulo_item%><%=fc%></font> 
                  </div>
                  <div id="Layer1" style="position:absolute; width:400px; height:30px; z-index:1; top: 126px; left: 173px"> 
                    <font color="#CCCCCC" size="<%=rsTitulos("titulo_fonte_tam")%>" face="<%=rsTitulos("titulo_fonte")%>"><%=ff%><%=titulo_item%><%=fc%></font> 
                  </div>
                  <%End If %>
                  <% If rsTitulos("texto_fonte_formatacao")<>"" then 
ff = rsTitulos("texto_fonte_formatacao")
fc = replace(rsTitulos("texto_fonte_formatacao"),"<","</")
else
ff=""
fc=""
End If %>
                  <font color="#<%=rsTitulos("texto_fonte_cor")%>" size="<%=rsTitulos("texto_fonte_tam")%>" face="<%=rsTitulos("texto_fonte")%>"><%=ff%>
				  <%If rsTitulos("txt_apresentacao")<>"" then
                         txt_apresentacao = replace(rsTitulos("txt_apresentacao"),"../imagens/","imagens/")
                    End If %><%=txt_apresentacao%>
				  <%=fc%></font>
				 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr align="center">
                      <td>
                        <!--#INCLUDE FILE="inc_banners.asp"-->
                       </td>
                       <td>
                        <!--#INCLUDE FILE="inc_banners.asp"-->
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
			<!--#INCLUDE FILE="empreendimentos.asp"-->
                      <% while not rsInstitucional.eof%>
                      <td valign="top" width="195"> 
                        <table width="98%" border="1" align="center" cellspacing="0" cellpadding="0">
                          <% If rsInstitucional("titulo_publicar")="S" then 
	   ' o administrador quer publicar o título %>
                          <tr> 
                            <td width="50%" align="left"><font face="<%=rsInstitucional("titulo_fonte")%>" color="<%=rsInstitucional("titulo_fonte_cor")%>" size="<%=rsInstitucional("titulo_fonte_tam")%>"> 
                              <% If rsInstitucional("titulo_fonte_formatacao")<>"" then 
ff = rsInstitucional("titulo_fonte_formatacao")
fc = replace(rsInstitucional("titulo_fonte_formatacao"),"<","</")
else
ff=""
fc=""
End If %>
<%=ff%><%=rsInstitucional("titulo")%><%=fc%></font></td>
                          </tr>
                          <% End If
	    'O Administrador quer publicar %>
                          <tr> 
                            <td valign="top">
                              <%If  rsInstitucional("imagem_url")<> "" then %>
                              <% If rsInstitucional("cod_link")<> 0 then %>
                              <a href="destaques_redir.asp?cod_link=<%=rsInstitucional("cod_link")%>"> 
                              <img src="imagens/<%=rsInstitucional("imagem_url")%>" align="<%=rsInstitucional("imagem_align")%>" border="0"></a> 
                              <% Else %>
                              <img src="imagens/<%=rsInstitucional("imagem_url")%>" align="<%=rsInstitucional("imagem_align")%>" border="0"> 
                              <% ENd IF %>
                              <% End If %>
                              <% 
If rsInstitucional("texto_fonte_formatacao") <> "" then 
	ff = rsInstitucional("texto_fonte_formatacao")
	fc = replace(rsInstitucional("texto_fonte_formatacao"),"<","</")
else
	ff=""
	fc=""
End If 
'response.write rsInstitucional("texto") & "<br>"

If rsInstitucional("texto") <> "" then
	texto = rsInstitucional("texto")
	texto = replace(replace(replace(replace((texto),"<P>",""),"</P>",""),"&nbsp;",""),"<P align=left>","")
	texto = replace(replace((texto),"<SUP>",""),"</SUP>","")
	texto = replace(replace(replace((texto),"<?XML:NAMESPACE PREFIX = O />",""),"<O:P>",""),"</O:P>","")
Else
	texto = ""
End If
%>
                              <% If rsInstitucional("cod_link")<>0 then 
							  'colocar o link no texto %>
                              <a href="destaques_redir.asp?cod_link=<%=rsInstitucional("cod_link")%>"><%=texto%></a> 
                              <%Else%>
                              <%=texto%> 
                              <% End If %>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <% 
intcont = intcont + 1

if intcont = 2 then
intcont=0
response.write "</tr><tr>"
end if

rsInstitucional.movenext
WEND 
rsInstitucional.Close
Set rsInstitucional=nothing %>
                    </tr>
                  </table>
				  <img src="imagem/white.gif" height="2">
                  <table width="97%" bgcolor="#ffffff" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td> 
                        <%
				sqln = "SELECT menu_site.flg_del, NOTICIAS_CONFIG.qua_cod, * "
				sqln = sqln & " FROM NOTICIAS_QUADRO INNER JOIN ((noticias_secao INNER JOIN "
				sqln = sqln & " menu_site ON noticias_secao.cod_pagina = menu_site.cod_pagina) "
				sqln = sqln & " INNER JOIN NOTICIAS_CONFIG ON noticias_secao.cod_pagina = NOTICIAS_CONFIG.cod_pagina) "
				sqln = sqln & " ON NOTICIAS_QUADRO.qua_cod = NOTICIAS_CONFIG.qua_cod "
				sqln = sqln & " WHERE ((menu_site.flg_del)='N')  and menu_site.area_restrita='N' "



				If trim(request.cookies("sbsv3")("GRUPO"))<>"" then 'nao esta logado, traz somente as paginas nao-restritas
					arrGrupo = split(request.cookies("sbsv3")("Grupo"),";")
					For j = 0 to Ubound(arrGrupo)
						sqln = sqln & " or (((menu_site.flg_del)='N')"
						sqln = sqln & " and menu_site.grupo like '%"& arrGrupo(j) &"%'  )"
					Next				
				End IF
				
				sqln = sqln & " ORDER BY noticias_quadro.qua_cod, noticias_secao.cod_noticia DESC"
					
					'response.write "<b>" & sqln & "</b><br><br>"
					'response.end
					
    			    Set rsNotHome=server.createobject("ADODB.Recordset")
					rsNotHome.open sqln,conexao, 3, 3
					

					  pagina_ult = ""  'controle para guardar o ultimo codigo da pagina
					  Do Until rsNotHome.eof

					  If pagina_ult <> rsNotHome("noticias_secao.cod_pagina") then
							cont_not = 1 'contador de noticias
  						img_noticia     = rsNotHome("img_noticia")
							img_bullet      = rsNotHome("img_bullet")
							not_home_dt_exb = rsNotHome("not_home_dt_exb")
							noticias_home   = rsNotHome("noticias_home")
							pagina_ult      = rsNotHome("noticias_secao.cod_pagina") %>

                        <img src="imagens/<%=img_noticia%>">
                        <%
						End If

					  If (date >= rsNotHome("data_ini")) and (date <= rsNotHome("data_fim")) and (cont_not<=noticias_home) then
  					        cont_not = cont_not + 1 %>
							<%If trim(img_bullet)<>"" then %>
							<img src="imagens/<%=img_bullet%>"> 
							<%End If%>
                        <a href="m5.asp?cod_noticia=<%=rsNotHome("cod_noticia")%>&cod_pagina=<%=rsNotHome("noticias_secao.cod_pagina")%>"><font size="1" face="vardana" color="8E8E8E"><b><%If not_home_dt_exb="S" then%><%=rsNotHome("data_ini")%> - <%End If%><%=rsNotHome("titulo")%></b></font></a><br>
                        <% End if
					   rsNotHome.movenext
				       Loop
					   rsNotHome.Close
					   Set rsNotHome=nothing %>
                      </td>
                    </tr>
                  </table>
				  <td background="imagens/linha.gif" width="5"><IMG src="imagens/white.gif" width="10"></td>
                </td>
                <td width="30%" valign="top" align="center">
<%
sqlCal = "SELECT CALENDARIO_CONFIG.cod_pagina, MENU_SITE.area_restrita, MENU_SITE.grupo "
sqlCal = sqlCal & " FROM CALENDARIO_CONFIG, MENU_SITE WHERE (((CALENDARIO_CONFIG.cod_pagina)=[MENU_SITE].[cod_pagina]))"
Set rsVer = conexao.execute(sqlCal)	
If not rsVer.EOF then 


		arrGrupo = split(request.cookies("sbsv3")("GRUPO"),";")	
		For t = 0 to Ubound(arrGrupo)
			If inStr(1,rsVer("grupo"),arrGrupo(t)) > 0 then
				vVerifica = "S"
			End if
		Next	

	If rsVer("area_restrita")="N" or vVerifica="S" then 'a pagina nao é restrita ou é restrita, mas o usuário esta logado
		%>
	<!--#include file="calendario.asp"--><br>
<%  		
	End If

End if

rsVer.Close
Set rsVer = nothing	

	  
	sqldestaque = "select * from destaques where cod_pagina like '%/"&cod_pagina&"/%' and data_ini_num <= "&dt1&" and		data_fim_num >= "&dt1&" order by order_destaques"
	Set rsVerDestaque = conexao.execute(sqldestaque)
	If not rsVerDestaque.eof then %>
					<!--#include file="destaques_dir.asp"-->
	<% End if
	'ver se existe destaque %>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td valign=bottom align="center">
    <%If rodape_exb="S" then%>
    <font face="Verdana" size="1"> 
      <%IF right((rod),9)="&middot; " then
	   rod = left((rod),(len(rod)-9))
	End If%>
      <%=rod%>
      </font>
      <%End IF%>
      <!---<hr color="#294458" size="1" width="95%">--->
      <font color="#000000" size="1" face="Verdana"> 
  <%If rodape_copyright="S" then%>
      <% Set rsContHome = conexao.execute("select cont_home from site")'ver se deseja contador na home
	  If rsContHome("cont_home")="S" then
	    sql = "SELECT Sum(EST_PAG.acessos) AS cont_total "
		sql = sql & "FROM EST_PAG GROUP BY EST_PAG.cod_pagina "
		sql = sql & "HAVING (((EST_PAG.cod_pagina)="&cod_pagina&"))"
	    Set rsTotAcesso = conexao.execute(sql)
	    response.write "Este site já foi acessado <b>" & rsTotAcesso("cont_total") & "</b> vezes <br>"
	  rsTotAcesso.Close
		Set rsTotAcesso=nothing
	  End If %>

      	<%=rodape%>
  <%End If%>
      </font> 
      <% If request.cookies("visitou_home")<>"S" then
response.cookies("visitou_home")="S"
response.expires = date + 1
'criar um cookie enquanto estiver com o browser aberto para nao contar a estatistica na mesma sessão
%>

      <SCRIPT type="text/javascript" language="JavaScript">
var d=new Date(); 
var s=d.getSeconds(); 
var m=d.getMinutes();
var x=s*m;
f='' + escape(document.referrer);
if (navigator.appName=='Netscape'){b='NS';}
if (navigator.appName=='Microsoft Internet Explorer'){b='MSIE';}
if (navigator.appVersion.indexOf('MSIE 3')>0) {b='MSIE';}
u='' + escape(document.URL); w=screen.width; h=screen.height;
v=navigator.appName; 
fs = window.screen.fontSmoothingEnabled;
if (v != 'Netscape') {c=screen.colorDepth;}
else {c=screen.pixelDepth;}
j=navigator.javaEnabled();
info='w=' + w + '&h=' + h + '&c=' + c + '&r=' + f + '&u='+ u + '&fs=' + fs + '&b=' + b + '&x=' + x + '&p=2';
document.write('<img src="est_count.asp?'+info+ '" width=0 height=0 border=0>');
</script>
      <% End If %>
    </td>
  </tr>
</table>
<table border=0 cellspacing=0  cellpadding=0>
<style>
<!--
rodape {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #998E5C; text-decoration: none }
-->
</style>
<tr>
	<td>
 <center><font color="#998E5C" size="1" face="Verdana, Arial" class=rodape>		<a href="m3.asp?cod_pagina=970">Anuncie no Plenanet</a>  |  <a href="#">Sobre o Plenanet</a>  |  <a href="#">Trabalhe no Plenanet.com</a>  | <a href="#">Sala de Imprensa</a>   |   <a href="#">Termo de Uso</a>   |   <a href="m3.asp?cod_pagina=964">Politica de Privacidade</a> </font></center>
	</td>
</tr>

<tr>
	<td>
	
		<img src="imagens/rodape.gif">
	</td>
</tr>
</table>

</body>
</html>

<%
rsTitulos.close
Set rsTitulos=nothing

conexao.close
Set conexao=nothing
%>