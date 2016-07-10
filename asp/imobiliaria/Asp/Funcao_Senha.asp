<%
login = session("login")
senha = session("senha")
tipo_login = session("tipo_login")
tipo = session("tipo")
verificador = session("cod")
arquivo_inclusao="menu"
if login<>"" or senha<>"" then
    if tipo_login="1" then
       set Verificador=conn.execute("select * from corretor where login='"&login&"' and senha='"&senha&"'")
       tipo="1"%>
    <%end if
    if tipo_login="2" then
       set Verificador=conn.execute("select * from clientes where login='"&login&"' and senha='"&senha&"'")
       tipo="2"%>
    <%end if
end if%>
