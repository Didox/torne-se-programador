<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina =request("pagina")
cliente=request("cliente")
estado =request("estado")
cidade =request("cidade")
cont   =replace(trim(ucase(request("cont"))),"'","")
reload=request("reload")
if estado="" then
   estado=0
end if

if request("flag") <> "1" then
   set clientes = conn.execute("select * from clientes where codigo="&cliente)
   nome    =replace(trim(ucase(clientes("nome"))),"'","")
   email   =replace(trim(ucase(clientes("email"))),"'","")
   ddd     =replace(trim(ucase(clientes("ddd_fone"))),"'","")
   fone    =replace(trim(ucase(clientes("fone"))),"'","")
   If clientes("identidade") <> "" then
     identidade=replace(trim(ucase(clientes("identidade"))),"'","")
   Else
     identidade=""
   End If
   cpf     =replace(trim(ucase(clientes("cpf"))),"'","")
else

   nome    =replace(trim(ucase(request("nome"))),"'","")
   email   =replace(trim(ucase(request("email"))),"'","")
   email2  =replace(trim(ucase(request("email2"))),"'","")
   ddd     =replace(trim(ucase(request("ddd"))),"'","")
   fone    =replace(trim(ucase(request("fone"))),"'","")
   identidade=replace(trim(ucase(request("identidade"))),"'","")
   cpf     =replace(trim(ucase(request("cpf"))),"'","")
   cep     =replace(trim(ucase(request("cep"))),"'","")
   transacao=replace(trim(ucase(request("transacao"))),"'","")
   tipo_imovel    =request("tipo_imovel")
   subtipo_imovel    =request("subtipo_imovel")
   categoria    =request("categoria")
   area    =replace(trim(ucase(request("area"))),"'","")
   estado    =request("estado")
   cidade    =request("cidade")


   if cont="" then
      cont=0
   end if
   
   if nome="" then
      msg=msg& "&nbsp; Nome.<br>"
   end if
   if not IsValidEmail(Email) then
      msg=msg& "&nbsp; Email.<br>"
   end if
   if email2 = "" then
      msg=msg& "&nbsp; Confirmar Email.<br>"
   end if
   if not IsValidEmail(Email) <> not IsValidEmail(Email2) then
      msg=msg& "&nbsp; Confirmar Email.<br>"
   end if
   if ddd="" then
     msg=msg& "&nbsp; DDD.<br>"
   end if
   if fone="" then
      msg=msg& "&nbsp; Fone.<br>"
   end if
   'if identidade="" then
   '   msg=msg& "&nbsp; Identidade.<br>"
   'end if   
   if cpf<>"" then
      cpf=replace(cpf,".","")
      cpf=replace(cpf,"-","")
      if not CalculaCPF(cpf) then
         msg=msg&" CPF Inválido<br>"
      end if
    end if
   if cep="" then
      msg=msg& "&nbsp; CEP do Imóvel.<br>"
   end if   
   if transacao="" then
      msg=msg& "&nbsp; Transação.<br>"
   end if
   if tipo_imovel="" then
      msg=msg& "&nbsp; Tipo.<br>"
   end if
   if estado="" or estado="0" then
      msg=msg& "&nbsp; Estado.<br>"
   end if
   if cidade="" or cidade = "0" then
      msg=msg& "&nbsp; Cidade.<br>"
   end if
   if area="" then
      msg=msg& "&nbsp; Área Útil.<br>"
   end if

   if msg="" then
      sqlins = "insert into registro_cliente_imovel (nome, email, ddd, fone, identidade, cpf, cep_imovel,transacao, tipo, subtipo, estado, cidade, area,contato, data_inclusao) values ('"&nome&"', '"&email&"', '"&ddd&"', '"&fone&"', '"&identidade&"', '"&cpf&"', '"&cep&"',"&transacao&", "&tipo_imovel&", '"&subtipo_imovel&"', "&estado&", "&cidade&", "&area&", "&cont&", convert(datetime,'"&date()&"',103))"
      'response.write sqlins
      'response.end
      conn.execute(sqlins)
      set cod_registro=conn.execute("select * from registro_cliente_imovel where nome='"&nome&"' and  email='"&email&"' and  ddd='"&ddd&"' and  fone='"&fone&"' and  identidade='"&identidade&"' and  cpf='"&cpf&"' and  cep_imovel='"&cep&"' and transacao="&transacao&" and  tipo="&tipo_imovel&" and cidade="&cidade&" and estado="&estado&" and area="&area&" and contato="&cont)%>
        <script>
           alert('Cadastrado efetuado com sucesso!');
           location.href="Main_Imoveis_Net2.asp?codigo=<%=cod_registro("codigo")%>&cod_estado=<%=estado%>&cod_cidade=<%=cidade%>&cep_imovel=<%=cep%>&cod_cliente=<%=cliente%>&tipo_imovel=<%=tipo_imovel%>&subtipo_imovel=<%=subtipo_imovel%>&categoria=<%=categoria%><%if request("str") = "cad" then%>&str=cad<%end if%>";
        </script>  
   <%end if%>
