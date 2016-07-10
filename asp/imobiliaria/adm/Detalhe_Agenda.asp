<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
data  =request("data")
opcao =request("opcao")
box   =request("deletar")
ordem =request("ordem")
ordem2=request("ordem2")
tipo  =request("tipo")
if tipo="" or tipo=1 then
 label="dados"
 sql=""
end if
if tipo=2 then
  label="Visita" 
  sql=""
end if  
if tipo=3 then
  label="Acompanhamento" 
  sql=""
end if  

if box <> "" then
   conn.Execute ("update visita set status=1 where codigo IN ("&box&")")
end if
currentPage = Request( "currentPage" )
Set contador = Server.CreateObject( "ADODB.Recordset" )
contador.activeConnection = conn
contador.CursorType = adOpenStatic
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 9
if ordem="" then
   ordem="codigo"
end if
if tipo = 3 then
 itens.Open "select visita.codigo as codigo , corretor.nome as corretor ,visita.nome as nome , visita.hora_visita as hora, visita.data_visita as data, imoveis.descricao as imovel from ((visita inner join corretor on visita.cod_corretor = corretor.codigo) inner join imoveis on visita.cod_imovel=imoveis.codigo)  where visita.status=0 and data_visita=convert(datetime,'"&data&"',103)"&sql&sql1&" ORDER BY "&ordem&" "&ordem2,conn
else
 itens.Open "select acompanhamento.* ,acompanhamento.codigo as codigo, tipo_acompanhamento.descricao as tipo_acompanhamento, acompanhamento.cod_corretor as corretor, acompanhamento.cod_imovel as imovel from (((acompanhamento INNER JOIN Tipo_acompanhamento ON acompanhamento.cod_acompanhamento=tipo_acompanhamento.codigo)INNER JOIN imoveis ON imoveis.codigo=acompanhamento.cod_imovel)INNER JOIN corretor ON corretor.codigo=acompanhamento.cod_corretor) where acompanhamento.status=0 and acompanhamento.data=convert(datetime,'"&data&"',103) "&sql&" ORDER BY "&ordem&" "&ordem2,conn
end if
%>
<html>
<head>
<title>:::::IMOBI....:::</title>
<script language=javascript>
  function todos()
    {
      for (i=0; i<document.form2.length; i++)
         if (document.form2.selecionar.checked)
            document.form2.elements[i].checked = true;
         else
            document.form2.elements[i].checked = false;
    }
  function submeter()
    {
      document.form2.submit();
    }
  function limpar()
    {
      document.form3.reset();
    }
</script>
<link rel="stylesheet" href="estilo.css" type="text/css">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
          <table><tr><td></td></tr></table>
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
      <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_16.gif"></td>
              <td class="tb"><B>PAINEL DE CONTROLE AGENDA DO CORRETOR</B></td>
            </tr>
          </table>
<table bgcolor="#FFFFFF" border=0 width=588>
<form method="post" action="<%=request.servervariables("script_name")%>?ordem=<%=ordem%>&ordem2=<%=ordem2%>&data=<%=data%>" name="form1">
  <tr>
    <td valign=top>Compromisos para o dia: <b><%=data%><b></td>
    <td width=80 align=center>
      <% if itens.eof= false then %> 
         <%if tipo=2 or tipo="" then%>
         <a href="Imprimir_agenda_acompanhamento.asp?currentPage=<%=currentPage-1%>&ordem2=<%=ordem2%>&ordem=<%=ordem%>&data_acompanhamento=<%=data%>&opcao=<%=opcao%>&pagina=Detalhe_agenda"><img src="../img/icone-imprimir.gif" alt="Imprimir Acompanhamentos" border=0></a>
         <%else%>
         <a href="Imprimir_agenda_Visita.asp?currentPage=<%=currentPage-1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&data_visita=<%=data%>&opcao=<%=opcao%>&pagina=Detalhe_agenda"><img src="../img/icone-imprimir.gif" border=0 alt="Imprimir Visitas"></a>
         <%end if%>
      <%end if%>
    </td>
     <td width=80 align=center>
      <select name="tipo" class="texto" onchange="document.form1.submit()">
        <%if tipo=2 then%>
          <option value="2" selected>Acompanhamento
        <%else%>  
          <option value="2">Acompanhamento
         <%end if
          if tipo=3 then%>
            <option value="3" selected>Visita
          <%else%>
            <option value="3">Visita
          <%end if%>
      </select> 
     </td>
  </tr>
