<%login=session("login")
senha=session("senha")
arquivo_inclusao="menu"
if login="" or senha="" then%>
   <script>location.href="main_inicio.asp"</script>
   <%response.end
else
   set Verificador=conn.execute("select * from administradores where login='"&login&"' and senha='"&senha&"'")
   if Verificador.eof then%>
      <script>location.href="main_inicio.asp"</script>
   <%end if
end if%>