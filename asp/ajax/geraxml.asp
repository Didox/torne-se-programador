<%
Dim xmlDoc, rootEl, child1, child2, p
Set xmlDoc = Server.CreateObject("Microsoft.XMLDOM")
Set rootEl = xmlDoc.createElement("root")
xmlDoc.appendChild rootEl

Set xmlTo = xmlDoc.createElement("to")
Set xmlFrom = xmlDoc.createElement("from")
Set xmlBody = xmlDoc.createElement("body")

rootEl.appendChild xmlTo
rootEl.appendChild xmlFrom
rootEl.appendChild xmlBody

xmlTo.Text = xmlTo.Text & " <OBJECT classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0' WIDTH=780 HEIGHT=90>"
xmlTo.Text = xmlTo.Text & "    <PARAM NAME=movie VALUE='http://www.bigsolutions.com.br/home/imagens/imagens/topo_din5d.swf'>"
xmlTo.Text = xmlTo.Text & "    <PARAM NAME=loop VALUE=false>"
xmlTo.Text = xmlTo.Text & "    <PARAM NAME=menu VALUE=false>"
xmlTo.Text = xmlTo.Text & "    <PARAM NAME=quality VALUE=high>"
xmlTo.Text = xmlTo.Text & "    <EMBED src='http://www.bigsolutions.com.br/home/imagens/topo_din5d.swf' loop=false menu=false quality=high WIDTH=780 HEIGHT=90 TYPE='application/x-shockwave-flash' PLUGINSPAGE='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash'>"
xmlTo.Text = xmlTo.Text & "    </EMBED> "
xmlTo.Text = xmlTo.Text & "</OBJECT> "

xmlFrom.Text = xmlFrom.Text & "	 HOME <br>"
xmlFrom.Text = xmlFrom.Text & "     <a href=# onclick=javascript:loadXMLDoc('geraxml.asp?troca=ok');> PRODUTOS SBS </a> <br>"
xmlFrom.Text = xmlFrom.Text & "     SOLUÇÕES PARA WEB <br>"
xmlFrom.Text = xmlFrom.Text & "     VENDA DE SOFTWARE  <br>"
xmlFrom.Text = xmlFrom.Text & "     <a href=# onclick=javascript:loadXMLDoc('geraxml.asp');>DIVULGUE SEU SITE</a>   <br>"
xmlFrom.Text = xmlFrom.Text & "     CLIENTES  <br>"
xmlFrom.Text = xmlFrom.Text & "     PARCEIROS  <br>"
xmlFrom.Text = xmlFrom.Text & "     SUPORTE AO CLIENTE  <br>"
xmlFrom.Text = xmlFrom.Text & "     CONTATO  <br>"

 
if  Request("troca") = "ok" then 
	xmlBody.Text = xmlBody.Text & "Presidente durante visita à periferia de Manaus<br>"
	 
	xmlBody.Text = xmlBody.Text & "O presidente Luiz Inácio Lula da Silva (PT) seria reeleito no primeiro turno se as eleições fossem realizadas hoje em qualquer cenário, segundo pesquisa do Ibope divulgada nesta quinta-feira (1/6). O presidente atinge entre 62% e 63% dos votos válidos no primeiro turno, o que lhe garantiria, em tese, uma votação superior a que ele obteve no segundo turno em 2002, quando ficou com 61,3% dos votos válidos.<br>"

	xmlBody.Text = xmlBody.Text & "De acordo com a pesquisa, Lula tem 48% dos votos e supera a soma das intenções de voto de todos os adversários, que chega a 29% no cenário sem candidato do PMDB, considerado o mais provável. Brancos e nulos somam 14% do eleitorado. Indecisos são 9%. Os 48% de Lula, neste caso, equivalem a 63% dos votos válidos.<br>"

	xmlBody.Text = xmlBody.Text & "Atrás de Lula, pela ordem, aparecem o pré-candidato do PSDB, Geraldo Alckmin, com 19%, Heloísa Helena (PSOL), com 6%, Enéas (Prona), 2%, Cristovam Buarque (PDT), com 1%, e José Maria Eymael (PSDC), com 1%. <br>"

	xmlBody.Text = xmlBody.Text & "Na hipótese em que o PMDB lança o senador gaúcho Pedro Simon, Lula também fica com 48% dos votos. Neste caso, o índice do presidente equivale a 62% dos votos válidos. <br>"

	xmlBody.Text = xmlBody.Text & "A seguir, aparecem Alckmin com 18%, Heloísa Helena com 5%, Enéas e Simon, com 2% cada. Neste cenário, o Ibope incluiu o nome de Roberto Freire (PPS), que ficou com 1%. Cristovam Buarque e José Maria Eymael tiveram menos de 1% da preferência. Brancos e nulos perfazem 13% do eleitorado. Indecisos chegam a 10%.<br>"

	xmlBody.Text = xmlBody.Text & "Lula também vence Alckmin em um eventual segundo turno. O presidente aparece com 53% da intenção de votos, e o ex-governador de São Paulo, com 31%.<br>"

	xmlBody.Text = xmlBody.Text & "O Ibope também mediu a avaliação do governo federal. 58% aprovam a gestão de Lula, enquanto 36% a rejeitam, e 7% não souberam responder. O governo é considerado ótimo por 7% dos entrevistados e bom por 31%. Segundo a pesquisa, 41% julgam o governo regular, 8% julgam ruim e 11%, péssimo. 1% não soube qualificá-lo.<br>"

	xmlBody.Text = xmlBody.Text & "Este é o primeiro levantamento do Ibope sem Anthony Garotinho ou Germano Rigotto como candidato do PMDB. Na peúltima pesquisa do instituto, que foi realizada nos dias 3 e 4 de março e tinha Garotinho como candidato, Lula aparecia com 43%, Alckmin com 19% e o ex-governador fluminense com 14%.<br>"

	xmlBody.Text = xmlBody.Text & "Encomendada pela Rede Globo, a pesquisa tem margem de erro de dois pontos percentuais para mais ou para menos. Foi realizada entre o último domingo e a última quarta-feira (de 28 a 31 de maio) e registrada no Tribunal Superior Eleitoral com o protocolo 7728/2006. Foram entrevistados 2.002 eleitores em todo o Brasil.<br>"

	xmlBody.Text = xmlBody.Text & "Na semana passada, pesquisas do Datafolha e do Instituto Sensus também apontaram a vitória de Lula no primeiro turno. O placar no Datafolha foi 45% para Lula e 22% para Alckmin. No Sensus, o presidente vence Alckmin por 42,7% a 20,3% (no cená<br>"