<%end if%>
<html>
<head> 
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#F4F2EA" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td>
        <!--#INCLUDE FILE ="Main_Topo.asp"-->      
          <table width="99%"  border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td><table width=99% align="center" class="tabela001">
                <form method="post" action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&currentPage=<%=currentPage%>&cliente=<%=cliente%><%if request("str") = "cad" then%>&str=cad<%end if%>" name="formins">
                  <input type=hidden name="reload">
                  <tr>
                    <td></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width=99% border=0 align="center" cellpadding="0" cellspacing="0" class="tabela002">
                <tr>
                  <td width=20><img src="../img/r_8.gif"></td>
                  <td class="tb"><B>CADASTRAR IM&Oacute;VEL</B>&nbsp;</td>
                </tr>
              </table></td>
            </tr>
          </table>          
          <br>
          <br>
          <br>
          <%If request("str") = "cad" then%>
          <%End If%>
        <table border="0" width=100% align=LEFT border=0 cellpadding="4">
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Nome:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="Nome" value="<%=Nome%>" maxlength=50 label="Nome" style="width:290; height:17; ">
          </td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Email:&nbsp;&nbsp;
        </tr>
        <tr>
          <td>
            <%=Email%>
            <input type="hidden" name="Email" value="<%=Email%>">
          </td>
        </tr>
        <!--tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Confirmação de Email:
          </td>
        </tr>
        <tr>
          <td-->
            <input type="hidden" name="Email2" value="<%=Email%>">
          <!--/td>
        </tr-->
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0 border=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">DDD:
                </td>
                <td width=140>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Fone:
                </td>
              </tr>
              </tr>
            </table>
          </td>
         </tr>
         <tr>
          <td>
            <table cellspacing=0 cellpadding=0 border=0>
              <tr>
                <td>
                  <input type="text" name="ddd" value="<%=ddd%>" maxlength=2 label="Identidade" style="width:45; height:17; " onKeyPress="Numero()">
                </td>
                <td width=140>
                  <input type="text" name="fone" value="<%=fone%>" maxlength=8 label="Identidade" style="width:90; height:17; " onKeyPress="Numero()">
                </td>
            </table>
          </td>
        <tr>
          <td>
            <table width="100%" cellpadding=1 cellspacing=1>
         <tr>
           <td>
             &nbsp;&nbsp;<span class="estilo">&nbsp;Identidade:
          </td>
         </tr>
         <tr>
          <td>
            <input type="text" name="identidade" value="<%=identidade%>" maxlength=15 label="Identidade" style="width:145; height:17; " onKeyPress="Numero()">
          </td>
         </tr>
      <tr>
       <td>
        <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;CPF:
       </td>
      </tr>
      <tr>
          <td>
            <%=cpf%>
            <input type="hidden" name="cpf" value="<%=cpf%>" label="Identidade">
          </td>
      </tr>
      <tr>
       <td>
        <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;CEP do Imóvel:
       </td>
      </tr>
      <tr>
        <td>
          <input type="text" name="cep" value="<%=cep%>" maxlength=10 label="suites" style="width:70; height:17; " onKeyPress="Numero();CEP(this)">&nbsp;&nbsp;<a HREF="javascript:chamar_cep()"><span span class="estilo"> <img src="../img/correios.gif" alt="Consultar correios" border=0></a>
        </td>
      </tr>        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td width=140>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Estado:
                </td>
                <td width=140>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Cidade:
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
                  <select name="estado" style="width:140;" onChange="document.formins.reload.value='3';document.formins.cidade.value='0';document.formins.submit()" >
                    <option value = "0">(Selecione)</option>
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
                  <select name="cidade" style="width:140;">
                    <option value = "0">(Selecione)</option>
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
              </tr>
            </table>
          </td>
      </tr>
      <tr>
       <td>
        <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Transação:
       </td>
      </tr>
      <tr>
        <td>
          <select name="transacao" style="width:140;">
            <option value = "">(Selecione)</option>
              <%set cbai=conn.execute("select * from servico where status=0 ORDER BY descricao")%>
              <%do while not cbai.eof %>
                <%if cstr(cbai("codigo"))=cstr(transacao) then%>
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
        <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Tipo:
       </td>
      </tr>
      <tr>
        <td>
          <select name="tipo_imovel" style="width:140;">
            <option value = "">(Selecione)</option>
              <%set cbai=conn.execute("select * from tipo_imovel where status=0 ORDER BY descricao")%>
              <%do while not cbai.eof %>
                <%if cstr(cbai("codigo"))=cstr(tipo_imovel) then%>
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
            <table cellspacing=0 cellpadding=0>
         <tr>
           <td>	
             <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Subtipo de Imovel:
          </td>
         </tr>
         <tr>
          <td>
            <select name="subtipo_imovel" style="width:140;">
              <option value = "">(Selecione)</option>
              <option value = "Apartamento">Apartamento</option>
              <option value = "Casa">Casa</option>
              <option value = "Flat">Flat</option>
              <option value = "Loteamento">Loteamento</option>
              <option value = "Sobrado">Sobrado</option>
            </select>
          </td>
         </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td>
          <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Categoria:
        </td>
      </tr>
      <tr>
        <td>
          <select name="Categoria" style="">
            <option value = "0"></option>
              <%set cbai=conn.execute("select * from tipo_Categoria where status=0 ORDER BY descricao")%>
              <%do while not cbai.eof %>
                <%if cstr(cbai("codigo"))=cstr(Categoria) then%>
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
          <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Área Útil:
        </td>
      </tr>
      <tr>
        <td>
          <input type="text" name="area" value="<%=area%>" maxlength=8 label="suites" style="width:60; height:17;" onKeyPress="Numero()"> m²
        </td>
      </tr>
      <tr>
        <td>
           <%if cont = "0" then%>
             <input type="checkbox" name="cont" value="1"  label="suites" ><span class="estilo">Desejo ser contatado por telefone.</span>
           <%else%>
             <input type="checkbox" name="cont" value="0"  checked label="suites" ><span class="estilo">Desejo ser contatado por telefone.</span>
           <%end if%>
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
             <br>
             <input name="image" type="image" value="submit" src="../../imagens/botoes/GRAVAR1.gif" width="86" height="26" border=0>
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

