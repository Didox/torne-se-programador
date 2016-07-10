<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pesquisa=replace(trim(request("pesquisa")),"'","")
pagina=request("pagina") 
codigo=request("codigo")
codigo2=request("codigo2")
opcao=request("opcao")
box=request("deletar")
ordem=request("ordem")
ordem2=request("ordem2")
fiador=request("fiador")
if box <> "" then
   conn.Execute ("update contrato set status=1 where codigo IN ("&box&")")
end if
currentPage = Request( "currentPage" )
Set contador = Server.CreateObject( "ADODB.Recordset" )
contador.activeConnection = conn
contador.CursorType = adOpenStatic
IF currentPage = "" THEN currentPage = 1
Set itens = Server.CreateObject( "ADODB.Recordset" ) 
itens.activeConnection = conn
itens.CursorType = adOpenStatic  
itens.PageSize = 3
if ordem="" then
   ordem="contrato.numero"
end if
if pesquisa<>"" then
   if opcao="1" then
      sql="and contrato.numero like '%"&pesquisa&"%' "
   else
      sql="and imoveis.descricao like '%"&pesquisa&"%' "
   end if
end if
if session("tipo")<>"2" then
  if fiador="1" then
    itens.Open "SELECT contrato.*, contrato.codigo AS codigo, contrato.data_vencimento as vencimento, contrato.numero AS numero, imoveis.descricao AS imovel, clientes.nome AS nome, servico.descricao AS servico, contrato.status AS status FROM (((contrato INNER JOIN clientes ON contrato.cod_cliente = clientes.codigo) INNER JOIN imoveis ON contrato.cod_imovel = imoveis.codigo) INNER JOIN servico ON contrato.tipo_servico = servico.codigo) where cod_fiador1="&codigo&" and contrato.status=0 and cod_corretor="&codigo2&" "&sql&" ORDER BY "&ordem&" "&ordem2,conn
  else
    itens.Open "SELECT contrato.*, contrato.codigo AS codigo, contrato.data_vencimento as vencimento, contrato.numero AS numero, imoveis.descricao AS imovel, clientes.nome AS nome, servico.descricao AS servico, contrato.status AS status FROM (((contrato INNER JOIN clientes ON contrato.cod_cliente = clientes.codigo) INNER JOIN imoveis ON contrato.cod_imovel = imoveis.codigo) INNER JOIN servico ON contrato.tipo_servico = servico.codigo) where cod_fiador2="&codigo&" and contrato.status=0 and cod_corretor="&codigo2&" "&sql&" ORDER BY "&ordem&" "&ordem2,conn
  end if
else
  if fiador="1" then
    itens.Open "SELECT contrato.*, contrato.codigo AS codigo, contrato.data_vencimento as vencimento, contrato.numero AS numero, imoveis.descricao AS imovel, clientes.nome AS nome, servico.descricao AS servico, contrato.status AS status FROM (((contrato INNER JOIN clientes ON contrato.cod_cliente = clientes.codigo) INNER JOIN imoveis ON contrato.cod_imovel = imoveis.codigo) INNER JOIN servico ON contrato.tipo_servico = servico.codigo) where cod_fiador1="&codigo&" and contrato.status=0 and cod_cliente="&codigo2&" "&sql&" ORDER BY "&ordem&" "&ordem2,conn
  else
    response.write("SELECT contrato.*, contrato.codigo AS codigo, contrato.data_vencimento as vencimento, contrato.numero AS numero, imoveis.descricao AS imovel, clientes.nome AS nome, servico.descricao AS servico, contrato.status AS status FROM (((contrato INNER JOIN clientes ON contrato.cod_cliente = clientes.codigo) INNER JOIN imoveis ON contrato.cod_imovel = imoveis.codigo) INNER JOIN servico ON contrato.tipo_servico = servico.codigo) where cod_fiador2="&codigo&" and contrato.status=0 and cod_cliente="&codigo2&" "&sql&" ORDER BY "&ordem&" "&ordem2)
    itens.Open "SELECT contrato.*, contrato.codigo AS codigo, contrato.data_vencimento as vencimento, contrato.numero AS numero, imoveis.descricao AS imovel, clientes.nome AS nome, servico.descricao AS servico, contrato.status AS status FROM (((contrato INNER JOIN clientes ON contrato.cod_cliente = clientes.codigo) INNER JOIN imoveis ON contrato.cod_imovel = imoveis.codigo) INNER JOIN servico ON contrato.tipo_servico = servico.codigo) where cod_fiador2="&codigo&" and contrato.status=0 and cod_cliente="&codigo2&" "&sql&" ORDER BY "&ordem&" "&ordem2,conn
  end if