</form>
</table>
<table width=588 bgcolor="#FFFFFF" border=0>
<form method="post" action="<%=request.servervariables("script_name")%>?currentPage=<%=currentPage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&data=<%=data%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>" name="form2">
  <tr>
    <td valign=top width=100%>
      <table width=100%>
            <%If tipo=3 then%>
            <tr>
              <td bgcolor=#B0B0B0 width=20><input type="checkbox" name="selecionar" onclick="todos()"></td>
              <td bgcolor=#B0B0B0><font color=#FFFFFF><b>Corretor</b></td>
              <td bgcolor=#B0B0B0><font color=#FFFFFF><b>Imovel</b></td>
              <td bgcolor=#B0B0B0 align=center><font color=#FFFFFF><b>Visita</b></td>
              <td bgcolor=#B0B0B0 align=center><font color=#FFFFFF><b>Hora</b></td>
              <td align=center width=105 bgcolor=#B0B0B0><font color=#FFFFFF><b>Ações</b>
            </tr>
            <%else%>
            <tr>
              <td bgcolor=#B0B0B0 width=20><input type="checkbox" name="selecionar" onclick="todos()"></td>
              <td bgcolor=#B0B0B0><font color=#FFFFFF><b>Descrição</b></td>
              <td bgcolor=#B0B0B0><font color=#FFFFFF><b>Tipo do Acompanhamento</b></td>
              <td bgcolor=#B0B0B0 align=center><font color=#FFFFFF><b>Data de Vencimento</b></td>
              <td align=center width=105 bgcolor=#B0B0B0><font color=#FFFFFF><b>Ações</b>
            </tr>
            <%end if%>
            <%If tipo=3 then%>
            <%If itens.EOF = true then%>
               <tr>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8>Não há Registros cadastrados.</td>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8></td>
               </tr>  
            <%else
               itens.absolutePage = cINT(currentPage)
               do While Not itens.EOF and cont<itens.PageSize
                  if cor="DADAB5" then
                     cor="F4F2EA"
                  else
                     cor="DADAB5"
                  end if%> 
                  <tr>
                    <td bgcolor=<%=cor%> width=20><input type=checkbox  name="deletar" value="<%=itens("codigo")%>"></td>
                    <td class="tb" bgcolor=<%=cor%>><a href="Detalhe_Visita.asp?codigo=<%=itens("codigo")%>&currentPage=<%=currentPage-1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&pagina=Main_Visita"><%=itens("corretor")%></a></td>
                    <td class="tb" bgcolor=<%=cor%>><%=itens("imovel")%></td>
                    <td class="tb" align=center bgcolor=<%=cor%>><%=itens("data")%></td>
                    <td class="tb" align=center bgcolor=<%=cor%>><%=itens("hora")%></td>
                    <td bgcolor=<%=cor%> align=center>
                      <a href="javascript:submeter();javascript:confirma('<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&deletar=<%=itens("codigo")%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>')"><img src="../img/excluir_n.gif" alt="Excluir" border=0></a>
                      <a href="Alt_Visita.asp?codigo=<%=itens("codigo")%>&pagina=Main_Visita"><img src="../img/editar.gif" alt="Editar" border=0></a>
                    </td>
                  </tr>
                  <%cont=cont+1%>
                  <%itens.movenext%>
               <%loop%>
            <%end if%>
            <%else%>
            <%If itens.EOF = true then%>
               <tr>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8>Não há Registros cadastrados.</td>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8></td>
               </tr>  
            <%else
               itens.absolutePage = cINT(currentPage)
               do While Not itens.EOF and cont<itens.PageSize
                  if cor="DADAB5" then
                     cor="F4F2EA"
                  else
                     cor="DADAB5"
                  end if%> 
                  <tr>
                    <td bgcolor=<%=cor%> width=20><input type=checkbox  name="deletar" value="<%=itens("codigo")%>"></td>
                    <td class="tb" bgcolor=<%=cor%>><a href="detalhe_acompanhamento.asp?codigo=<%=itens("codigo")%>&pagina=Main_acompanhamento&corretor=<%=itens("corretor")%>&imovel=<%=itens("imovel")%>"><%=itens("descricao")%></a></td>
                    <td class="tb" bgcolor=<%=cor%>><%=itens("tipo_acompanhamento")%></td>
                    <td class="tb" bgcolor=<%=cor%> align=center><%=itens("data")%></td>
                    <td bgcolor=<%=cor%> align=center>
                      <a href="javascript:confirma('<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentpage%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&deletar=<%=itens("codigo")%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>')"><img src="../img/excluir_n.gif" alt="Excluir" border=0></a>
                      <a href="Alt_acompanhamento.asp?codigo=<%=itens("codigo")%>&pagina=Main_acompanhamento"><img src="../img/editar.gif" alt="Editar" border=0></a>
                    </td>
                  </tr>
                  <%cont=cont+1%>
                  <%itens.movenext%>
               <%loop%>
            <%end if%>
            <%end if%>
          </table>
    </td>
  </tr>
