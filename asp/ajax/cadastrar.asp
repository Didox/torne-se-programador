<%
set conexao = server.CreateObject("ADODB.Connection")
conexao.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Inetpub\wwwroot\ajax\Banco.mdb;Persist Security Info=False"
'response.Write("insert into tabela(  nome, email ) values( '"&request("nome")&"','"&request("email")&"' )")
if request("id") <> "" and request("excluir")="ok" then
	conexao.execute( "delete * from  tabela where id = "&request("id")&"" )
	status = 2
elseif request("id") <> "" and request("alterar")="ok"  then
	conexao.execute( "update tabela set nome='"&request("nome")&"', email='"&request("email")&"' where id = "&request("id")&"" )
	status = 3
else
	conexao.execute( "insert into tabela(  nome, email ) values( '"&request("nome")&"','"&request("email")&"' )" )
	status = 1	
end if

Dim xmlDoc, rootEl, child1, child2, p
Set xmlDoc = Server.CreateObject("Microsoft.XMLDOM")
Set rootEl = xmlDoc.createElement("root")

xmlDoc.appendChild rootEl

Set Salve = xmlDoc.createElement("Salve")
rootEl.appendChild Salve

Salve.Text =  status

Set p=xmlDoc.createProcessingInstruction("xml","version='1.0'")
xmlDoc.insertBefore p,xmlDoc.childNodes(0)
'response.Write server.mappath("test.xml")
xmlDoc.Save server.mappath("test.xml")
%>