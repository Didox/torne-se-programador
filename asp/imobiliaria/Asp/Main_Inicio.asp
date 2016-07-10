<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
sql_filtro=replace(request("sql_filtro"),"$","%")
set destaque=conn.execute("SELECT TOP 6 registro_foto.*, imoveis.publicar, registro_foto.arquivo as arquivo, imoveis.descricao,registro_foto.descricao AS foto FROM (registro_foto INNER JOIN imoveis ON registro_foto.cod_imovel=imoveis.codigo) where registro_foto.status=0 AND destaque=1 and imoveis.publicar=1"&sql_filtro)%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<script language="javascript">
  function popup(url)
  {
    window.open(url,"popup","resizable=yes,scrollbars=yes,location=no,top=0,left=0,width=740,height=540");
  }
</script>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
            <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?currentPage=<%=currentPage%>&pagina=<%=pagina%>"name="form1">
            <tr><td></td></tr>
          </table>
            <table width="550" border="0" cellspacing="0" cellpadding="0" align="center">
               <tr>
                  <td valign="top" height="30" colspan=3><img src="../img/ico_titdestaque.gif" width="29" height="21" align="absbottom">
                     <b>IMÓVEIS EM DESTAQUE</b>
                  </td>
               </tr>
              <%If destaque.EOF = true then%>
               <table width="550" border="0" cellspacing="0" cellpadding="0" align=center>
                 <tr>
                   <td bgcolor=#D8DCD8>Não há Registros cadastrados.</td>
                 </tr>
              <%else%>
                 <tr><%
                do While Not destaque.EOF
                  if cor="D8DCD8" then
                     cor="EFF0EF"
                  else
                     cor="D8DCD8"
                  end if%> 
                    <td height="16" width="180"> 
                      <table width="141" height=20 border="0" cellspacing="0" cellpadding="0" align=center>
                        <tr> 
                          <td width="141"  bgcolor="#EFF0EF" ><b>&nbsp;&nbsp;</b></td>
                        </tr>
                      </table>
                      <table width="141" height=200 border="0" cellspacing="0" cellpadding="0" align=center>
                         <tr>
                          <td height="141" align=center  bgcolor="#EFF0EF"><a href="javascript:popup('popup.asp?codigo=<%=destaque("codigo")%>&codigo2=<%=destaque("cod_imovel")%>&pagina=Main_inicio.asp')"><img alt="Clique e Confira!" border=0 src="../fotos/<%=destaque("arquivo")%>" width=100></a>
                            <table width="141" height=80 border="0" cellspacing="0" cellpadding="0" align=center>
                              <tr>
                                <td  bgcolor="#EFF0EF" height="1">&nbsp;</td>
                              </tr>
                              <tr>
                                <span class="estilo"><td  align=center bgcolor="#EFF0EF" height="1"><a href="javascript:popup('popup.asp?codigo=<%=destaque("codigo")%>&codigo2=<%=destaque("cod_imovel")%>&pagina=Main_inicio.asp')"><b>&nbsp;&nbsp;<%=destaque("descricao")%></b></a></td>
                              </tr>
                              <tr>
                               <span class="estilo"><td align=center  bgcolor="#EFF0EF" height="1">&nbsp;&nbsp;<a href="javascript:popup('popup.asp?codigo=<%=destaque("codigo")%>&codigo2=<%=destaque("cod_imovel")%>&pagina=Main_inicio.asp')"><%=destaque("foto")%></a></td>
                             </tr>
                             <tr>
                              <td  bgcolor="#EFF0EF" align=center ><a href="javascript:popup('popup.asp?codigo=<%=destaque("codigo")%>&codigo2=<%=destaque("cod_imovel")%>&pagina=Main_inicio.asp')"><img alt="Clique e Confira!" src="../img/bt_conferir.gif" border=0 width="64"></a></td>
                            </tr>
                          </table>
                         </td>
                       </tr>
                       <tr><td height="5">&nbsp;</td></tr>
                      </table>
                    </td>
                  <%cont=cont+1%>
                  <%if cont=3 then%>
                   </tr><tr>
                  <%end if%>
                  <%destaque.movenext%>
                 <%loop%>
                 </tr>
              <%end if%>
            </table>
            <table align="center" border=0>
                 <tr>
                   <td class="estilo" align="center"><a href="Todos_imoveis.asp?pagina=Main_Inicio"><b>Veja todos<b></td>
                 </tr>
            </table>
        </td>
      </tr>
      </form>
    </table>
    <table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>      
    </td>
  </tr>
</table>
</body>
</html>

