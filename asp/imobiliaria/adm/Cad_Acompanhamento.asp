<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
codigo=request("codigo")
reload=request("reload")
corretor =request("corretor")
imovel   =request("imovel")
data=request("tempo")
acompanhamento=trim(ucase(request("acompanhamento")))
if request("flag") = 1 then
   descricao=replace(trim(ucase(request("descricao"))),"'","")
   tipo     =replace(trim(ucase(request("tipo"))),"'","")
   corretor=replace(trim(ucase(request("corretor_cb"))),"'","")&replace(trim(ucase(request("corretor_hd"))),"'","")
   if descricao = "" then
      msg = msg & "Descrição.<br>"
   end if
   if imovel = "" then
      msg = msg & "Imovel.<br>"
   end if
   if corretor = "" then
      msg = msg & "Corretor.<br>"        
   end if
   if tipo = "" then
     msg = msg & "Tipo.<br>"
   end if
   if acompanhamento = "" then
     acompanhamento="0"
   end if
   if msg="" and reload = "" then
      conn.execute("insert into acompanhamento (cod_corretor , cod_imovel , cod_visita , cod_acompanhamento , descricao, data, acompanhamento) values ("&corretor&","&imovel&","&codigo&","&acompanhamento&",'"&descricao&"', convert(datetime,'"&data&"',103),"&tipo&")")%>

      <script>
         alert('Cadastro efetuado com sucesso!');
         location.href="<%=pagina%>.asp?codigo=<%=codigo%>";
      </script>
   <%end if
end if%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
<link rel="stylesheet" href="estilo.css" type="text/css">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="document.form1.descricao.focus()">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&codigo=<%=codigo%>" name="form1">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastrar novo acompanhamento siga os passos descrito abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha todos os campos corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento dos campos obrigatórios.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
            &nbsp;&nbsp;<img src="../img/helpicon.gif" border=0>&nbsp;&nbsp;Campo com ajuda &nbsp;&nbsp;<br>
          </td>
        </tr>
        <tr>
          <td>
            <%if msg<>""  and reload = "" then%>
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
            <%if pagina = "Main_Visita" then%>
              &nbsp;&nbsp;<a href="<%=pagina%>.asp?imovel=<%=imovel%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
            <%end if%>
            <%if pagina = "Detalhe_Visita" then%>
              &nbsp;&nbsp;<a href="<%=pagina%>.asp?imovel=<%=imovel%>&codigo=<%=codigo%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
            <%end if%>
            <%if pagina = "Main_acompanhamento" then%>
              &nbsp;&nbsp;<a href="<%=pagina%>.asp?imovel=<%=imovel%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>            
            <%end if%>
          </td>
        </tr>
        <tr>
          <td><br></td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
        <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_14.gif">&nbsp;CADASTRAR ACOMPANHAMENTO 
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        <tr>
         <td>
           <input type=checkbox name="acompanhamento" <%if cstr(acompanhamento)="1" then%> checked <%end if%> value="1"><span class="estilo">Acompanhamento efetuado:
         </td>
       </tr>
       <tr>
           <td>
             <span class="estilo">Imovel:
           </td>
       </tr>
       <tr>
         <td>
           <%set imov = conn.execute("select * from imoveis where codigo="&imovel)%>
           <input type="hidden" name="imovel" value="<%=imov("codigo")%>">
           <span class="estilo"><%=imov("descricao")%>
         </td>
       </tr>
       <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Descrição:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="descricao" value="<%=descricao%>" maxlength=50 label="descricao" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
          <td>
           <table cellspacing=0 cellpadding=0>
            <tr>
             <td>
               <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Corretor:
             </td>
           </tr>    
           <tr>
            <td>
                 <%if corretor<>"" then%>
	           <%set itens = conn.execute("select * from corretor where codigo="&corretor)%>
	           <%=itens("nome")%>           
	           <input type="hidden" name="corretor_hd" value="<%=itens("codigo")%>">
	         <%else%>
	          <select name="corretor_cb" style="background=#E8E8E8;">
		     <option value= ""></option>
		     <%set corretores=conn.execute("select * from corretor ORDER BY nome")%>
		     <%if corretor_cb="" or corretor_cb="0" then%>
		       <%corretor_cb=corretores("codigo")%>
		     <%end if%>
		     <%do while not corretores.eof %>
		     <%if cstr(corretores("codigo"))= corretor_cb then%>
		     <option value="<%=corretores("codigo")%>" selected><%=corretores("nome")%>
		     <%else%>
		     <option value="<%=corretores("codigo")%>"><%=corretores("nome")%>
		     <%end if%>
		     <%corretores.movenext%>
		     <%loop%>
		  </select> 
	         <%end if%>
            </td>
         </tr>
        </tr>
      </table>
    </td>
  </tr>
 <tr>
 <td>
 <table cellspacing=0 cellpadding=0>
    <tr>
      <td>
         <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Tipo:
      </td>
      <td>
         &nbsp;<span class="Vencimento">Vencimento:
      </td>
    </tr>    
    <tr>
      <td>
        <input type=hidden name="reload">      
        <select name="tipo" style="background=#E8E8E8;" onchange="document.form1.reload.value='1';;document.form1.submit()">
          <option value = ""></option>
          <%set cbai=conn.execute("select * from Tipo_acompanhamento ORDER BY descricao")%>
          <%do while not cbai.eof %>
          <%if tipo = "" then%>
            <%tipo=cbai("codigo")%>
          <%end if%>
          <%if cstr(cbai("codigo"))= tipo then%>
          <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
          <%else%>
          <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
          <%end if%>
          <%cbai.movenext%>
          <%loop%>
        </select>
      </td>
      <%set tempo = conn.execute("select * from tipo_acompanhamento where codigo = "&tipo)%>
      <td align=center><%=date()+tempo("tempo")%></td>
      <input type="Hidden" value="<%=date()+tempo("tempo")%>" name="tempo">
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
</table><br><br><br><br><br><br><br><br><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>