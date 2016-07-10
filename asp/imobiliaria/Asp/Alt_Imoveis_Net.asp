<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%login=session("login")
senha=session("senha")
pagina=request("pagina")
codigo=request("codigo")
pagina=request("pagina")
servico=request("servico")
reload=request("reload")
excluir=request("excluir")
comodo=request("comodo")
quantidade=request("quantidade")
quantidade_plano=replace(request("quantidade_plano"),",","")
servico=request("servico")
valor=request("valor")
valor_plano=request("valor_plano")
tipo_plano=request("tipo_plano")
estagios_obra=trim(ucase(request("estagios_obra")))
valor_despesa=request("valor_despesa")
despesa=request("despesa")
empreendimento=request("empreendimento")
quantidade_empreendimento =request("quantidade_empeendimento")
estagios_obra=trim(ucase(request("estagios_obra")))

if request("flag") <> "1" then
   set imoveis=conn.execute("select * from imoveis where codigo="&codigo)
   logradouro   =replace(trim(ucase(imoveis("endereco"))),"'","")
   numero       =replace(trim(ucase(imoveis("numero"))),"'","")
   complemento  =replace(trim(ucase(imoveis("complemento"))),"'","")
   tipo_imovel  =replace(trim(ucase(imoveis("tipo_imovel"))),"'","")
   estagios_obra=replace(trim(ucase(imoveis("cod_estagios_obra"))),"'","")
   metragem     =replace(trim(ucase(imoveis("cod_metragem"))),"'","")
   cidade   =replace(trim(ucase(imoveis("cod_cidade"))),"'","")
   bairro   =replace(trim(ucase(imoveis("cod_bairro"))),"'","")
   estado   =replace(trim(ucase(imoveis("cod_estado"))),"'","")
   idade=trim(imoveis("idade"))
   dormitorio=trim(imoveis("dormitorio"))
   suites=trim(imoveis("suites"))
   observacao=imoveis("observacao")
   garagem=imoveis("garagem")
   valor_imovel=replace(replace(imoveis("valor_imovel"),".",""),",",".")
else
   logradouro   =replace(trim(ucase(request("logradouro"))),"'","")
   numero       =replace(trim(ucase(request("numero"))),"'","")
   complemento  =replace(trim(ucase(request("complemento"))),"'","")
   tipo_imovel  =replace(trim(ucase(request("tipo_imovel"))),"'","")
   estagios_obra=replace(trim(ucase(request("estagios_obra"))),"'","")
   metragem     =replace(trim(ucase(request("metragem"))),"'","")
   cidade   =replace(trim(ucase(request("cidade"))),"'","")
   bairro   =replace(trim(ucase(request("bairro"))),"'","")
   estado   =replace(trim(ucase(request("estado"))),"'","")
   lazer=request("lazer")
   seguranca=request("seguranca")
   idade=trim(request("idade"))
   dormitorio=trim(request("dormitorio"))
   suites=trim(request("suites"))
   observacao=request("observacao")
   garagem=request("garagem")
   valor_imovel=request("valor_imovel")

if reload="1" and excluir="" then
   conn.execute("delete perfil_lazer where cod_lazer="&lazer&" and cod_imovel="&codigo)
   conn.execute("insert into perfil_lazer (cod_imovel, cod_lazer) values ("&codigo&", "&lazer&")")
end if
if reload="2" and excluir="" and isnumeric(valor) then
   conn.execute("delete perfil_seguranca where cod_seguranca="&seguranca&" and cod_imovel="&codigo)
   conn.execute("insert into perfil_seguranca (cod_imovel, cod_seguranca) values ("&codigo&", "&seguranca&")")
end if
if reload="4" and excluir="" and isnumeric(quantidade_plano) and isnumeric(valor_plano) then
   conn.execute("delete perfil_plano where cod_tipo_conta="&tipo_plano&" and cod_imovel="&codigo)
   conn.execute("insert into perfil_plano (cod_imovel, cod_tipo_conta, valor, quantidade) values ("&codigo&", "&tipo_plano&", "&replace(replace(valor_plano,".",""),",",".")&","&quantidade_plano&")")
end if

if reload="5" and excluir="" and isnumeric(valor_despesa) then
   conn.execute("delete gasto_extra where cod_imovel="&codigo&" and cod_despesa="&despesa)
   conn.execute("insert into gasto_extra (cod_despesa, cod_imovel, valor) values ("&despesa&", "&codigo&", "&replace(replace(csng(valor_despesa),".",""),",",".")&")")
