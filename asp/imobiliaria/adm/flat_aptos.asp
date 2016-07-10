<%set destaque=conn.execute("SELECT TOP 6 registro_foto.*, imoveis.publicar, registro_foto.arquivo as arquivo, imoveis.descricao,registro_foto.descricao AS foto FROM (registro_foto INNER JOIN imoveis ON registro_foto.cod_imovel=imoveis.codigo) where registro_foto.status=0 AND imoveis.publicar=1 and imoveis.subtipo_imovel = 'APARTAMENTO' and imoveis.subtipo_imovel = 'FLAT'")%>
<script language="javascript">
  function popup(url)
  {
    window.open(url,"popup","resizable=yes,scrollbars=yes,location=no,top=0,left=0,width=740,height=540");
  }
</script>
<table width="550" border="0" cellspacing="0" cellpadding="0" align="center">
              <%If destaque.EOF = true then%>
                 <tr>
                   <td bgcolor=#D8DCD8>Não há Registros cadastrados.</td>
                 </tr>
              <%else%>
                 <tr><%
                cont = 0
                do While Not destaque.EOF
                  if cor="DADAB5" then
                     cor="F4F2EA"
                  else
                     cor="DADAB5"
                  end if%> 
                    <td height="16" width="180"> 
                      <table width="141" height=20 border="0" cellspacing="0" cellpadding="0" align=center>
                        <tr> 
                          <td width="141"  bgcolor="#EFF0EF" ><b>&nbsp;&nbsp;</b></td>
                        </tr>
                      </table>
                      <table width="141" height=200 border="0" cellspacing="0" cellpadding="0" align=center>
                         <tr>
                          <td height="141" align=center  bgcolor="#EFF0EF"><a href="javascript:popup('popup.asp?codigo=<%=destaque("codigo")%>&codigo2=<%=destaque("cod_imovel")%>&pagina=Main_inicio.asp')"><img alt="Clique e Confira!" border=0 src="imagens/fotos/<%=destaque("arquivo")%>" width=100></a>
                            <table width="141" height=80 border="0" cellspacing="0" cellpadding="0" align=center>
                              <tr>
                                <td  bgcolor="#EFF0EF" height="1">&nbsp;</td>
                              </tr>
                              <tr>
                                <span class="estilo"><td  align=center bgcolor="#EFF0EF" height="1"><a href="javascript:popup('imobiliaria/asp/popup.asp?codigo=<%=destaque("codigo")%>&codigo2=<%=destaque("cod_imovel")%>&pagina=m3.asp?cod_pagina=<%=request("cod_pagina")%>')"><b>&nbsp;&nbsp;<%=destaque("descricao")%></b></a></td>
                              </tr>
                              <tr>
                               <span class="estilo"><td align=center  bgcolor="#EFF0EF" height="1">&nbsp;&nbsp;<a href="javascript:popup('imobiliaria/asp/popup.asp?codigo=<%=destaque("codigo")%>&codigo2=<%=destaque("cod_imovel")%>&pagina=m3.asp?cod_pagina=<%=request("cod_pagina")%>')"><%=destaque("foto")%></a></td>
                             </tr>
                             <tr>
                              <td  bgcolor="#EFF0EF" align=center ><a href="javascript:popup('imobiliaria/asp/popup.asp?codigo=<%=destaque("codigo")%>&codigo2=<%=destaque("cod_imovel")%>&m3.asp?cod_pagina=<%=request("cod_pagina")%>')"><img src="imagens/home/detalhes.gif" border="0"></a></td>
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
                   <%cont = 0%>
                  <%end if%>
                  <%destaque.movenext%>
                 <%loop%>
                 </tr>
              <%end if%>
</table>
<%
destaque.close
Set destaque = nothing
%>