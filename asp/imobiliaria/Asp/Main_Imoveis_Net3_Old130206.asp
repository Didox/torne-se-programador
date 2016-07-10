<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina     = request("pagina")
cod_imovel = request("cod_imovel")
codigo     = request("codigo")
if request("flag") = "1" then

   estagios_obra = request("estagios_obra_imovel")
   excluir = request("excluir")
   If request("reload") = "5" and excluir = "" then
     empreendimento = request("empreendimento")
     quantidade_empreendimento = request("quantidade_empreendimento")
     Set rs = conn.execute("Select * from Perfil_empreendimento where cod_imovel = "&cod_imovel&" and cod_empreendimento = "&empreendimento&"")
     If rs.eof then
       sqlins = "INSERT INTO Perfil_empreendimento (cod_imovel, cod_empreendimento, quantidade)"
       sqlins = sqlins & " VALUES ("&cod_imovel&", "&empreendimento&", '"&quantidade_empreendimento&"')"
       conn.execute(sqlins)
     Else
       %>
       <script>
       alert("Infraestrutura já cadastrada para esse imóvel");
       history.back();
       </script>
       <%
     End If
   Elseif request("reload") = "5" and excluir <> "" then
     conn.execute("Delete from perfil_empreendimento where codigo = "&excluir)
   Elseif request("reload") = "6" and excluir = "" then
     lazer = request("lazer")
     Set rs = conn.execute("Select * from Perfil_lazer where cod_imovel = "&cod_imovel&" and cod_lazer = "&lazer&"")
     If rs.eof then
       sqlins = "INSERT INTO Perfil_lazer (cod_imovel, cod_lazer)"
       sqlins = sqlins & " VALUES ("&cod_imovel&", "&lazer&")"
       conn.execute(sqlins)
     Else
       %>
       <script>
       alert("Lazer já cadastrado para esse imóvel");
       history.back();
       </script>
       <%
     End If
   Elseif request("reload") = "6" and excluir <> "" then
     conn.execute("Delete from perfil_lazer where codigo = "&excluir)
   Elseif request("reload") = "7" and excluir = "" then
     seguranca = request("seguranca")
     Set rs = conn.execute("Select * from Perfil_seguranca where cod_imovel = "&cod_imovel&" and cod_seguranca = "&seguranca&"")
     If rs.eof then
       sqlins = "INSERT INTO Perfil_Seguranca (cod_imovel, cod_seguranca)"
       sqlins = sqlins & " VALUES ("&cod_imovel&", "&seguranca&")"
       conn.execute(sqlins)
     Else
       %>
       <script>
       alert("Segurança já cadastrada para esse imóvel");
       history.back();
       </script>
       <%
     End If
   Elseif request("reload") = "7" and excluir <> "" then
     conn.execute("Delete from perfil_seguranca where codigo = "&excluir)
   Else

   estagios_obra_imovel       = request("estagios_obra_imovel")
   Set rs = conn.execute("Select * from Perfil_empreendimento where cod_imovel = "&cod_imovel)
   i = 0
   while not rs.eof
     If i = 0 then
       tipo_empreendimento_imovel = rs("cod_empreendimento")
     Else
       tipo_empreendimento_imovel = tipo_empreendimento_imovel & ", " & rs("cod_empreendimento")
     End if
   rs.MoveNext
   WEND
   Set rs = conn.execute("Select * from perfil_lazer where cod_imovel = "&cod_imovel)
   i = 0
   while not rs.eof
     If i = 0 then
       lazer_imovel = rs("cod_lazer")
     Else
       lazer_imovel = lazer_imovel & ", " & rs("cod_lazer")
     End if
   rs.MoveNext
   WEND
   Set rs = conn.execute("Select * from perfil_seguranca where cod_imovel = "&cod_imovel)
   i = 0
   while not rs.eof
     If i = 0 then
       seguranca_imovel = rs("cod_seguranca")
     Else
       seguranca_imovel = seguranca_imovel & ", " & rs("cod_seguranca")
     End if
   rs.MoveNext
   WEND
   metragem_imovel            = request("metragem_imovel")

   estagios_obra_condominio       = request("estagios_obra_condominio")
   tipo_empreendimento_condominio = request("tipo_empreendimento_condominio")
   Lazer_condominio               = request("Lazer_condominio")
   seguranca_condominio           = request("seguranca_condominio")
   metragem_condominio            = request("metragem_condominio")
   observacao                     = replace(ucase(request("observacao")),"'","")

   if msg="" then
      sqlins = "insert into Perfil_imoveis (estagios_obra_imovel, tipo_empreendimento_imovel, Lazer_imovel, seguranca_imovel, metragem_imovel, estagios_obra_condominio, tipo_empreendimento_condominio,Lazer_condominio, seguranca_condominio, data_inclusao,metragem_condominio, cod_imovel,observacao, status) values ('"&estagios_obra_imovel&"', '"&tipo_empreendimento_imovel&"', '"&Lazer_imovel&"', '"&seguranca_imovel&"', '"&metragem_imovel&"', '"&estagios_obra_condominio&"', '"&tipo_empreendimento_condominio&"','"&Lazer_condominio&"', '"&seguranca_condominio&"', convert(datetime,'"&date()&"',103),'"&metragem_condominio&"', "&cod_imovel&",'"&observacao&"',2)"
      'response.write sqlins
      'response.end
      conn.execute(sqlins)
      %>
        <script>
           alert('Perfil cadastrado com sucesso!');
           location.href="Main_Fotos.asp?codigo=<%=cod_imovel%><%if trim(request("str")) = trim("cad") then%>&str=cad<%end if%>";
        </script>
   <%end if
   End If