else
	xmlBody.Text = xmlBody.Text & "Presidente durante visita à periferia de Manaus<br>"
	 
	xmlBody.Text = xmlBody.Text & "O presidente Luiz Inácio Lula da Silva (PT) seria reeleito no primeiro turno se as eleições fossem realizadas hoje em qualquer cenário, segundo pesquisa do Ibope divulgada nesta quinta-feira (1/6). O presidente atinge entre 62% e 63% dos votos válidos no primeiro turno, o que lhe garantiria, em tese, uma votação superior a que ele obteve no segundo turno em 2002, quando ficou com 61,3% dos votos válidos.<br>"

	xmlBody.Text = xmlBody.Text & "De acordo com a pesquisa, Lula tem 48% dos votos e supera a soma das intenções de voto de todos os adversários, que chega a 29% no cenário sem candidato do PMDB, considerado o mais provável. Brancos e nulos somam 14% do eleitorado. Indecisos são 9%. Os 48% de Lula, neste caso, equivalem a 63% dos votos válidos.<br>"

	xmlBody.Text = xmlBody.Text & "Atrás de Lula, pela ordem, aparecem o pré-candidato do PSDB, Geraldo Alckmin, com 19%, Heloísa Helena (PSOL), com 6%, Enéas (Prona), 2%, Cristovam Buarque (PDT), com 1%, e José Maria Eymael (PSDC), com 1%. <br>"

	xmlBody.Text = xmlBody.Text & "Na hipótese em que o PMDB lança o senador gaúcho Pedro Simon, Lula também fica com 48% dos votos. Neste caso, o índice do presidente equivale a 62% dos votos válidos. <br>"

	xmlBody.Text = xmlBody.Text & "A seguir, aparecem Alckmin com 18%, Heloísa Helena com 5%, Enéas e Simon, com 2% cada. Neste cenário, o Ibope incluiu o nome de Roberto Freire (PPS), que ficou com 1%. Cristovam Buarque e José Maria Eymael tiveram menos de 1% da preferência. Brancos e nulos perfazem 13% do eleitorado. Indecisos chegam a 10%.<br>"
end if

'Set referencia = XMLDoc.createAttribute("referencia")
'referencia.Text = "teste"
'xmlTo.attributes.setNamedItem(referencia)

Set p=xmlDoc.createProcessingInstruction("xml","version='1.0'")
xmlDoc.insertBefore p,xmlDoc.childNodes(0)
'response.Write server.mappath("test.xml")
xmlDoc.Save server.mappath("test.xml")
%>