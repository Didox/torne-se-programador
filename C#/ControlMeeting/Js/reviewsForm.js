// Vars /////////////////////////////////////////////////////////////////////
var idReview = 0
var imgGlobal = null 
var trDeleteGlobal = null

/////////////////////////////////////////////////////////////////////////////


// Functions ////////////////////////////////////////////////////////////////

function openReviewsForm( idItemForm, idForm, field, display ){
	if( event ) imgGlobal = event.srcElement
	else imgGlobal = document.getElementById("imgReviews"+idItemForm+"-"+idForm)
	userOn("openReviewsLogin("+idItemForm+","+idForm+",'"+field+"','"+display+"')")
}

function EditReview( idReview,idUserC,idItemForm, idForm ){
	if( idUserC != top.idUser && ! userAdmGlobal ){
		alert( "Usuario nao tem permissao para altera este Comentário" )
		return
	}
	iframe = "<iframe src=\"controls/AddReviewsForm.aspx?idItemForm="+idItemForm+"&idForm="+idForm+"&idReview="+idReview+"\" frameborder=0 width=100% height=100 ></iframe>"
	getLayerAlpha( iframe )
}

function previewReview(idReview,idItemForm, idForm){
	var obj = document.getElementById( "hidReview"+idReview+"-"+idItemForm+"-"+idForm )
	if( ! obj || obj.value == "" ) return
	
	createIframeDiv()
	var divAss = document.createElement( "div" )
	divAss.id = "DivPreview"
	divAss.style.position = "absolute"
	divAss.style.border = "1px solid #c0c0c0"
	divAss.style.width = document.body.offsetWidth - 21
	divAss.style.height = document.getElementById( "tbGeral" ).offsetHeight
	divAss.style.left = 0
	divAss.style.top = 0
	
	var table = "<TABLE WIDTH=\"100%\" height=\"" + document.body.offsetHeight + "\" border=0 CELLSPACING=\"0\" CELLPADDING=\"0\">"

	table += "<TR>"
	table += "<TD colspan=3 height=\"20\" align=center bgcolor=\"#704825\" style=\"filter:alpha(opacity=50)\" >"	
	table += "&nbsp;</TD>"
	table += "</TR>"
	table += "<TR>"
	table += "<TD width=30% bgcolor=\"#704825\" style=\"filter:alpha(opacity=50)\">&nbsp;</td>"	
	table += "<TD width=40% height=\"" + ( document.body.offsetHeight - 50 ) + "\" align=\"center\" valign=\"top\" bgcolor=\"#ffffff\">"	
	table += "<TABLE WIDTH=\"" + ( document.body.offsetWidth - 100 ) + "\" bgcolor=\"#ffffff\" height=\"100%\" BORDER=\"2\" bordercolor=\"#000000\" CELLSPACING=\"2\" CELLPADDING=\"2\" >"
	table += "	<TR>"
	table += "		<TD height=\"25\" align=center >"
	table += "			<table><tr><td><a class=\"aBlack\" href=\"javascript:closePreview()\"> <img src=\"imagens/fechar.gif\" border=0 ></a></td><td><a class=\"aBlack\" href=\"javascript:closePreview()\">Fechar</a></td><td>&nbsp;&nbsp;&nbsp;<a class=\"aBlack\" href=\"javascript:self.print()\"><img src=\"imagens/print.gif\" border=0 ></a></td><td> <a class=\"aBlack\" href=\"javascript:self.print()\">Imprimir</a></td></tr></table>"	
	table += "		</TD>"
	table += "	</TR>"
	table += "	<TR>"
	table += "		<TD valign=\"top\" >"
	table += "			<div style=\"OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%\">"
	table += "			<TABLE ondblclick=\"closePreview()\" bgcolor=\"#ffffff\" WIDTH=\"100%\" height=\"100%\" align=\"center\" BORDER=\"0\" CELLSPACING=\"0\" CELLPADDING=\"0\" >"
	table += "				<TR>"
	table += "					<TD align=\"left\" valign=\"top\">"
	table += "						" + obj.value
	table += "					</TD>"
	table += "				</TR>"
	table += "			</TABLE>"
	table += "			</div>"
	table += "		</TD>"
	table += "	</TR>"
	table += "</TABLE>"	
	table += "</TD>"	
	table += "<TD width=30% bgcolor=\"#704825\" style=\"filter:alpha(opacity=50)\">&nbsp;</TD>"	
	table += "</TR>"
	table += "<TR>"
	table += "<TD colspan=3 height=\"20\"  bgcolor=\"#704825\" style=\"filter:alpha(opacity=50)\"  >&nbsp;</TD>"
	table += "</TR>"
	table += "</TABLE>"
	
	divAss.innerHTML = table
	document.body.appendChild( divAss )
}

