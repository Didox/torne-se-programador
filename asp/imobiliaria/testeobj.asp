
<!--#INCLUDE FILE ="conexao.asp"-->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
teste obj em asp
<BR>

<%

set objCapturaCep = New CapturaCep
if request("cep") <> "" then
objCapturaCep.Cep = request("cep")
Response.Write objCapturaCep.retCep()

Response.Write objCapturaCep.getCep & "<br>"
Response.Write objCapturaCep.getEstado & "<br>"
Response.Write objCapturaCep.getNome_log & "<br>"
Response.Write objCapturaCep.getNome_bairro & "<br>"
Response.Write objCapturaCep.getNome_localidade & "<br>"



Set objCapturaCep = Nothing

end if
%>
</body>
</html>
