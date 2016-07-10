// Vars /////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////


// Functions ////////////////////////////////////////////////////////////////

function SearchServices( idForm ){
	iframe = "<iframe src=\"controls/searchServices.aspx?idForm=" + idForm + "&idFolder=" + idFolder + "\" frameborder=0 width=100% height=100 ></iframe>"
	getLayerAlpha( iframe )
}

function AddService( idForm ){
	iframe = "<iframe src=\"controls/formServices.aspx?idForm=" + idForm + "&idFolder=" + idFolder + "\" frameborder=0 width=100% height=100 ></iframe>"
	getLayerAlpha( iframe )
}

function EditService( idItemForm, idUserC,idForm ){
	if( event ) exceptionsGlobal = event.srcElement.parentNode.exceptions
	if( exceptionsGlobal == "false" ){
		if( idUserC != top.idUser && ! userAdmGlobal ){
			alert( "Usuario nao tem permissao para alterar este item" )
			return
		}
	}
	
	iframe = "<iframe src=\"controls/formServices.aspx?idItemForm=" + idItemForm + "&idForm=" + idForm + "&idFolder=" + idFolder + "\" frameborder=0 width=100% height=100 ></iframe>"
	getLayerAlpha( iframe )
}

/////////////////////////////////////////////////////////////////////////////

// Actions Document /////////////////////////////////////////////////////////
//document.onmousedown = hideLoading
//document.oncontextmenu	= new Function ("return false");
//document.onkeydown = keysFunctions

//if( window.addEventListener ) window.addEventListener( "load", function() { createLoading()	}, false )
//else if( window.attachEvent ) window.attachEvent( "onload", function() { createLoading() } )	
/////////////////////////////////////////////////////////////////////////////