function newReview(idItemForm, idForm){
	iframe = "<iframe src=\"controls/AddReviewsForm.aspx?idItemForm="+idItemForm+"&idForm="+idForm+"\" frameborder=0 width=100% height=100 ></iframe>"
	getLayerAlpha( iframe )
}

function deleteReview(idReview, idUserC, idItemForm, idForm ){
	userOn("deleteReviewLogin( "+idReview+","+idUserC+","+idItemForm+","+idForm+" )")
}

function deleteReviewLogin(idReview, idUserC, idItemForm, idForm ){
	if( idUserC != top.idUser && ! userAdmGlobal ){
		alert( "Usuario nao tem permissao para excluir este Comentário" )
		return
	}
	else if( confirm( "Confirma a exclusao do Comentário?" ) ){
		var url = "Ajax/AjaxReviewsForm.aspx?idReview=" + idReview + "&idItemForm=" + idItemForm + "&idForm=" + idForm
		var objAjax = new Ajax()
		objAjax.Send(url , "GET", true, callback );
		
		function callback(){
			if( objAjax.Loading() ) createLoading()
			if( objAjax.Loadeds() ){
				if( objAjax.GetLength("return") <=0 )
					alert( "erro ao excluir Comentários" )
				else trDeleteGlobal.parentNode.removeChild(trDeleteGlobal)
			}
			hideLoading();
		}
	}
}

function createMenuReview(idReview, idItemForm, idForm, idUserC ){
	trDeleteGlobal = event.srcElement.parentNode
	createMenuReviewParan( idReview, idItemForm, idForm, idUserC, 0 )
}

function createMenuReviewInsert(idItemForm, idForm ){
	createMenuReviewParan( 0, idItemForm, idForm, 0, 1, null )
}

