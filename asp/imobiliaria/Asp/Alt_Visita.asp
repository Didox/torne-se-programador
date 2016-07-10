<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
codigo2=request("codigo2")
pagina=request("pagina")
if request("flag") <> 1 then
   set Visita=conn.execute("select * from Visita where codigo="&codigo)
   hora    =replace(trim(ucase(Visita("hora_visita"))),"'","")
   imovel  =replace(trim(ucase(Visita("cod_imovel"))),"'","")
   data    =replace(trim(ucase(Visita("data_visita"))),"'","")
   nome    =replace(trim(ucase(Visita("nome"))),"'","")
   ddd     =replace(trim(ucase(Visita("ddd"))),"'","")
   fone    =replace(trim(ucase(Visita("fone"))),"'","")
   email   =replace(trim(ucase(Visita("email"))),"'","")
   servico =trim(ucase(Visita("cod_servico")))
   visita =trim(ucase(Visita("visita")))   
else
   hora    =replace(trim(ucase(request("hora"))),"'","")
   imovel  =replace(trim(ucase(request("imovel"))),"'","")
   data    =replace(trim(ucase(request("data"))),"'","")
   nome    =replace(trim(ucase(request("nome"))),"'","")
   ddd     =replace(trim(ucase(request("ddd"))),"'","")
   fone    =replace(trim(ucase(request("fone"))),"'","")
   email   =replace(trim(ucase(request("email"))),"'","")
   servico =trim(ucase(request("servico")))
   visita =trim(ucase(request("visita")))      
   if nome = "" then
     msg = msg&" Nome.<br>"
   end if
   if ddd = "" then
     msg = msg&" DDD.<br>"
   end if
   if fone = "" then
     msg = msg&" Fone.<br>"
   end if
   if imovel="" then
     msg = msg&" Imovel.<br>"
   end if
   if servico = "" then
     msg = msg&" Servico.<br>"
   end if
   if data_valida(data,0) then
      msg=msg&" Data.<br>"   
   else 
     if not isdate(data) then
       msg=msg&" Data incorreta.<br>"
     end if
   end if
   if hora = "" then
     msg=msg&" Hora."
   end if
   if msg="" then
       conn.execute("update Visita set hora_visita='"&hora&"' , cod_imovel="&imovel&" , data_visita=convert(datetime,'"&data&"',103) , nome='"&nome&"' , email='"&email&"' , ddd="&81&" , fone='"&fone&"' , cod_servico="&servico&" , visita=1 where codigo="&codigo)%>
      <script>
         alert('Alteração efetuada com sucesso!');
         location.href="<%=pagina%>.asp?codigo=<%=codigo%>&codigo2=<%=codigo2%>";
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
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="document.form1.nome.focus()">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para alterar visita siga os passos descrito abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha o campo corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento do campo obrigatório.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
            &nbsp;&nbsp;<img src="../img/helpicon.gif" border=0>&nbsp;&nbsp;Campo com ajuda &nbsp;&nbsp;<br>
          </td>
        </tr>
        <tr>
          <td>
            <%if msg<>"" then%>
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
            <img src="../img/r_14.gif">&nbsp;ALTERAR VISITA<br><br>
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        <tr>
         <td>
           <input type=checkbox name=visita <%if visita=1 then%> checked <%end if%>value=1><span class="estilo">Visita efetuada:
         </td>
       </tr>
        <tr>
         <td>
           <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Nome:
         </td>
       </tr>
       <tr>
         <td>
            <input type="text" name="nome" value="<%=nome%>" maxlength=50 label="nome" style="width:200; height:17; background=#E8E8E8;">
         </td>
       </tr>
       <tr>
         <td>
           <span class="estilo">E-mail:
         </td>
       </tr>
       <tr>
         <td>
            <input type="text" name="email" value="<%=email%>" maxlength=50 label="email" style="width:200; height:17; background=#E8E8E8;">
         </td>
       </tr>
       <tr>
       <td>
         <table cellpadding="0" cellspacing="0" border="0" >
         <tr>
          <td>
           <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">DDD:
          </td>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Fone:
          </td>
         </tr>
         <tr>
          <td>
           <input type="text" name="ddd" value="<%=ddd%>" maxlength=2 label="ddd" style="width:30; height:17; background=#E8E8E8;" onkeypress="Numero()">
          </td>
         <td>
           <input type="text" name="fone" value="<%=fone%>" maxlength=20 label="fone" style="width:100; height:17; background=#E8E8E8;" >
         </td>
        </tr>
      </table>
      </td>
      <tr>
         <td>
           <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Imovel:
         </td>
       </tr>    
       <tr>
        <td>
         <select name="imovel" style="background=#E8E8E8;">
          <option value = ""></option>
          <%set cbai=conn.execute("select * from imoveis ORDER BY descricao")%>
          <%do while not cbai.eof %>
          <%if cstr(cbai("codigo"))= imovel then%>
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
           <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Serviço:
         </td>
       </tr>    
       <tr>
        <td>
         <select name="servico" style="background=#E8E8E8;">
          <option value= ""></option>
          <%set serv=conn.execute("select * from servico ORDER BY descricao")%>
          <%do while not serv.eof %>
          <%if cstr(serv("codigo"))= servico then%>
          <option value="<%=serv("codigo")%>" selected><%=serv("descricao")%>
          <%else%>
          <option value="<%=serv("codigo")%>"><%=serv("descricao")%>
          <%end if%>
          <%serv.movenext%>
          <%loop%>
        </select>
       </td>
      </tr>
      <tr>
       <td>
         <table cellpadding="0" cellspacing="0" border="0" >
         <tr>
          <td>
           <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Data da visita:
          </td>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Hora:
          </td>
         </tr>
         <tr>
          <td>
           <input type="text" name="data" value="<%=data%>" maxlength=10 label="data" style="width:100; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this)">
          </td>
         <td>
           <input type="text" name="hora" value="<%=hora%>" maxlength=5 label="hora" style="width:50; height:17; background=#E8E8E8;" onkeypress="HORA(this)">
         </td>
        </tr>
      </table>
      </td>
     </tr>
     <tr>
      <td>
       <table cellpadding="0" cellspacing="0" border="0" >
         <tr colspan=2 >
            <td align=center>
              <input type="image" src="../img/ok.gif" value="submit" border=0>
            </td>
            <td></td>
         </tr>
       </table>
      </td>
    </tr>   
    </table>
   </td>
 </tr>
</table><br><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>

