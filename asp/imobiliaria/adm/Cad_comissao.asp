<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
  codigo=request("codigo")
  codigo2=request("codigo2")
  set contrato = conn.execute("select * from contrato where codigo = "&codigo)
  data=request("data")
  if not data_valida(data,0) then
     data=data_completa(date())
  end if
if request("flag") = 1 then
  tipo=request("tipo")
  valor=replace(trim(ucase(request("valor"))),"'","")
  tipo_conta=request("tipo_conta")
  corretor = request("corretor")
  data=request("data")
  descricao=replace(trim(ucase(request("descricao"))),"'","")
   if tipo_conta = "" then
    	  msg=msg&" Tipo Conta.<br>"
   end if
   if not data_valida(data,0) then 
      msg = msg & "Data.<br>"
   end if
   if not isnumeric(valor) then
     msg = msg & "Valor.<br>"
   end if
   if descricao = "" then
      msg=msg&" Descri��o.<br>"
   end if
   if msg="" then
    conn.execute("insert into contas (cod_contrato, cod_funcionario, tipo, valor, descricao, data_inclusao, data, cod_tipo_conta) values ("&codigo&", "&corretor&", "&tipo&", "&replace(replace(csng(valor),".",""),",",".")&", '"&descricao&"', convert(datetime,'"&date()&"',103),convert(datetime,'"&data&"',103), "&tipo_conta&")")%>
     <script>
        alert('Cadastro efetuado com sucesso!');
        location.href="<%=pagina%>.asp?codigo=<%=codigo2%>";
     </script>
  <%end if
end if%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMA��O LTDA">
<link rel="stylesheet" href="estilo.css" type="text/css">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="document.form1.valor.focus()">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&codigo=<%=codigo%>&codigo2=<%=codigo2%>" name="form1">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <table width="778" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td bgcolor="#6C7692"><img src="../denilson/dot_transparent.gif" width="1" height="2"></td>
        </tr>
        <tr> 
          <td></td>
        </tr>
        <tr> 
          <td bgcolor="#999999"><img src="../denilson/dot_transparent.gif" width="1" height="1"></td>
        </tr>
        <tr>
          <td bgcolor="#CCCCCC"><img src="../denilson/dot_transparent.gif" width="1" height="2"></td>
        </tr>
      </table>
      <br>
      <table border="0" align=left width=380 cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <br>
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastrar uma nova rescisao siga os passos descrito abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha todos os campos corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAten��o no preenchimento dos campos obrigat�rios.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
            &nbsp;&nbsp;<img src="../img/helpicon.gif" border=0>&nbsp;&nbsp;Campo com ajuda &nbsp;&nbsp;<br>
          </td>
        </tr>
        <tr>
          <td>
            <%if msg<>""then%>
               <table cellpadding="0" cellspacing="0" border="0" height=100 width="170">
                 <tr>
                   <td height=1><img src="../img/img_S_E.gif" border="0"></td>
                   <td height=1 width="100%" background="../img/img_S.gif">&nbsp;&nbsp;<font color="#FFFFFF"><b>Erros Encontrados</b></font></td>
                   <td height=1><img src="../img/img_S_D.gif" border="0"></td>
                 </tr>
                 <tr>
                   <td height=1 background="../img/img_E.gif">&nbsp;</td>
                   <td valign="top" height=100% width="100%">
                     <font color="#CC0000"><%=msg%></font>
                   </td>
                   <td height=1 background="../img/img_D.gif">&nbsp;</td>
                 </tr>
                 <tr>
                   <td height=1>
                     <img src="../img/img_I_E.gif" border="0">
                   </td>
                   <td height=1 width="100%" background="../img/img_I.gif">&nbsp;</td>
                   <td height=1>
                     <img src="../img/img_I_D.gif" border="0">
                   </td>
                 </tr>
               </table>
            <%end if%>
          </td>
        </tr>
        <tr>
          <td><br></td>
        </tr>
        <tr>
          <td>
            &nbsp;&nbsp;<a href="<%=pagina%>.asp?codigo=<%=codigo2%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
       <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_14.gif">&nbsp;CADASTRAR COMISS�O
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
       </tr>
       <tr>
           <td colspan=2>
             <span class="estilo">Tipo:
           </td>
       </tr>
       <tr>
         <td>
           <input type="radio" name="tipo" checked value="1">Comiss�o
           <input type="radio" name="tipo" value="0">Estrono
         </td>
       </tr>
       <tr>
           <td>
             <span class="estilo">Im�vel:
           </td>
       </tr>
       <tr>
         <td>
           <%set imov = conn.execute("select * from imoveis where codigo="&contrato("cod_imovel"))%>
           <input type="hidden" name="cod_imovel" value="<%=imov("codigo")%>">
           <span class="estilo"><b><%=imov("descricao")%></b>
         </td>
       </tr>
       <tr>
           <td>
             <span class="estilo">Contrato:
           </td>
       </tr>
       <tr>
         <td>
           <%set contrato = conn.execute("select * from contrato where codigo="&codigo)%>
           <input type="hidden" name="cod_imovel" value="<%=codigo%>">
           <span class="estilo"><b><%=contrato("numero")%></b>
         </td>
       </tr>
       <tr>
           <td>
             <span class="estilo">Corretor:
           </td>
       </tr>
       <tr>
         <td>
           <%set cliente = conn.execute("select * from corretor where codigo="&contrato("cod_corretor"))%>
           <input type="hidden" name="corretor" value="<%=cliente("codigo")%>">
           <span class="estilo"><b><%=cliente("nome")%></b>
         </td>
       </tr>
       <tr>
           <td>
             <span class="estilo">Data:
           </td>
       </tr>
       <tr>
         <td>
           <input type="text" name="data" value="<%=data%>" label="descricao" style="width:75; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this);">
         </td>
       </tr>
       <tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Tipo da Conta:
          </td>
        </tr>
        <tr>
          <td>
            <select name="tipo_conta" style="width:140;background=#E8E8E8;">
              <option value = ""></option>
              <%set cbai=conn.execute("select * from tipo_conta where status=0 and tipo=1 ORDER BY descricao")%>
              <%do while not cbai.eof %>
              <%if cstr(cbai("codigo"))=cstr(tipo_conta) then%>
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
       <tr>
         <td>
           <table cellspacing=0 cellpadding=0>
            <tr>
             <td>
               <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Valor:
             </td>
           </tr>    
           <tr>
            <td>
             <input type="text" name="valor" value="<%=valor%>" label="valor" style="width:90; height:17;background:#E8E8E8;text-align: RIGHT;" maxlength="18" onkeypress="Numero();" onkeyup="Moeda(this);">
            </td>
         </tr>
         <tr>
           <td>
             <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Descri��o:
           </td>
         </tr>
         <tr>
           <td>
             <input type="text" name="descricao" value="<%=descricao%>" maxlength=50 label="descricao" style="width:290; height:17; background=#E8E8E8;">
           </td>
        </tr>
        </tr>
      </table>
    </td>
  </tr>
   </table>  
     <tr> 
       <td align=center>
         <br><input type="image" src="../img/ok.gif" value="submit" border=0>
       </td>
     </tr>   
  </table>
</td>
</tr>
</table><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>