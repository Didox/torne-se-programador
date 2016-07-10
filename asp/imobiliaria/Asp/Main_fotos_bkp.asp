<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<!-- #include file="upload.asp" -->
<%codigo  =request("codigo")
pagina  =request("pagina")
deletar =request("deletar")
reload  =request("reload")
flag  =request("flag")
Set Uploader = New FileUploader
Uploader.Upload()
if flag = "1" then
   if msg="" and reload = "" then
      For Each imagem In Uploader.Files.Items
          cont=cont+1
	  imagem.SaveToDisk server.mappath("..\fotos")
	  documento = imagem.FileName
	  comodo=Uploader.Form("comodo"&cont)
	  sqlins = "INSERT INTO registro_foto(cod_imovel,arquivo,cod_comodo,data_inclusao) VALUES ("&codigo&",'"&documento&"',"&comodo&", convert(datetime,'"&date()&"',103))"
	  'response.write sqlins
	  conn.execute (sqlins)
      Next%>
      <%if pagina="Main_Registro_Fotos" then%>
         <script>location.href='Main_Registro_Fotos.asp?codigo=<%=codigo%>'</script>
      <%else%>
              <script>location.href='Ativacao_plano.asp?codigo=<%=codigo%>&str=cad'</script>
      <%end if%> 
   <%end if
end if%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
<link rel="stylesheet" href="estilo.css" type="text/css">
<script>
function popup(arquivo,w,h)
{
  fenetre=window.open('imagem.asp?codigo='+arquivo,"imagem","resizable=no,scrollbars=no,location=no,top=20,left=20,width="+w+",height="+h)
}

function veriCombo(){
  /*if (document.form1.imagem1.value != "" || document.form1.imagem2.value != "" || document.form1.imagem3.value != "" || document.form1.imagem4.value != "" || document.form1.imagem5.value != "" || document.form1.imagem6.value != "" || document.form1.imagem7.value != "" || document.form1.imagem8.value != "" || document.form1.imagem9.value != "" || document.form1.imagem10.value != ""){
    if (document.form1.imagem1.value != "" && document.form1.comodo1.value == 0){
      alert("Selecione a qual comodo esta imagem pertence.");
      retorno = false;
    }
    else{
      retorno = true;
    }
    if (document.form1.imagem2.value != "" && document.form1.comodo2.value == 0){
      alert("Selecione a qual comodo esta imagem pertence.");
      retorno = false;
    }
    else{
      retorno = true;
    }
    if (document.form1.imagem3.value != "" && document.form1.comodo3.value == 0){
      alert("Selecione a qual comodo esta imagem pertence.");
      retorno = false;
    }
    else{
      retorno = true;
    }
    if (document.form1.imagem4.value != "" && document.form1.comodo4.value == 0){
      alert("Selecione a qual comodo esta imagem pertence.");
      retorno = false;
    }
    else{
      retorno = true;
    }
    if (document.form1.imagem5.value != "" && document.form1.comodo5.value == 0){
      alert("Selecione a qual comodo esta imagem pertence.");
      retorno = false;
    }
    else{
      retorno = true;
    }
    if (document.form1.imagem6.value != "" && document.form1.comodo6.value == 0){
      alert("Selecione a qual comodo esta imagem pertence.");
      retorno = false;
    }
    else{
      retorno = true;
    }
    if (document.form1.imagem7.value != "" && document.form1.comodo7.value == 0){
      alert("Selecione a qual comodo esta imagem pertence.");
      retorno = false;
    }
    else{
      retorno = true;
    }
    if (document.form1.imagem8.value != "" && document.form1.comodo8.value == 0){
      alert("Selecione a qual comodo esta imagem pertence.");
      retorno = false;
    }
    else{
      retorno = true;
    }
    if (document.form1.imagem9.value != "" && document.form1.comodo9.value == 0){
      alert("Selecione a qual comodo esta imagem pertence.");
      retorno = false;
    }
    else{
      retorno = true;
    }
    if (document.form1.imagem10.value != "" && document.form1.comodo10.value == 0){
      alert("Selecione a qual comodo esta imagem pertence.");
      retorno = false;
    }
    else{
      retorno = true;
    }
    
    if (retorno == true){
      document.form1.submit();
    }
  }
  else{*/
    document.form1.submit();
  //}
}
</script>
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">

