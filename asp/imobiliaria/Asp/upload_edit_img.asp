<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
'========================Upload Edicao de Imagens  Imoveis=================================

'recebe o codigo da imagen em questão para alteração.
Cod_img = replace(request("cod_img"),"""","")


Sub BuildUploadRequest(RequestBin)
	'Get the boundary
	PosBeg = 1
	PosEnd = InstrB(PosBeg,RequestBin,getByteString(chr(13)))
	if PosEnd = 0 then
		Response.Write "<b>Form was submitted with no ENCTYPE=""multipart/form-data""</b><br>"
		Response.Write "Please correct the form attributes and try again."
		Response.End
	end if
	boundary = MidB(RequestBin,PosBeg,PosEnd-PosBeg)
	boundaryPos = InstrB(1,RequestBin,boundary)
	'Get all data inside the boundaries
	Do until (boundaryPos=InstrB(RequestBin,boundary & getByteString("--")))
		'Members variable of objects are put in a dictionary object
		Dim UploadControl
		Set UploadControl = CreateObject("Scripting.Dictionary")
		'Get an object name
		Pos = InstrB(BoundaryPos,RequestBin,getByteString("Content-Disposition"))
		Pos = InstrB(Pos,RequestBin,getByteString("name="))
		PosBeg = Pos+6
		PosEnd = InstrB(PosBeg,RequestBin,getByteString(chr(34)))
		Name = getString(MidB(RequestBin,PosBeg,PosEnd-PosBeg))
		PosFile = InstrB(BoundaryPos,RequestBin,getByteString("filename="))
		PosBound = InstrB(PosEnd,RequestBin,boundary)
		'Test if object is of file type
		If  PosFile<>0 AND (PosFile<PosBound) Then
			'Get Filename, content-type and content of file
			PosBeg = PosFile + 10
			PosEnd =  InstrB(PosBeg,RequestBin,getByteString(chr(34)))
			FileName = getString(MidB(RequestBin,PosBeg,PosEnd-PosBeg))
			FileName = Mid(FileName,InStrRev(FileName,"\")+1)
			'Add filename to dictionary object
			UploadControl.Add "FileName", FileName
			Pos = InstrB(PosEnd,RequestBin,getByteString("Content-Type:"))
			PosBeg = Pos+14
			PosEnd = InstrB(PosBeg,RequestBin,getByteString(chr(13)))
			'Add content-type to dictionary object
			ContentType = getString(MidB(RequestBin,PosBeg,PosEnd-PosBeg))
			UploadControl.Add "ContentType",ContentType
			'Get content of object
			PosBeg = PosEnd+4
			PosEnd = InstrB(PosBeg,RequestBin,boundary)-2
			Value = FileName
			ValueBeg = PosBeg-1
			ValueLen = PosEnd-Posbeg
		Else
			'Get content of object
			Pos = InstrB(Pos,RequestBin,getByteString(chr(13)))
			PosBeg = Pos+4
			PosEnd = InstrB(PosBeg,RequestBin,boundary)-2
			Value = getString(MidB(RequestBin,PosBeg,PosEnd-PosBeg))
			ValueBeg = 0
			ValueEnd = 0
		End If
		'Add content to dictionary object
		UploadControl.Add "Value" , Value	
		UploadControl.Add "ValueBeg" , ValueBeg
		UploadControl.Add "ValueLen" , ValueLen	
		'Add dictionary object to main dictionary
		UploadRequest.Add name, UploadControl	
		'Loop to next object
		BoundaryPos=InstrB(BoundaryPos+LenB(boundary),RequestBin,boundary)
	Loop
End Sub

Function getByteString(StringStr)
	For i = 1 to Len(StringStr)
 		char = Mid(StringStr,i,1)
		getByteString = getByteString & chrB(AscB(char))
	Next
End Function

'Byte string to string conversion
Function getString(StringBin)
	getString =""
	For intCount = 1 to LenB(StringBin)
		getString = getString & chr(AscB(MidB(StringBin,intCount,1))) 
	Next
End Function

Function UploadFormRequest(name)
	on error resume next
	if UploadRequest.Item(name) then
		UploadFormRequest = UploadRequest.Item(name).Item("Value")
	end if
End Function

'Process the upload
UploadQueryString = Replace(Request.QueryString,"AF_upload=true","")
if mid(UploadQueryString,1,1) = "&" then
	UploadQueryString = Mid(UploadQueryString,2)
end if

AF_uploadAction = CStr(Request.ServerVariables("URL")) & "?AF_upload=true&codigo="& request.QueryString("codigo")
If (Request.QueryString <> "") Then  
	if UploadQueryString <> "" then
		AF_uploadAction = AF_uploadAction & "&" & UploadQueryString
	end if 
End If

If (CStr(Request.QueryString("AF_upload")) <> "") Then
	AF_redirectPage = "Main_corretor.asp"
	If (AF_redirectPage = "") Then
		AF_redirectPage = CStr(Request.ServerVariables("URL"))
	end if
    
	RequestBin = Request.BinaryRead(Request.TotalBytes)
	Dim UploadRequest
	Set UploadRequest = CreateObject("Scripting.Dictionary")  
	BuildUploadRequest RequestBin
  
	AF_keys = UploadRequest.Keys
	for AF_i = 0 to UploadRequest.Count - 1
		AF_curKey = AF_keys(AF_i)
		'Save all uploaded files
		if UploadRequest.Item(AF_curKey).Item("FileName") <> "" then
			AF_value = UploadRequest.Item(AF_curKey).Item("Value")
			AF_valueBeg = UploadRequest.Item(AF_curKey).Item("ValueBeg")
			AF_valueLen = UploadRequest.Item(AF_curKey).Item("ValueLen")

			if AF_valueLen = 0 then
				Response.Write "<B>Erro</B><br><br>"
				Response.Write "Arquivo: " & Trim(AF_curPath) & UploadRequest.Item("Files1").Item("FileName") & "<br>"
				Response.Write "Arquivo não existe<br>"
	  			response.End
			end if
      
			'Create a Stream instance
			Dim AF_strm1, AF_strm2
			Set AF_strm1 = Server.CreateObject("ADODB.Stream")
			Set AF_strm2 = Server.CreateObject("ADODB.Stream")
		      
			'Open the stream
			AF_strm1.Open
			AF_strm1.Type = 1 'Binary
			AF_strm2.Open
			AF_strm2.Type = 1 'Binary
		        
			AF_strm1.Write RequestBin
			AF_strm1.Position = AF_ValueBeg
			AF_strm1.CopyTo AF_strm2,AF_ValueLen
    
			'Create and Write to a File
			AF_curPath = Request.ServerVariables("PATH_INFO")
			AF_curPath = Trim(Mid(AF_curPath,1,InStrRev(AF_curPath,"/")) & "")
			if Mid(AF_curPath,Len(AF_curPath),1) <> "/" then
				AF_curPath = AF_curPath & "/"
			end if  
			on error resume next

                'Atenção grava sempre no diretorio imagens/fotos
				'Não tem relacionamentos de path na gravação do edicao de imagens
				'Gravando apenas o nome do arquivo.
				AF_strm2.SaveToFile Trim(Server.mappath("../../imagens/fotos"))& UploadRequest.Item(AF_curKey).Item("FileName"),2		
			
		
			if err then
				Response.Write "<B>Erro!</B><br><br>"
				Response.Write "Arquivo: " & Trim(AF_curPath) & UploadRequest.Item("Files1").Item("FileName") & "<br>"
				Response.Write "Diretorio não existe, ou problema na permissão.<br>"
  				err.clear
	  			response.End
			end if
		end if
	next
		
		strUpdt = "update registro_foto set arquivo = '"&UploadRequest.Item("Files1").Item("FileName")&"' where codigo ="&Cod_img
        'Atualiza a Imagen Selecionada
		set rsUpdLog = conn.execute(strUpdt)


	If (AF_redirectPage <> "") Then
		If (InStr(1, AF_redirectPage, "?", vbTextCompare) = 0 And UploadQueryString <> "") Then
			AF_redirectPage = AF_redirectPage & "?" & UploadQueryString
		End If
		
		'Reload na tela de baixo apos inserção com fechamento da pop-up
			with response
			%>
			<script>
			alert('Imagen Atualizada Com Sucesso!');
			window.opener.location.href='Alt_imagens.asp?codigo=<%=replace(request.QueryString("cod_imovel"),"""","")%>';
			window.close();
			</script>
			<%
			end with

		'Call Response.Redirect(AF_redirectPage)
	end if  
end if  
if UploadQueryString <> "" then
	UploadQueryString = UploadQueryString & "&AF_upload=true"
else  
	UploadQueryString = "AF_upload=true"
end if 

%>

<html>
<head>
<title>:: Edicao de Imagens Imoveis ::</title>

<script language=Javascript>
function totarquivos()
{
	window.location='upload_edit_img.asp?subdir=<%=request("subdir")%>&totarq='+event.srcElement.value;
}
</script>
<link rel="stylesheet" href="admin.css" type="text/css">
<STYLE TYPE="TEXT/CSS">
.{scrollbar-arrow-color:#000000;
  scrollbar-base-color:#777777;
  scrollbar-face-color:#CCCCCC;
  scrollbar-highlight-color:#FFFFFF;
  scrollbar-shadow-color:#999999;}
</STYLE>
<style>
.font { color: 000000; font-family: verdana, arial; font-size: 8pt; TEXT-DECORATION: none}
</style>
</head>
<body topmargin=0 leftmargin=0 marginwidth=0 marginheight=0>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table width="380" border="0" cellspacing="0" cellpadding="0">
				<tr background="imagens/top01diretorio.jpg"> 
					<td colspan=3 height=24 class=fontopajuda></td>
				</tr>
				<tr>
					<td width=7 background="imagens/top01ajuda.jpg"></td>
					<td width=367 height=120 class=font valign=bottom>
						<div id="Layer1" style="position:absolute; width:364px; height:100px; z-index:1; left: 10px; top: 23px; BACKGROUND-COLOR: #F4F4F4; layer-background-color: #F4F4F4; overflow:auto;"> 
						<br>
						<form name="form1" method="post" action='upload_edit_img.asp?AF_upload=true&codigo=<%=request.QueryString("codigo")%>&cod_img=<%=replace(request("cod_img"),"""","")%>&cod_imovel=<%=replace(request("cod_imovel"),"""","")%>' enctype="multipart/form-data">Total de arquivos a serem enviados: 
							<input type="hidden" name="tot_arquivos" value="1" style="background=#E8E8E8;">
							<br>
							<%if request("totarq")="" then
								totarq = 1
							Else
								totarq = cInt(request("totarq"))
							End IF
				
							For x=1 to totarq %>
								<input type="file" name="Files1" size="20" maxlength=50 label="Nome" style="width:290; height:17; background=#E8E8E8;">
								<br>
							<%Next%>
							<br>
							<input type="image" src="../img/ok.gif" value="submit" border=0>
						</form>
						</div>
						<table align="center" border="0" width="100%" bgcolor="#CCCCCC" cellspacing="0" cellpadding="0" class=font>
							<tr>
								<td height=1 bgcolor="#CCCCCC"></td>
							</tr>
							<tr>
								<td bgcolor="#F4F4F4" align=right><a href="javascript:window.close()"><img src="../img/gif-fechar.gif" border="0"></a></td>
							</tr>
							<tr>
								<td height=1 bgcolor="#CCCCCC"></td>
							</tr> 
						</table>
					</td>
					<td width=6 background="imagens/top02ajuda.jpg"></td>
				</tr>
				<tr>
					<td colspan=3 height=7 background="imagens/top03ajuda.jpg"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>

<%Set objeto=nothing%>