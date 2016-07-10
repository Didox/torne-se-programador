<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%codigo=request("codigo")
pagina=request("pagina")
set planos=conn.execute("select * from planos where codigo="&codigo)
if request("flag") <> 1 then
   titulo=replace(trim(ucase(planos("titulo"))),"'","")
   descricao=replace(trim(ucase(planos("descricao"))),"'","")
   valor=replace(replace(trim(ucase(planos("valor"))),".",""),",",".")
   validade=trim(ucase(planos("validade")))
   imagem=trim(planos("imagem"))
else
   titulo=replace(trim(ucase(request("titulo"))),"'","")
   descricao=replace(trim(ucase(request("descricao"))),"'","")
   valor=replace(replace(trim(ucase(request("valor"))),".",""),",",".")
   validade=trim(ucase(request("validade")))
   imagem=trim(request("imagem"))
   if titulo<>"" then
      set verifica_descricao=conn.execute("select * from planos where titulo='"&titulo&"' and codigo<>"&codigo)
      if not verifica_descricao.eof then
         msg=msg&" Registro já existe<br>"
      end if
   else
      msg=msg&" Título.<br>"
   end if
   if descricao="" then
      msg=msg&" Descrição.<br>"
   end if
   if valor="" then
      msg=msg&" Valor.<br>"
   end if
   if validade="" then
      msg=msg&" validade.<br>"
   end if
   if msg="" and reload = "" then
     conn.execute("update planos set titulo='"&titulo&"' , descricao='"&descricao&"' , valor="&valor&" , validade="&validade&", imagem = '"&imagem&"' where codigo="&codigo)%>
      <script>
         alert('Alteração efetuada com sucesso!');
         location.href="<%=pagina%>.asp";
      </script>
   <%end if
end if

'ver todos diretorio da pasta /imagens --------------------------------------------
Set objFileSys = server.createobject("Scripting.FilesystemObject")
dir = server.mappath("../../imagens/")
set TheFolder=objFileSys.GetFolder(dir)
Set MyDrives = objFileSys.Drives
set TheRootFolder = TheFolder
set RootFolders = TheRootFolder.SubFolders

For each SubFolder in RootFolders
If SubFolder.Name<>"destaques"  then

subdir = dir & "\" & SubFolder.Name & "\"

set TheFolder=objFileSys.GetFolder(subdir)
Set TheFiles = TheFolder.files

For each AFile in TheFiles
'response.write SubFolder.Name &"/" & AFile.Name & "<br>"
arquivos = arquivos & "<option value="&SubFolder.Name &"/"&AFile.Name&">" & SubFolder.Name &"/" & AFile.Name & "</option>"
Next

End If 'verificar se é da pasta de destaques
Next

set TheFolder=objFileSys.GetFolder(dir)
Set TheFiles = TheFolder.files

For each AFile in TheFiles
arquivos = arquivos & "<option value="&AFile.Name&">" & AFile.Name & "</option>"
'response.write AFile.Name & "<br>"
Next



Set objFileSys2 = server.createobject("Scripting.FilesystemObject")
dir2 = server.mappath("../../imagens/")
set TheFolder2=objFileSys2.GetFolder(dir2)
Set MyDrives2 = objFileSys2.Drives
set TheRootFolder2 = TheFolder2
set RootFolders2 = TheRootFolder2.SubFolders

For each SubFolder2 in RootFolders2
If SubFolder2.Name<>"destaques"  then

subdir2 = dir2 & "\" & SubFolder2.Name & "\"

set TheFolder2=objFileSys2.GetFolder(subdir2)
Set TheFiles2 = TheFolder2.files

For each AFile2 in TheFiles2
'response.write SubFolder2.Name &"/" & AFile2.Name & "<br>"
arquivos2 = arquivos2 & "<option value="&SubFolder2.Name &"/"&AFile2.Name&">" & SubFolder2.Name &"/" & AFile2.Name & "</option>"
Next

End If 'verificar se é da pasta de destaques
Next

set TheFolder2=objFileSys2.GetFolder(dir2)
Set TheFiles2 = TheFolder2.files

For each AFile2 in TheFiles2
arquivos2 = arquivos2 & "<option value="&AFile2.Name&">" & AFile2.Name & "</option>"
'response.write AFile.Name & "<br>"
Next
%>

<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
<link rel="stylesheet" href="estilo.css" type="text/css">
<script language="JavaScript">
function altera_img()
{
	if (form1.imagem.value.length > 0)
	{
		form1.pic.src = "../../imagens/" + form1.imagem.value;
	}
	else
	{
		form1.pic.src = "../../imagens/white.jpg";
	}
}
</script>
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="document.form1.titulo.focus()">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastrar um novo registro de midia siga os passos descrito abaixo.<br><br></b>
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
            &nbsp;&nbsp;<a href="<%=pagina%>.asp"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
        <tr>
          <td span class="estilo" width=100% colspan=2>
            <img src="../img/r_14.gif">&nbsp;CADASTRAR NOVO REGISTRO DE MIDIA<br><br>
          </td>
        </tr>
        <tr>
          <td colspan=2>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Título:
          </td>
        </tr>
        <tr>
          <td colspan=2>
            <input type="text" name="titulo" value="<%=titulo%>" maxlength=50 label="Serviço" style="width:290; height:17; background=#E8E8E8;">
          </td>
        </tr>
        <tr>
          <td colspan=2>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Descrição:
          </td>
        </tr>
        <tr>
          <td colspan=2>
            <textarea name="descricao" value="" maxlength=4000 label="" style="width:290; height:170; background=#E8E8E8;"><%=descricao%></textarea>
          </td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Valor:
          </td>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Validade:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="Valor" value="<%=Valor%>" maxlength=10 label="Serviço" style="width:90; height:17; background=#E8E8E8;" onkeypress="Numero();" onkeyup="Moeda(this);">
          </td>
          <td>
            <input type="text" name="Validade" value="<%=Validade%>" maxlength=3 label="Serviço" style="width:90; height:17; background=#E8E8E8;"onkeypress="Numero();">
          </td>
        </tr>
        <tr>
          <td colspan=2>
            &nbsp;&nbsp;<span class="estilo">Imagem:
          </td>
        </tr>
        <tr>
          <td colspan=2>
            <select name="imagem" label="Serviço" style="background=#E8E8E8;" onChange="altera_img();">
              <option value="">Selecione</option>
              <%if imagem <> "" then%>
              <option value="<%=imagem%>" selected><%=imagem%></option>
              <%end if%>
              <%=arquivos%>
            </select>
            <img name="pic" <%if imagem <> "" then%>src="../../imagens/<%=imagem%>"<%else%>src="../../imagens/white.jpg"<%end if%> border="0">
          </td>
        </tr>
        <tr>
          <td align=center  colspan=2>
            <input type="image" src="../img/ok.gif" value="submit" border=0>
          </td>
        </tr>   
      </table>
    </td>
  </tr>
</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>