<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
    <!--#INCLUDE FILE ="Main_Topo.asp"-->
    <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&codigo=<%=codigo%><%if request("str") = "cad" then%>&str=cad<%end if%>" name="form1" ENCTYPE="multipart/form-data">
      <table border="0" cellpadding=0 cellspacing=0 width=500>
      <input type="hidden" name="reload">
      <input type="hidden" name="excluir">
        <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_12.gif">&nbsp;ADICIONAR FOTOS NO IMÓVEL&nbsp<img src="../img/b4.gif">
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">
            <%If trim(request("str")) = trim("cad") then%>
            <table width=100% border=0 cellspacing="0" cellpadding="0">
              <tr> 
                <td class="tb"><b>Passo 5 de 6</b></b>
              </tr>
            </table> 
            <%End If%>
          </td>
        </tr>
        </tr> 
        <tr>
          <td>
            <br>
            <%set imovel=conn.execute("select * from imoveis where codigo="&codigo)%>
            <span class="estilo"><b>IMÓVEL:</b>&nbsp;<%=imovel("descricao")%>
            <br><br>
          </td>
        </tr>
        <tr>
          <td>&nbsp;<span class="estilo">Imagem Destaque:</td>
        </tr>
        <tr>
          <td>
            <select name="comodo1" style="width:140;background=#E8E8E8;">
            <option value="0" selected>(Selecione)
             <%set cbai=conn.execute("select * from tipo_fotos ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <%if cstr(cbai("codigo"))=comodo1 then%>
                 <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
               <%else%>
                 <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
               <%end if%>
               <%cbai.movenext%>
             <%loop%>
          </select>
          <input type="file" name="imagem1" size=22  style="width:290; height:17; background=#E8E8E8;"></td>
        </tr>
        <tr>
          <td>&nbsp;<span class="estilo">Imagem 1:</td>
        </tr>
        <tr>
          <td>
            <select name="comodo2" style="width:140;background=#E8E8E8;">
             <option value="0" selected>(Selecione)
             <%set cbai=conn.execute("select * from tipo_fotos ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <%if cstr(cbai("codigo"))=comodo2 then%>
                 <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
               <%else%>
                 <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
               <%end if%>
               <%cbai.movenext%>
             <%loop%>
          </select>
          <input type="file" name="imagem2" size=22  style="width:290; height:17; background=#E8E8E8;"></td>
        </tr>
        <tr>
          <td>&nbsp;<span class="estilo">Imagem 2:</td>
        </tr>
        <tr>
          <td>
            <select name="comodo3" style="width:140;background=#E8E8E8;">
             <option value="0" selected>(Selecione)
             <%set cbai=conn.execute("select * from tipo_fotos ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <%if cstr(cbai("codigo"))=comodo3 then%>
                 <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
               <%else%>
                 <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
               <%end if%>
               <%cbai.movenext%>
             <%loop%>
          </select>
          <input type="file" name="imagem3" size=22  style="width:290; height:17; background=#E8E8E8;"></td>
        </tr>
        <tr>
          <td>&nbsp;<span class="estilo">Imagem 3:</td>
        </tr>
        <tr>
          <td>
             <select name="comodo4" style="width:140;background=#E8E8E8;">
            <option value="0" selected>(Selecione)
             <%set cbai=conn.execute("select * from tipo_fotos ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <%if cstr(cbai("codigo"))=comodo4 then%>
                 <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
               <%else%>
                 <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
               <%end if%>
               <%cbai.movenext%>
             <%loop%>
          </select>
          <input type="file" name="imagem4" size=22  style="width:290; height:17; background=#E8E8E8;"></td>
        </tr>
        <tr>
          <td>&nbsp;<span class="estilo">Imagem 4:</td>
        </tr>
        <tr>
          <td>
            <select name="comodo5" style="width:140;background=#E8E8E8;">
             <option value="0" selected>(Selecione)
             <%set cbai=conn.execute("select * from tipo_fotos ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <%if cstr(cbai("codigo"))=comodo5 then%>
                 <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
               <%else%>
                 <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
               <%end if%>
               <%cbai.movenext%>
             <%loop%>
          </select>
          <input type="file" name="imagem5" size=22  style="width:290; height:17; background=#E8E8E8;"></td>
        </tr>
        <tr>
          <td>&nbsp;<span class="estilo">Imagem 5:</td>
        </tr>
        <tr>
          <td>
            <select name="comodo6" style="width:140;background=#E8E8E8;">
             <option value="0" selected>(Selecione)
             <%set cbai=conn.execute("select * from tipo_fotos ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <%if cstr(cbai("codigo"))=comodo6 then%>
                 <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
               <%else%>
                 <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
               <%end if%>
               <%cbai.movenext%>
             <%loop%>
          </select>
          <input type="file" name="imagem6" size=22  style="width:290; height:17; background=#E8E8E8;"></td>
        </tr>
        <tr>
          <td>&nbsp;<span class="estilo">Imagem 6:</td>
        </tr>
        <tr>
          <td>
             <select name="comodo7" style="width:140;background=#E8E8E8;">
            <option value="0" selected>(Selecione)
             <%set cbai=conn.execute("select * from tipo_fotos ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <%if cstr(cbai("codigo"))=comodo7 then%>
                 <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
               <%else%>
                 <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
               <%end if%>
               <%cbai.movenext%>
             <%loop%>
          </select>
          <input type="file" name="imagem7" size=22  style="width:290; height:17; background=#E8E8E8;"></td>
        </tr>
        <tr>
          <td>&nbsp;<span class="estilo">Imagem 7:</td>
        </tr>
        <tr>
          <td>
             <select name="comodo8" style="width:140;background=#E8E8E8;">
            <option value="0" selected>(Selecione)
             <%set cbai=conn.execute("select * from tipo_fotos ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <%if cstr(cbai("codigo"))=comodo8 then%>
                 <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
               <%else%>
                 <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
               <%end if%>
               <%cbai.movenext%>
             <%loop%>
          </select>
          <input type="file" name="imagem8" size=22  style="width:290; height:17; background=#E8E8E8;"></td>
        </tr>
        <tr>
          <td>&nbsp;<span class="estilo">Imagem 8:</td>
        </tr>
        <tr>
          <td>
             <select name="comodo9" style="width:140;background=#E8E8E8;">
            <option value="0" selected>(Selecione)
             <%set cbai=conn.execute("select * from tipo_fotos ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <%if cstr(cbai("codigo"))=comodo9 then%>
                 <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
               <%else%>
                 <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
               <%end if%>
               <%cbai.movenext%>
             <%loop%>
          </select>
          <input type="file" name="imagem9" size=22  style="width:290; height:17; background=#E8E8E8;"></td>
        </tr>
        <tr>
          <td>&nbsp;<span class="estilo">Imagem 9:</td>
        </tr>
        <tr>
          <td>
             <select name="comodo10" style="width:140;background=#E8E8E8;">
            <option value="0" selected>(Selecione)
             <%set cbai=conn.execute("select * from tipo_fotos ORDER BY descricao")%>
             <%do while not cbai.eof %>
               <%if cstr(cbai("codigo"))=comodo10 then%>
                 <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
               <%else%>
                 <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
               <%end if%>
               <%cbai.movenext%>
             <%loop%>
          </select>
          <input type="file" name="imagem10" size=22  style="width:290; height:17; background=#E8E8E8;"></td>
        </tr>
        <tr>
          <td align=center>
            <a href="javascript:veriCombo()"><img src="../img/ok.gif" border=0></a>
          </td>
        </tr>
        </tr>
        </tr>   
      </table>
    </td>
  </tr>  
</table>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</form>
</body>
</html>

