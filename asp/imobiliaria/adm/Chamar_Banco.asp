<%Response.Buffer = false
Response.AddHeader "cache-control", "private"
Response.AddHeader "pragma", "no-cache"
Response.ExpiresAbsolute = #January 1, 1990 00:00:01#
Response.Expires=0
Session.LCID = 1046
Server.ScriptTimeout=999999999
set conn= server.createobject("adodb.connection")
'conn.Open "Driver={SQL SERVER};Server=bigapp01;Database=imobiliaria_plena;Uid=sa;PWD="
conn.Open "Driver={SQL SERVER};Server=200.170.214.123;Database=imobiliaria_plena;Uid=sa;PWD=bigbig"
%>