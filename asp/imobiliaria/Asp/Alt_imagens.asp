<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%

%>
<html>
<head>
<title>:::::www.plenanet.com.br:::</title>
<script language="javascript" src="formatacao.js"></script>
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
<link rel="stylesheet" href="estilo.css" type="text/css">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#F4F2EA" text="#333333" link="#333333" vlink="#333333" alink="#333333" >
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=Imoveis&codigo=<%=codigo%>&cliente=<%=cliente%>" name="form1">
<input type="hidden" name="reload">
<input type="hidden" name="excluir">
<table border="0" width="600" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <table border="0" align=left width=380 cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <br>
            <span span class="estilo">&nbsp;&nbsp;<b>Para alterar os dados do imóvel siga os passos descritos abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha todos os campos corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAtenção no preenchimento dos campos obrigatórios.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
          <br>
		    &nbsp;&nbsp;<a href="javascript:history.back(-1);"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
		  </td>
		  <td>
		  <tr>
		
		<td>
		
		</td>
		</tr>
		  </td>
        </tr>
        <tr>
          <td>
           </td>
        <tr>
          <td align=center>
          
          </td>
        </tr>
        </tr>
        </tr>   
      </table>
	   <table border="0" align=left width=380 cellspacing="0" cellpadding="0">
	   <tr>
	   			<td>
						<%
						codigo_imovel = request("codigo")
						
						strImg = "select * from registro_foto where cod_imovel =" & codigo_imovel
						
						set rsImg = conn.execute(strImg)
						
						if not rsImg.eof then
						while not rsImg.eof 
						%>
						
						<img src="../../imagens/fotos/<%=rsImg("arquivo")%>" value="enviar" border=0>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:ChamaUpload(<%=rsImg("codigo")%>,<%=codigo_imovel%>);"><img src="../img/add_wico.gif" value="enviar" border=0><br><br>
						<%
						rsImg.movenext
       					WEND
						else
						%>
						
						<%
						End if
						%>						
				</td>
	   </tr>	 
	   </table>
    </td>  
  </tr>
</table> 
<script language="javascript">
/*Chama a Rotina Upload de Edicao de Imagens*/
function ChamaUpload(cod_img,cod_imovel)
{
window.open('upload_edit_img.asp?cod_img="'+cod_img+'"&cod_imovel="'+cod_imovel+'"','Upload','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,menubar=no,width=380,height=151,left=1,top=1');
}
</script> 
</body>
</html>