function createMenuReviewParan( idReview, idItemForm, idForm, idUserC, paran ){
	if( event.button == 2 ){
		var divMenu = document.getElementById( "divMenuFolder" )			
		var pos		= document.body.scrollTop + event.clientY;
		var posL	= document.body.scrollLeft + event.clientX;
		var table	= document.createElement( "table" )	
		var tbody	= document.createElement( "tbody" )	
		var tr		= document.createElement( "tr" )	
		var td		= document.createElement( "td" )	
		
		table.appendChild( tbody )
		tbody.appendChild( tr )
		tr.appendChild( td )
		
		table.width = "100%"
		table.CELLSPACING="2"
		table.CELLPADDING="2"
		table.border = 1
								
		td.align = "center"		
		td.valign = "top"
	
		var htm =	"<TABLE  BORDER=\"0\" height=\"35\" width=\"100%\" CELLSPACING=\"0\" CELLPADDING=\"0\">"+
					"	<TR>"+
					"		<TD valign=top >"+
					"			<TABLE  BORDER=\"1\" bordercolor=\"#ffffff\" width=\"100%\" bgcolor=\"#f6f6f6\" CELLSPACING=\"2\" CELLPADDING=\"0\">";

		if( paran == 1 ){
						
			htm +=	"<TR  >"+
					"	<TD>"+
					"		<img src=\"imagens/addComent.gif\">"+
					"	</TD>"+
					"	<TD nowrap=true >"+
					"		<a href=\"javascript:newReview("+idItemForm+", "+idForm+")\">Adicionar Comentario</>"+
					"	</TD>"+
					"</TR>";
		}
		else {
			htm += "<TR>"+
					"	<TD>"+
					"		<img src=\"imagens/lupa.jpg\">"+
					"	</TD>"+
					"	<TD>"+
					"		<a href=\"javascript:previewReview("+idReview+","+idItemForm+", "+idForm+")\">Visualizar</a>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"		<img src=\"imagens/addComent.gif\">"+
					"	</TD>"+
					"	<TD>"+
					"		<a href=\"javascript:newReview("+idItemForm+", "+idForm+")\">Adicionar</>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"		<img src=\"imagens/EditarItem.jpg\">"+
					"	</TD>"+
					"	<TD>"+
					"		<a href=\"javascript:EditReview("+idReview+", "+idUserC+","+idItemForm+", "+idForm+")\">Editar</a>"+
					"	</TD>"+
					"</TR>"+
					"<TR>"+
					"	<TD>"+
					"		<img src=\"imagens/delete.gif\">"+
					"	</TD>"+
					"	<TD>"+
					"		<a href=\"javascript:deleteReview("+idReview+", "+idUserC+","+idItemForm+", "+idForm+" )\">Excluir</a>"+
					"	</TD>"+
					"</TR>";
		}
				
		htm +=	"			</TABLE>";		
				"		</TD>"+	
				"	</TR>"+
				"</TABLE>";	
						
		td.innerHTML = htm
											
		removeMenuTimer()
		divMenu = document.createElement( "div" )
		
		divMenu.style.position = "absolute"
		divMenu.style.border = "1px solid #c0c0c0"
		divMenu.style.width = 150
		divMenu.style.left = posL
		divMenu.style.top = pos
		divMenu.style.background = "#ffffff"
		divMenu.style.filter = "alpha(opacity=90)"	
		divMenu.innerHTML = "";
		divMenu.appendChild( table )
		divMenu.id = "divMenu"
				
		document.body.appendChild( divMenu )		
	}
	else previewReview(idReview,idItemForm, idForm)
}

function openReviewsLogin( idItemForm, idForm, field, display ){
	var review = document.getElementById("itemFormReview" + idItemForm + "-" + idForm )
	if( display == "" ) display = review.style.display
	if( display == "none" ){
		review.style.display = "block"		
		imgGlobal.src = "imagens/setMBaixo.gif"
		
		var tdHTML = imgGlobal.parentNode.parentNode.nextSibling.firstChild.nextSibling.nextSibling
		getReviews( idItemForm, idForm, tdHTML, field )
	}
	else{
		review.style.display = "none"
		imgGlobal.src = "imagens/setMCima.gif"
		
		var tdHTML = imgGlobal.parentNode.parentNode.nextSibling.firstChild.nextSibling.nextSibling
		closeReviews( tdHTML )
	}
}

function getReviews( idItemForm, idForm, tdHTML, field ){
	var url = "Ajax/AjaxReviewsForm.aspx?idItemForm=" + idItemForm + "&idForm=" + idForm + "&field=" + field
	var objAjax = new Ajax()
	objAjax.Send(url , "GET", true, callback );
	
	function callback(){
		if( objAjax.Loading() ) createLoading()
		if( objAjax.Loadeds() ){
			if( objAjax.GetLength("htm") <=0 )
				alert( "erro ao carregar Comentários" )
			else{
				tdHTML.innerHTML = objAjax.Get("htm",0)
			}
		}
		hideLoading();
	}
}

function closeReviews( trHTML ){
	trHTML.innerHTML = "<img width=\"10\" height=\"10\" src=\"imagens/26-1.gif\"> Carregando...</nobr>"
}

/////////////////////////////////////////////////////////////////////////////

// Actions Document /////////////////////////////////////////////////////////
//document.onmousedown = hideLoading

//if( window.addEventListener ) window.addEventListener( "load", function() { createLoading()	}, false )
//else if( window.attachEvent ) window.attachEvent( "onload", function() { createLoading() } )	
/////////////////////////////////////////////////////////////////////////////