end if%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMAÇÃO LTDA">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <!--#INCLUDE FILE ="Main_Topo.asp"-->
          <table><tr><td></td></tr></table>
          <%set exibir=conn.execute("select * from fiador where codigo="&codigo)%>
          <table width=100% bgcolor=#CCCCCC>
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_11.gif"></td>
              <td class="tb">
                <B>DETALHE FIADOR</B>
              </td>
              <td class="tb" align=right>
                <a href="Imprimir_detalhe_fiador.asp?codigo=<%=exibir("codigo")%>&codigo2=<%=codigo2%>&pagina=Detalhe_fiador&fiador=<%=fiador%>"><img src="../img/icone-imprimir.gif" border=0></a>
              </td>
            </tr>
          </table>
          <table><tr height=10><td></td></tr></table>
          <table width=100% border=0 cellspacing="0" cellpadding="0">
            <tr>
              <td class="tb" width=60><b>&nbsp;NOME:</b></td>
              <td class="tb" colspan=3><%=exibir("nome")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;ENDEREÇO:</b></td>
              <td class="tb" colspan=3><%=exibir("endereco")%>&nbsp;-&nbsp; <%=exibir("numero")%> &nbsp;-&nbsp;<%=exibir("complemento")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;BAIRRO:</b></td>
              <td class="tb"><%=exibir("bairro")%></td>
              <td class="tb" width=60><b>&nbsp;CIDADE:</b></td>
              <td class="tb"><%=exibir("cidade")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;ESTADO:</b></td>
              <td class="tb"><%=exibir("estado")%></td>
              <td class="tb" width=60><b>&nbsp;CEP:</b></td>
              <td class="tb"><%=exibir("cep")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;TELEFONE:</b></td>
              <td class="tb">(<%=exibir("ddd_fone")%>)<%=exibir("fone")%></td>
              <td class="tb" width=60><b>&nbsp;CELULAR:</b></td>
              <td class="tb">(<%=exibir("ddd_cel")%>)<%=exibir("celular")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;CPF:</b></td>
              <td class="tb"><%=exibir("cpf")%></td>
              <td class="tb" width=60><b>&nbsp;RG:</b></td>
              <td class="tb"><%=exibir("identidade")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;E-MAIL:</b></td>
              <td class="tb" colspan=3><%=exibir("email")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;BANCO:</b></td>
              <%set banco=conn.execute("select * from bancos where codigo="&exibir("cod_banco"))%>
              <td class="tb"><%=banco("descricao")%></td>
              <td class="tb" width=60><b>&nbsp;AGÊNCIA:</b></td>
              <td class="tb"><%=exibir("agencia")%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;CONTA:</b></td>
              <td class="tb"><%=exibir("conta")%></td>
              <td class="tb" width=60><b>&nbsp;RENDA:</b></td>
              <td class="tb">R$ <%=formatnumber(exibir("renda"),2)%></td>
            </tr>
            <tr>
              <td class="tb" width=60><b>&nbsp;PROFISSÃO:</b></td>
              <td class="tb"><%=exibir("profissao")%></td>
              <td class="tb" width=105><b>&nbsp;DATA INCLUSÃO:</b></td>
              <td class="tb"><%=exibir("data_inclusao")%></td>
            </tr>
          </table>
          <br>
          <table width=100% bgcolor=#CCCCCC>
          <form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?currentPage=<%=currentPage%>&codigo=<%=codigo%>"name="form1">
            <tr><td></td></tr>
          </table>
          <table width=100% border=0 bgcolor=#E8E8E8 cellspacing="0" cellpadding="0">
            <tr> 
              <td width=20><img src="../img/r_8.gif"></td>
              <td class="tb"><B>CONTRATOS DO FIADOR</B></td>
            </tr>
          </table>  
          <table width=100%
            <tr height=25><td></td></tr>
            <tr>
              <td width=10><img src="../img/icon_mini_search.gif"></td>
              <td valign=top><input type=text name="pesquisa" value="<%=pesquisa%>" style="width:190; height:17; background=#E8E8E8;"></td>
              <td valign=top>
                <%if opcao="" or opcao="1" then%>
                   <input type=radio name="opcao" value=1 checked>Número
                <%else%>
                   <input type=radio name="opcao" value=1>Número
                <%end if%>
              </td>
              <td valign=top>
                <%if opcao="2" then%>
                   <input type=radio name="opcao" value=2 checked>Cliente
                <%else%>
                   <input type=radio name="opcao" value=2>Cliente
                <%end if%>
              </td>
              <td><input type=image src="../img/pop_ok.gif" alt="Resultado"></td>
              <td><a href="Main_filtro_contrato.asp?codigo=<%=codigo%>"><img alt="Filtrar Contratos" src="../img/filtro.gif" border=0></a></td>
            </tr>
            <tr height=5><td></td></tr>
          </table>

          <table width=100%>
            <tr>
              <td bgcolor=#B0B0B0 width=20><input type="checkbox" name="selecionar" onclick="todos()"></td>
              <td align=center bgcolor=#B0B0B0><font color=#FFFFFF><b>Contrato</b></td>
              <td width=105 bgcolor=#B0B0B0><font color=#FFFFFF><b>Imóvel</b></td>
              <td align=center width=100 bgcolor=#B0B0B0><font color=#FFFFFF><b>Serviço</b></td>
              <td align=center width=100 bgcolor=#B0B0B0><font color=#FFFFFF><b>Data de Vencimento</b></td>
              <td align=center width=105 bgcolor=#B0B0B0><font color=#FFFFFF><b>Ações</b>
            </tr>
            <tr><td width=4></td></tr>
             <%If itens.EOF = true then%>
               <tr>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8>Não há Registros cadastrados.</td>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8></td>
                 <td bgcolor=#D8DCD8></td>
               </tr>  
               <%else
               itens.absolutePage = cINT(currentPage)
               do While Not itens.EOF and cont<itens.PageSize
                  if cor="D8DCD8" then
                     cor="EFF0EF"
                  else
                     cor="D8DCD8"
                  end if%> 
                  <tr>
                    <td bgcolor=<%=cor%> width=20><input type=checkbox  name="deletar" value="<%=itens("codigo")%>"></td>
                    <td class="tb" align=center bgcolor=<%=cor%>><a href="Detalhe_contrato.asp?codigo=<%=itens("codigo")%>&pagina=Detalhe_fiador&codigo2=<%=codigo%>"><%=itens("numero")%></a></td>
                    <td class="tb" align=left bgcolor=<%=cor%>><%=itens("imovel")%></td>
                    <td class="tb" align=center bgcolor=<%=cor%>><%=itens("servico")%></td>
                    <td class="tb" align=center bgcolor=<%=cor%>><%=itens("vencimento")%></td>
                    <%if session("tipo")="1" then%>
                      <td bgcolor=<%=cor%> align=center>
                        <a href="Alt_comissao.asp?codigo=<%=itens("codigo")%>&codigo2=<%=codigo%>&pagina=Detalhe_Fiador"><img src="../img/comissao.gif" alt="Comissão" border=0></a>
                      </td>
                    <%else%>
                      <td bgcolor=<%=cor%> align=center>&nbsp;</td>
                    <%end if%>
                  </tr>
                  <%cont=cont+1%>
                  <%itens.movenext%>
               <%loop%>
            <%end if%>
          </table>
          <table width=100%>
            <tr> 
              <td align=center bgcolor=#B0B0B0>
                <a href="javascript:confirma('')"><font color=#FFFFFF><B>Excluir Selecionados</b></a>
              </td>
              <td bgcolor=#B0B0B0 align=right>
                <select name="ordem" class="texto">
                  <%if ordem="contrato.numero" then%>
                     <option value="contrato.numero" selected>Número
                  <%else%>
                     <option value="contrato.numero">Número
                  <%end if%>
                  <%if ordem="imoveis.descricao" then%>
                     <option value="imoveis.descricao" selected>Imóvel
                  <%else%>
                     <option value="imoveis.descricao">Imóvel
                  <%end if%>
                  <%if ordem="exibir.nome" then%>
                     <option value="exibir.nome" selected>Cliente
                  <%else%>
                     <option value="exibir.nome">Cliente
                  <%end if%>
                  <%if ordem="servico.descricao" then%>
                     <option value="servico.descricao" selected>Serviço
                  <%else%>
                     <option value="servico.descricao">Serviço
                  <%end if%>
                </select>
                <%if ordem2<>"" then%>
                   <input type="checkbox" name="ordem2" value="desc" checked>Decrescente
                <%else%>
                   <input type="checkbox" name="ordem2" value="desc">Decrescente
                <%end if%>
                <input type=image src="../img/pop_ok.gif" value="submit">
              </td>
            </tr>
          </table> 
          <table align=center>
            <tr>
              <td valign=top>
                <%if cINT(currentPage)>1 then%>
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage-1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&codigo=<%=codigo%>"><img src="../img/anterior.gif" border=0></a>
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
                      [ <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=h&i%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&contrario=<%=contrario%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&codigo=<%=codigo%>"><%=h&i%></a> ]
                   <%END IF
                Next%>
              </td>
              <td valign=top>
                <%if cINT(currentPage)<itens.PageCount then%>
                   <a href="<%=request.servervariables("SCRIPT_NaME")%>?currentPage=<%=currentPage+1%>&ordem=<%=ordem%>&ordem2=<%=ordem2%>&contrario=<%=contrario%>&pesquisa=<%=pesquisa%>&opcao=<%=opcao%>&codigo=<%=codigo%>"><img src="../img/proxima.gif" border=0></a>
                <%else%>
                   <img src="../img/proxima.gif">
                <%end if%>
              </td>
            </tr>
          </table>  
        </td>
      </tr>
      </form>
    </table>
    <table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>      
  </td>
</tr>
</table>
</body>
</html>