</form>
</table>
<table width="580" bordercolor=#DDDDDD border="1" cellspacing="0" cellpadding="0" align="center">
  <form method="post" action="<%=request.servervariables("script_name")%>?currentPage=<%=currentPage%>&data=<%=data%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>" name="form3">
    <tr>
      <td bgcolor="#F0F4F0" align=center>
        <b><a href="javascript:submeter()">Excluir Selecionados</a></b>
      </td>
      <td bgcolor="#F0F4F0" align=right>
       <%if tipo=3 then%>
        <input type="hidden" name="tipo" value="3">
        <select name="ordem" class="texto">
          <%if ordem="hora" then%>
             <option value="corretor.nome" selected>Corretor
          <%else%>
             <option value="corretor.nome">Corretor
          <%end if%>
          <%if ordem="descricao" then%>
             <option value="imoveis.descricao" selected>Imóvel
          <%else%>
             <option value="imoveis.descricao">Imóvel
          <%end if%>
          <%if ordem="descricao" then%>
             <option value="visita.hora_visita" selected>Hora
          <%else%>
             <option value="visita.hora_visita">Hora
          <%end if%>
        </select>
      <%else%>
        <input type="hidden" name="tipo" value="2">
        <select name="ordem" class="texto">
          <%if ordem="Data" then%>
             <option value="acompanhamento.data" selected>Data
          <%else%>
             <option value="acompanhamento.data">Data
          <%end if%>
          <%if ordem="descricao" then%>
             <option value="acompanhamento.descricao" selected>Descrição
          <%else%>
             <option value="acompanhamento.descricao">Descrição
          <%end if%>
          <%if ordem="descricao" then%>
             <option value="Tipo_acompanhamento.descricao" selected>Tipo
          <%else%>
             <option value="Tipo_acompanhamento.descricao">Tipo
          <%end if%>
        </select>  
      <%end if%>
        <%if ordem2<>"" then%>
           <input type="checkbox" name="ordem2" value="desc" checked>Decrescente
        <%else%>
           <input type="checkbox" name="ordem2" value="desc">Decrescente
        <%end if%>
        <input type=image src="../img/pop_ok.gif" value="submit">
      </td>
      </form>
    </tr>
    </form>
 </table>
<br>
<table align=center>
  <tr>
    <td valign=top>
      <%if cINT(currentPage)>1 then%>
         <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage-1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&data=<%=data%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>"><img src="../icones/anterior.gif" border=0></a>
      <%else%>
         <img src="../img/anterior.gif">
      <%end if%>
    </td>
    <td valign=top> 
      <%if itens.PageCount>10 then
         if itens.PageCount-currentPage<10 then
            if cint(currentpage)<=cint(itens.PageCount-5) then
               i=currentpage
               x=currentPage+9
            else
               i=itens.PageCount-4
               x=itens.PageCount+5
            end if
         else
            if currentpage>5 then
               i=currentPage+1
               x=currentPage+10
            else
               i=6
               x=15
            end if
         end if
      else
         i=6
         x=itens.PageCount+5
      end if
      For i = i-5 to x-5
         if i<10 then
           h=0
         else
           h=""
         end if
         If i = cINT( currentPage ) THEN%>
            [ <b><%=h&i%></b> ]
         <%ELSE%>
            [ <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=h&i%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&data=<%=data%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>"><%=h&i%></a> ]
         <%END IF
      Next%>
    </td>
    <td valign=top>
      <%if cINT(currentPage)<itens.PageCount then%>
         <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage+1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&data=<%=data%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>"><img src="../icones/proxima.gif" border=0></a>
      <%else%>
         <img src="../img/proxima.gif">
      <%end if%>
    </td>
  </tr>
</table>
</td></tr></table>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>  
</td></tr></table>
</body>
</html>

