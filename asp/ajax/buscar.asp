<%
set conexao = server.CreateObject("ADODB.Connection")
conexao.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Inetpub\wwwroot\ajax\Banco.mdb;Persist Security Info=False"
'response.Write("insert into tabela(  nome, email ) values( '"&request("nome")&"','"&request("email")&"' )")

'set rs = server.CreateObject("ADODB.recordset")
'set rs = conexao.execute( "select * from tabela where nome like'%"&request("nome")&"%'" )


	
	'CONEXAO COM PAGINACAO
	Set rs = Server.CreateObject("AdoDb.RecordSet")
	if request("id")<> "" then
	    rs.open "select * from tabela where id ="&request("id")&"", conexao, 3, 3
	    vs = "s"
	else
	    rs.open "select * from tabela where nome like'%"&request("nome")&"%'", conexao, 3, 3
	    vs="n"
	end if
	
	if not rs.eof then 
		num_registro = 200
		rs.PageSize = num_registro
		rs.CacheSize = num_registro
		tamanho = rs.PageSize
	else
		tamanho = 0			
	end if
		
	pagina = request("pagina")
	'CONFIGURACAO
	If rs.EOF And rs.BOF Then
		n_registro = 0
		pagina = 1
		maxpage = 1
	Else
		n_registro = rs.RecordCount
		maxpage = rs.PageCount
		if (IsNumeric(pagina) and not IsEmpty(pagina)) then
			pagina = CDbl(pagina)
			if (pagina > maxpage) then
				rs.AbsolutePage = maxpage
				pagina = maxpage
			elseif (pagina >= 1) then
				rs.AbsolutePage = pagina
			else
				rs.AbsolutePage = 1
				pagina = 1
			end if
		else
			rs.AbsolutePage = 1
			pagina = 1
		end if
	End If





Dim xmlDoc, rootEl, child1, child2, p
Set xmlDoc = Server.CreateObject("Microsoft.XMLDOM")
Set rootEl = xmlDoc.createElement("princ")
Set s = xmlDoc.createElement("s")
rootEl.appendChild s
xmlDoc.appendChild rootEl

For Cont = 1 to  tamanho
	Set id = xmlDoc.createElement("id")
	rootEl.appendChild id	
	Set nome = xmlDoc.createElement("nome")
	rootEl.appendChild nome	
	Set email = xmlDoc.createElement("email")	
	rootEl.appendChild email
	Set excluir = xmlDoc.createElement("excluir")
	rootEl.appendChild excluir
	Set alterar = xmlDoc.createElement("alterar")
	rootEl.appendChild alterar	
	
	response.Write( rs("id") )
	
	id.Text =  rs("id")
	if rs("nome") <> "" then
		nome.Text =  rs("nome")
	else
		nome.Text = "-"
	end if
	
	if rs("email") <> "" then
		email.Text =  rs("email")
	else
		email.Text = "-"
	end if	
	excluir.Text =  "<a href=# onclick=""javascript:if( confirm( 'Confirma exclusão' ) )excluir('cadastrar.asp','"&rs("id")&"')""> X </a>&nbsp; "
	response.Write excluir.Text 
	
	alterar.Text =  "<a href=# onclick=""buscaalt('buscar.asp','"&rs("id")&"','nome','email')""> Alt </a>&nbsp; "
	response.Write alterar.Text
   
rs.MoveNext
if rs.eof then exit for
next

s.Text =  vs	
response.Write vs & "<br>"
Set pag = xmlDoc.createElement("pag")
rootEl.appendChild pag	
	
maxpage  = maxpage
For n=1 to maxpage
	If trim(n) = trim(request("pagina")) or n=1 and trim(request("pagina"))="0" and trim(request("pagina"))="" then 
		pag.Text = pag.Text & "<b>" &n & "</b> &nbsp;"
	Else 
		pag.Text = pag.Text & "<a href=# onclick=javascript:Buscar('buscar.asp','bnome','grid','pag','"&n&"')>"&n&"</a>&nbsp; "		
	End If 
Next 
response.Write(pag.Text)
Set p=xmlDoc.createProcessingInstruction("xml","version='1.0'")
xmlDoc.insertBefore p,xmlDoc.childNodes(0)
'response.Write server.mappath("test.xml")
xmlDoc.Save server.mappath("busca.xml")



rs.close
set rs = nothing
%>