end if

if reload="6" and excluir="" then
   conn.execute("delete perfil_empreendimento where cod_empreendimento="&empreendimento&" and cod_imovel="&codigo)
   conn.execute("insert into perfil_empreendimento (cod_imovel, cod_empreendimento) values ("&codigo&", "&empreendimento&")")
end if

if excluir<>"" and reload="1" then
   conn.execute("delete perfil_lazer where codigo="&excluir)
end if
if excluir<>"" and reload="2" then
   conn.execute("delete perfil_seguranca where codigo="&excluir)
end if
if excluir<>"" and reload="4" then
   conn.execute("delete perfil_plano where codigo="&excluir)
end if

if excluir<>"" and reload="5" then
   conn.execute("delete gasto_extra where codigo="&excluir)
end if

if excluir<>"" and reload="6" then
   conn.execute("delete perfil_empreendimento where codigo="&excluir)
end if

   if logradouro="" then
      msg=msg& "&nbsp; Logradouro.<br>"
   end if
   if numero="" then
      msg=msg& "&nbsp; Número.<br>"
   end if
   if estado="0" or estado = "" then
     msg=msg& "&nbsp; Estado.<br>"
   end if
   if cidade="0" or cidade="" then
     msg=msg& "&nbsp; Cidade.<br>"
   end if
   if Bairro="0" or bairro = "" then
     msg=msg& "&nbsp; Bairro.<br>"
   end if
   if tipo_imovel="" then
      msg=msg& "&nbsp; Tipo de Imóvel.<br>"
   end if
   if valor_imovel="" then
      msg=msg& "&nbsp; Valor R$.<br>"
   end if   
   if dormitorio="" then
      msg=msg& "&nbsp; Dormitório.<br>"
   end if
   if Suites="" then
      msg=msg& "&nbsp; Suites.<br>"
   end if   
   if Idade="" then
      msg=msg& "&nbsp; Idade Imóvel.<br>"
   end if
   if garagem="" then
      msg=msg& "&nbsp; Vagas Garagem.<br>"
   end if
   if estagios_obra="" then
      msg=msg& "&nbsp; Diferêncial.<br>"
   end if   

   if metragem="" or metragem="0" then
      msg=msg& "&nbsp; Tamanho Conjunto.<br>"
   end if   

   if msg="" and reload="" then
      if filename<>"" then
         Set MyFile = ScriptObject.CreateTextFile(server.mappath("../fotos/"&filename))
         For i = 1 to LenB(value)
             MyFile.Write chr(AscB(MidB(value,i,1)))
         Next
         MyFile.Close
      end if
      conn.execute("update imoveis set endereco='"&logradouro&"',numero='"&numero&"',complemento='"&complemento&"',tipo_imovel='"&tipo_imovel&"',cod_estagios_obra="&estagios_obra&",cod_metragem="&metragem&",cod_cidade="&cidade&",cod_bairro="&bairro&",cod_estado="&estado&",idade='"&idade&"',garagem="&garagem&",dormitorio='"&dormitorio&"',suites='"&suites&"',observacao='"&observacao&"',valor_imovel='"&replace(replace(request("valor_imovel"),".",""),",",".")&"' where codigo="&codigo)
      %>
        <script>
           alert('Alteração Efetuada com sucesso!');
           location.href="Imoveis.asp?codigo=<%=codigo%>";
        </script>
   <%end if
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
          <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&currentPage=<%=currentPage%>&codigo=<%=codigo%>" name="form1">
           <input type=hidden name="reload">
           <input type=hidden name="excluir">
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_8.gif"></td>
              <td class="tb"><B>ALTERAR IMÓVEL</B></td>
            </tr>
          </table>  
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
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Logradouro:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="logradouro" value="<%=logradouro%>" maxlength=50 label="logradouro" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Número:&nbsp;&nbsp;
            <span class="estilo">Complemento:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="numero" value="<%=numero%>"  maxlength=14 label="cpf" style="width:60; height:17; background=#E8E8E8;">
            <input type="text" name="complemento" value="<%=complemento%>" maxlength=15 label="Identidade" style="width:145; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td width=140>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Estado:
                </td>
                <td width=140>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Cidade:
                </td>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Bairro:
                </td>
              </tr>
              </tr>
            </table>
          </td>
         </tr><tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <select name="estado" style="width:140;background=#E8E8E8;" onchange="document.form1.reload.value='3';document.form1.cidade.value='0';document.form1.submit()" >
                    <option value = "0"></option>
                    <%set cbai=conn.execute("select * from estado where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))= estado then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                </td>
                <td>
                  <select name="cidade" style="width:140;background=#E8E8E8;" onchange="document.form1.reload.value='3';document.form1.bairro.value='';document.form1.submit()">
                    <option value = "0"></option>
                    <%set cbai=conn.execute("select * from cidade where status=0 and cod_estado="&estado&" ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=cidade then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                </td>
                <td>
                  <select name="bairro" style="width:140;background=#E8E8E8;">
                    <option value = "0"></option>
                    <%set cbai=conn.execute("select * from bairro where status=0 and cod_cidade="&cidade&" ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=bairro then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                </td>
              </tr>
            </table>
          </td>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
         <tr>
           <td>
             <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Tipo de Imovel:
          </td>
         </tr>
         <tr>
          <td>
             <%set cbai=conn.execute("select * from tipo_imovel where status=0 ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <%if instr(", "&tipo_imovel&"," , ", "&cbai("codigo")&",") > 0 then%>
                   <input type="checkbox" name="tipo_imovel" value="<%=cbai("codigo")%>" checked><span class="estilo"><%=cbai("descricao")%>
                <%else%>
                   <input type="checkbox" name="tipo_imovel" value="<%=cbai("codigo")%>"><span class="estilo"><%=cbai("descricao")%>
                <%end if%>
             <%cbai.movenext%>
             <%loop%>
          </td>
         </tr>
      <tr>
       <td>
        <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Valor R$:
       </td>
      </tr>
      <tr>
        <td>
        <input type="text" name="valor_imovel" value="<%=valor_imovel%>" label="valor" style="width:100; height:17;background:#E8E8E8;text-align: RIGHT;" maxlength="18" onkeypress="Numero();" onkeyup="Moeda(this);">&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
      </tr>
      <tr>
       <td>
        <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Núm de Domitórios:
       </td>
       <td>
        <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Sendo Suites:
       </td>
      </tr>
      <tr>
        <td>
          <input type="text" name="dormitorio" value="<%=dormitorio%>" label="dormitorio" style="width:60; height:17;background:#E8E8E8;text-align: RIGHT;" maxlength="2" onkeypress="Numero();">&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        <td>
        <input type="text" name="suites" value="<%=suites%>" label="suites" style="width:60; height:17;background:#E8E8E8;text-align: RIGHT;" maxlength="2" onkeypress="Numero();">&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
      </tr>
      <tr>
       <td>
        <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Idade do Imóvel:
       </td>
      </tr>
      <tr>
        <td>
          <input type="text" name="idade" value="<%=idade%>" maxlength=3 label="dormitorio" style="width:60; height:17;background:#E8E8E8;text-align: RIGHT;" maxlength="3" onkeypress="Numero();">&nbsp;Ano(s)
        </td>
      </tr>
      <tr>
       <td>
        <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Vagas de Garagem:
       </td>
      </tr>
      <tr>
        <td>
          <input type="text" name="garagem" value="<%=garagem%>" maxlength=2 label="Garagem" style="width:60; height:17;background:#E8E8E8;text-align: RIGHT;" maxlength="18" onkeypress="Numero();">
        </td>
      </tr>
        </table>
        </td>
      </tr>
      <tr><td><span class="estilo">&nbsp;<b>CARACTERÍSTICAS DO IMÓVEL<b></td></tr>
      <tr>
        <td>
          <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Diferêncial:
        </td>
      </tr>
      <tr>
        <td>
          <select name="estagios_obra" style="width:140;background=#E8E8E8;">
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
      </tr>
      <tr>
        <td>
          <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Infraestrutura:
        </td>
      </tr>
      <tr>
        <td>
          <select name="empreendimento" style="width:140;background=#E8E8E8;">
            <option value = ""></option>
              <%set cbai=conn.execute("select * from tipo_empreendimento where status=0 ORDER BY descricao")%>
              <%do while not cbai.eof %>
                <%if cstr(cbai("codigo"))=cstr(empreendimento) then%>
                  <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                <%else%>
                  <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                <%end if%>
                <%cbai.movenext%>
               <%loop%>
          </select>
          <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onclick="document.form1.reload.value='6'">
        </td>
      </tr>
      <tr>
        <td>
          <table width=40% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
            <tr>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Descrição</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center width=50>
                  <span class="estilo"><font color="#FFFFFF">Ações</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_empreendimento where cod_imovel="&codigo&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                  <%set empreendimento_nome=conn.execute("select * from tipo_empreendimento where codigo="&cbai("cod_empreendimento"))%>
                  <%=empreendimento_nome("descricao")%>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='6';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
           </table>
         </td>
      </tr>
      <tr>
        <td>
          <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Lazer:
        </td>
      </tr>
      <tr>
        <td>
          <select name="lazer" style="width:140;background=#E8E8E8;">
            <option value = ""></option>
              <%set cbai=conn.execute("select * from lazer where status=0 ORDER BY descricao")%>
              <%do while not cbai.eof %>
                <%if cstr(cbai("codigo"))=cstr(lazer) then%>
                  <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                <%else%>
                  <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                <%end if%>
                <%cbai.movenext%>
               <%loop%>
          </select> 
          <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onclick="document.form1.reload.value='1'">
        </td>
      </tr>
      <tr>
      <tr>
        <td>
          <table width=40% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
            <tr>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Descrição</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center width=50>
                  <span class="estilo"><font color="#FFFFFF">Ações</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_lazer where cod_imovel="&codigo&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                  <%set lazer_nome=conn.execute("select * from lazer where codigo="&cbai("cod_lazer"))%>
                  <%=lazer_nome("descricao")%>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='1';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
            </table>
          </td>
        </tr>
      <tr>
        <td>
          <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Segurança:
        </td>
      </tr>
      <tr>
        <td>
          <select name="seguranca" style="width:140;background=#E8E8E8;">
            <option value = ""></option>
              <%set cbai=conn.execute("select * from seguranca where status=0 ORDER BY descricao")%>
              <%do while not cbai.eof %>
                <%if cstr(cbai("codigo"))=cstr(seguranca) then%>
                  <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                <%else%>
                  <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                <%end if%>
                <%cbai.movenext%>
               <%loop%>
          </select> 
          <input type="image" src="../img/add_wico.gif" value="enviar" border=0 onclick="document.form1.reload.value='2'">
        </td>
      </tr>
      <tr>
      <tr>
        <td>
          <table width=40% cellspacing=0 cellpadding=0 border=1 bordercolor="#F8F8F8">
            <tr>
                <td bgcolor=#AAAAAA align=center>
                  <span class="estilo"><font color="#FFFFFF">Descrição</font></span>
                </td>
                <td bgcolor=#AAAAAA align=center width=50>
                  <span class="estilo"><font color="#FFFFFF">Ações</font></span>
                </td>
              </tr>
              <%set cbai=conn.execute("select * from perfil_seguranca where cod_imovel="&codigo&" and status=0 ORDER BY codigo desc")%>
              <%do while not cbai.eof %>
              <tr>
                <td>
                  <%set seguranca_nome=conn.execute("select * from seguranca where codigo="&cbai("cod_seguranca"))%>
                  <%=seguranca_nome("descricao")%>
                <td align=center>
                  <a href="javascript:document.form1.reload.value='2';document.form1.excluir.value='<%=cbai("codigo")%>';document.form1.submit()">excluir</a>
                </td>
              </tr>
              <%cbai.movenext%>
              <%loop%>
            </table>
          </td>
        </tr>
      <tr>
        <td>
          <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Tamanho do Conjunto:
        </td>
      </tr>
      <tr>
        <td>
          <select name="metragem" style="width:140;background=#E8E8E8;">
           <option value = ""></option>
             <%set metragens=conn.execute("select * from metragem where status=0 ORDER BY descricao")%>
             <%if metragem="" or metragem="0" then%>
               <%metragem=metragens("codigo")%>
             <%end if%>
             <%do while not metragens.eof %>
                <%if cstr(metragens("codigo"))=metragem then%>
                 <option value="<%=metragens("codigo")%>" selected><%=metragens("descricao")%>
                <%else%>
                  <option value="<%=metragens("codigo")%>"><%=metragens("descricao")%>
                <%end if%>
                <%metragens.movenext%>
              <%loop%>
          </select>
        </td>
      </tr>
      <tr>
        <td>
           <span class="estilo">Observação</span>
        </td>
      </tr>
      <tr>
        <td>
           <textarea rows="5" name="observacao" cols="37" style="background-color: #C0C0C0"><%=observacao%></textarea>
        </td>
      </tr>
      <tr>
        <td>
         <table border=0>
          <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
        <tr>
           <td align=center>
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

