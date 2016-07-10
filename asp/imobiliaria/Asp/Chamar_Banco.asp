<%
Session.LCID = 1046
Server.ScriptTimeout=999999999
set conn= server.createobject("adodb.connection")
'conn.Open "Driver={SQL SERVER};Server=bigapp01;Database=imobiliaria_plena;Uid=sa;PWD="
conn.Open "Driver={SQL SERVER};Server=200.170.214.123;Database=imobiliaria_plena;Uid=sa;PWD=bigbig"
%>