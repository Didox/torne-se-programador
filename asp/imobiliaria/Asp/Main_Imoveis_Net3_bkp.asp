<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina     = request("pagina")
cod_imovel = request("cod_imovel")
codigo     = request("codigo")
if request("flag") = "1" then

   estagios_obra_imovel       = request("estagios_obra_imovel")
   tipo_empreendimento_imovel = request("tipo_empreendimento_imovel")
   Lazer_imovel               = request("Lazer_imovel")
   seguranca_imovel           = request("seguranca_imovel")
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
           location.href="Main_Fotos.asp?codigo=<%=cod_imovel%><%if request("str") = "cad" then%>&str=cad<%end if%>";
        </script>
   <%end if
else
estado=0
cidade=0 
end if%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
        <!--#INCLUDE FILE ="Main_Topo.asp"-->      
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
          <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&currentPage=<%=currentPage%>&cod_imovel=<%=cod_imovel%>&codigo=<%=codigo%><%if request("str") = "cad" then%>&str=cad<%end if%>" name="form1">
           <input type=hidden name="reload">
           <input type=hidden name="excluir">
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_8.gif"></td>
              <td class="tb"><B>CADASTRAR IMÓVEL</B>&nbsp;<img src="../img/b3.gif"></td>
            </tr>
          </table> 
          <%If request("str") = "cad" then%>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr> 
              <td class="tb"><b>Passo 4 de 6</b></b>
            </tr>
          </table> 
          <%End If%> 
        <table border="0" width=100% align=LEFT>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <span class="estilo"><b>Características do Condomínio</b>:
          </td>
        </tr>
        <tr>
          <td>
            &nbsp;<span class="estilo"><b>Diferêncial:</b>
          </td>
        </tr>
        <tr>
          <td>
            <table width=100% border=0 cellspacing="0" cellpadding="0">
              <tr>
             <%set cbai=conn.execute("select * from estagios_obra where status=0 ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <td>
               <%if instr(", "&estagios_obra_imovel&"," , ", "&cbai("codigo")&",") > 0 then%>
                   <input type="checkbox" name="estagios_obra_imovel" value="<%=cbai("codigo")%>" checked><span class="estilo"><%=cbai("descricao")%>
                <%else%>
                   <input type="checkbox" name="estagios_obra_imovel" value="<%=cbai("codigo")%>"><span class="estilo"><%=cbai("descricao")%>
                <%end if%>
               <%if cont=2 then%>
                  </tr><tr>
                  <%cont=0%>
               <%end if%>
               </td>
             <%cbai.movenext%>
             <%loop%>
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
            <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
             <%set cbai=conn.execute("select * from tipo_empreendimento where status=0 ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <td>
               <%if instr(", "&tipo_empreendimento_imovel&"," , ", "&cbai("codigo")&",") > 0 then%>
                   <input type="checkbox" name="tipo_empreendimento_imovel" value="<%=cbai("codigo")%>" checked><span class="estilo"><%=cbai("descricao")%>
                <%else%>
                   <input type="checkbox" name="tipo_empreendimento_imovel" value="<%=cbai("codigo")%>"><span class="estilo"><%=cbai("descricao")%>
                <%end if%>
               </td>
               <%if cont=2 then%>
                  </tr><tr>
                  <%cont=0%>
               <%end if%>
               <%cont = cont+1%>
             <%cbai.movenext%>
             <%loop%>
             </tr>
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
            <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
             <%set cbai=conn.execute("select * from Lazer where status=0 ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <td>
               <%if instr(", "&Lazer_imovel&"," , ", "&cbai("codigo")&",") > 0 then%>
                   <input type="checkbox" name="Lazer_imovel" value="<%=cbai("codigo")%>" checked><span class="estilo"><%=cbai("descricao")%>
                <%else%>
                   <input type="checkbox" name="Lazer_imovel" value="<%=cbai("codigo")%>"><span class="estilo"><%=cbai("descricao")%>
                <%end if%>
               </td>
               <%if cont=2 then%>
                  </tr><tr>
                  <%cont=0%>
               <%end if%>
               <%cont = cont+1%>
             <%cbai.movenext%>
             <%loop%>
             </tr>
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
            <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
             <%set cbai=conn.execute("select * from seguranca where status=0 ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <td>
               <%if instr(", "&seguranca_imovel&"," , ", "&cbai("codigo")&",") > 0 then%>
                   <input type="checkbox" name="seguranca_imovel" value="<%=cbai("codigo")%>" checked><span class="estilo"><%=cbai("descricao")%>
                <%else%>
                   <input type="checkbox" name="seguranca_imovel" value="<%=cbai("codigo")%>"><span class="estilo"><%=cbai("descricao")%>
                <%end if%>
               </td>
               <%if cont=2 then%>
                  </tr><tr>
                  <%cont=0%>
               <%end if%>
               <%cont = cont+1%>
             <%cbai.movenext%>
             <%loop%>
             </tr>
             </table>
           </td>
        </tr>
        <tr>
          <td>
            &nbsp;<span class="estilo"><b>Tamanho do Conjunto:</b>
          </td>
        </tr>
        <tr>
          <td>
            <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td>
                <input type="text" name="metragem_imovel" size="5" maxlength="5" value="<%=metragem_imovel%>" checked> <i>m²</i>
              </td>
            </tr>
             </table>
           </td>
        </tr>
        <tr>
          <td>
            <span class="estilo"><b>Características do Imóvel (Unidade)</b>:
          </td>
        </tr>
        <tr>
          <td>
            &nbsp;<span class="estilo"><b>Diferêncial:</b>
          </td>
        </tr>
        <tr>
          <td>
            <table width=100% border=0 cellspacing="0" cellpadding="0">
              <tr>
             <%set cbai=conn.execute("select * from estagios_obra where status=0 ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <td>
               <%if instr(", "&estagios_obra_condominio&"," , ", "&cbai("codigo")&",") > 0 then%>
                   <input type="checkbox" name="estagios_obra_condominio" value="<%=cbai("codigo")%>" checked><span class="estilo"><%=cbai("descricao")%>
                <%else%>
                   <input type="checkbox" name="estagios_obra_condominio" value="<%=cbai("codigo")%>"><span class="estilo"><%=cbai("descricao")%>
                <%end if%>
               <%if cont=2 then%>
                  </tr><tr>
                  <%cont=0%>
               <%end if%>
               </td>
             <%cbai.movenext%>
             <%loop%>
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
            <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
             <%set cbai=conn.execute("select * from tipo_empreendimento where status=0 ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <td>
               <%if instr(", "&tipo_empreendimento_condominio&"," , ", "&cbai("codigo")&",") > 0 then%>
                   <input type="checkbox" name="tipo_empreendimento_condominio" value="<%=cbai("codigo")%>" checked><span class="estilo"><%=cbai("descricao")%>
                <%else%>
                   <input type="checkbox" name="tipo_empreendimento_condominio" value="<%=cbai("codigo")%>"><span class="estilo"><%=cbai("descricao")%>
                <%end if%>
               </td>
               <%if cont=2 then%>
                  </tr><tr>
                  <%cont=0%>
               <%end if%>
               <%cont = cont+1%>
             <%cbai.movenext%>
             <%loop%>
             </tr>
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
            <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
             <%set cbai=conn.execute("select * from Lazer where status=0 ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <td>
               <%if instr(", "&Lazer_condominio&"," , ", "&cbai("codigo")&",") > 0 then%>
                   <input type="checkbox" name="Lazer_condominio" value="<%=cbai("codigo")%>" checked><span class="estilo"><%=cbai("descricao")%>
                <%else%>
                   <input type="checkbox" name="Lazer_condominio" value="<%=cbai("codigo")%>"><span class="estilo"><%=cbai("descricao")%>
                <%end if%>
               </td>
               <%if cont=2 then%>
                  </tr><tr>
                  <%cont=0%>
               <%end if%>
               <%cont = cont+1%>
             <%cbai.movenext%>
             <%loop%>
             </tr>
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
            <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
             <%set cbai=conn.execute("select * from seguranca where status=0 ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <td>
               <%if instr(", "&seguranca_condominio&"," , ", "&cbai("codigo")&",") > 0 then%>
                   <input type="checkbox" name="seguranca_condominio" value="<%=cbai("codigo")%>" checked><span class="estilo"><%=cbai("descricao")%>
                <%else%>
                   <input type="checkbox" name="seguranca_condominio" value="<%=cbai("codigo")%>"><span class="estilo"><%=cbai("descricao")%>
                <%end if%>
               </td>
               <%if cont=2 then%>
                  </tr><tr>
                  <%cont=0%>
               <%end if%>
               <%cont = cont+1%>
             <%cbai.movenext%>
             <%loop%>
             </tr>
             </table>
           </td>
        </tr>
        <tr>
          <td>
            &nbsp;<span class="estilo"><b>Tamanho do Conjunto:</b>
          </td>
        </tr>
        <tr>
          <td>
            <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td>
                <input type="text" name="metragem_condominio" size="5" maxlength="5" value="<%=metragem_condominio%>" checked> <i>m²</i>
              </td>
            </tr>
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
           <textarea rows="5" name="observacao" maxlength=200 cols="37" style="background-color: #C0C0C0"><%=observacao%></textarea>
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
             <br><input type="image" src="../img/ok.gif" value="submit" border=0>
            </td>
        </tr>
    </table>
    </td>
   </tr>
    </table>
    </td>
   </tr>
    <tr><td colspan=2><table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table></td></tr>      
    </td>
  </tr>
</table>
</form>
</body>
</html>