else
estado=0
cidade=0 
end if

Set rsI = conn.execute("Select * from registro_cliente_imovel where codigo = "&codigo&"")
If not rsI.eof then
  metragem_imovel = rsI("area")
End If
rsI.close
Set rsI = nothing
%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
<style type="text/css">
<!--
.style1 {color: #333333}
-->
</style>
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#F4F2EA" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td>
        <!--#INCLUDE FILE ="Main_Topo.asp"-->      
          <table width="99%"  border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td><table width=100% class="tabela001">
          <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&currentPage=<%=currentPage%>&cod_imovel=<%=cod_imovel%>&codigo=<%=codigo%><%if request("str") = "cad" then%>&str=cad<%end if%>" name="form1">
           <input type=hidden name="reload">
           <input type=hidden name="excluir">
            <tr><td></td></tr>
          </table></td>
		  </tr>
		  <tr>
          <td><table width=100% border=0 cellpadding="0" cellspacing="0" class="tabela002">
            <tr> 
              <td width=20><img src="../img/r_8.gif"></td>
              <td class="tb"><B>CADASTRAR IMÓVEL</B>&nbsp;</td>
            </tr>
          </table> </td>
		  </tr>
		  </table>
          <br><br><br>
		  <%If request("str") = "cad" then%>
         
          <%End If%> 
        <table width=97% border="0" align=center cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <span class="estilo"><b>Características do Imóvel</b>:
          </td>
        </tr>
        <tr>
          <td>
            <table border=0 cellspacing="0" cellpadding="0">
           <tr>
              <td>&nbsp;<span class="estilo">&nbsp;Estágio da Obra:              </td>
              <td>&nbsp;<span class="estilo">&nbsp;Área Útil (m²):              </td>
           </tr>
           <tr>
            <td>
             <select name="estagios_obra_imovel" style="width:140;">
              <option value = ""></option>
              <%set cbai=conn.execute("select * from estagios_obra where status=0 ORDER BY descricao")%>
              <%do while not cbai.eof %>
                <%if cstr(cbai("codigo"))=cstr(estagios_obra) then%>
                  <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                <%else%>
                  <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                <%end if%>
                <%cbai.movenext%>
               <%loop%>
             </select>
            </td>
            <td>
             <input type="text" name="metragem_imovel" size="5" maxlength="5" value="<%=metragem_imovel%>" checked> <i>m²</i>
            </td>
          </tr>
        </table>
          </td>
        </tr>
        <tr>
          <td>
            &nbsp;<span class="estilo"><b>Infraestrutura:</b>
          </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>                  Descrição:
                </td>
                <td>&nbsp;<span class="estilo">Quantidade:                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <select name="empreendimento" style="width:140;">
                    <option value = ""></option>
                    <%set cbai=conn.execute("select * from Tipo_empreendimento where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=empreendimento then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                <td>
                  <input type="text" name="quantidade_empreendimento" value=""  maxlength=3 label="quantidade" style="width:60; height:17; text-align: RIGHT;" maxlength="18" onkeypress="Numero();" onkeyup="Moeda(this);"> 
                </td>
                <td align=center>
                  <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onClick="document.form1.reload.value='5'">
                </td>
              </tr>
            </table>
            <table width=60% cellspacing=0 cellpadding=0 border=0 bordercolor="#F8F8F8">
              <tr>
                <td width=90% height="19" class="tabela002">
                  <span class="estilo style1">Descrição</span>                </td>
                <td width="7%" align=center class="tabela002">
                  <span class="estilo style1">Quantidade</span>                </td>
                <td width="3%" align=center class="tabela002">
                  <span class="estilo style1">Ações</span>                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_empreendimento where cod_imovel="&cod_imovel&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                  <%set empreendimento_nome=conn.execute("select * from tipo_empreendimento where codigo="&cbai("cod_empreendimento"))%>
                  <%=empreendimento_nome("descricao")%>
                <td align=center>
                  <%=cbai("quantidade")%>                </td>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='5';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            &nbsp;<span class="estilo"><b>Lazer:</b>
          </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>                  &nbsp;Descrição:
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <select name="lazer" style="width:140;">
                    <option value = ""></option>
                    <%set cbai=conn.execute("select * from lazer where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=lazer then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                <td align=center>
                  <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onClick="document.form1.reload.value='6'">
                </td>
              </tr>
            </table>
            <table width=60% cellspacing=0 cellpadding=0 border=0 bordercolor="#F8F8F8">
              <tr>
                <td width=100% height="19" class="tabela002">
                  <span class="estilo style1">Descrição</span>                </td>
                <td align=center class="tabela002">
                  <span class="estilo style1">Ações</span>                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_lazer where cod_imovel="&cod_imovel&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                  <%set lazer_nome=conn.execute("select * from lazer where codigo="&cbai("cod_lazer"))%>
                  <%=lazer_nome("descricao")%>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='6';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            &nbsp;<span class="estilo"><b>Segurança:</b>
          </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>                  Descrição:
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <select name="seguranca" style="width:140;">
                    <option value = ""></option>
                    <%set cbai=conn.execute("select * from seguranca where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=seguranca then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                <td align=center>
                  <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onClick="document.form1.reload.value='7'">
                </td>
              </tr>
            </table>
            <table width=60% cellspacing=0 cellpadding=0 border=0 bordercolor="0">
              <tr>
                <td width=100% height="19" class="tabela002">
                  <span class="estilo style1">Descrição</span>                </td>
                <td align=center bgcolor=#AAAAAA class="tabela002">
                  <span class="estilo style1">Ações</span>                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_seguranca where cod_imovel="&cod_imovel&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                  <%set seguranca_nome=conn.execute("select * from seguranca where codigo="&cbai("cod_seguranca"))%>
                  <%=seguranca_nome("descricao")%>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='7';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
            </table>
          </td>
        </tr>
        <tr>
          <td>
             <span class="estilo">Observação*:</span>
          </td>
        </tr>
        <tr>
          <td>
             <textarea rows="5" name="observacao" maxlength=200 cols="37" ><%=observacao%></textarea>
             <i>* até 2000 caracteres</i>
          </td>
        </tr>
        <tr>
          <td>
           <table border=0>
           <tr>
            <td>
             <table cellspacing=0 cellpadding=0 borer=1>
        <tr>
           <td align=center colspan=5>
             <br><input type="image" value="submit" src="../../imagens/botoes/GRAVAR1.gif" width="86" height="26" border=0>
            </td>
        </tr>
    </table>
    </td>
   </tr>
    </table>
    </td>
   </tr>
    
    </td>
  </tr>
</table>
</form>
</body>
</html>

