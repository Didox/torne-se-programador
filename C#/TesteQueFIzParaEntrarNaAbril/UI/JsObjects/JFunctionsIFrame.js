// Vars /////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

function Reload(){
    setTimeout("top.Reload()", 500);
    setTimeout("alert()", 500);
}

function HeightIframe(){
	var height = 0;
	var width = 0;
	var elen = document.getElementsByTagName( "form");	
	if( elen.length > 0 ){
		height = elen[0].offsetHeight
		width  = elen[0].offsetWidth
	}
		
	elen = document.getElementsByTagName( "table");	
	for( i=0; i<elen.length; i++ ){
		if( height < elen[i].offsetHeight )
			height = elen[i].offsetHeight
		if( width < elen[i].offsetWidth )
			width = elen[i].offsetWidth
	}

	height += 30
	var elenIfra = top.document.getElementsByTagName( "iframe");	
	if( elenIfra.length == 1 ){
		elenIfra[0].height = height
		elenIfra[0].width = width
	}
	else if( elenIfra.length == 2 ){
		elenIfra[1].height = height
		elenIfra[1].width = width
	}
}

function solucao(){
	var tbContent = document.getElementById( "tbContent" )
	tbContent.innerHTML = "<h3>Solução encontrada, clique <a href=\"javascript:void(0)\" onclick=\"top.window.location='../default.aspx'\" >aqui</a> para correção</h3>"
}

function Focus(){
	var elens = document.getElementsByTagName("input");	
	
	for( i=0; i<elens.length; i++ ){
		if( elens[i].type == "text" ){
			elens[i].focus()
			return
		}
	}	
	
	elens = document.getElementsByTagName("textarea");	
	for( i=0; i<elens.length; i++ ){
		elens[i].focus()
		return
	}
}


// Actions Document /////////////////////////////////////////////////////////
//document.oncontextmenu	= new Function ("return false");

if( window.addEventListener ) window.addEventListener( "load", function() { 
		try{					    
			top.HideLoading()
			HeightIframe()
			Focus()
		}catch(e){
		}
	}, false )
else if( window.attachEvent ) window.attachEvent( "onload", function() { 
		try{		    
		    top.HideLoading()
			HeightIframe()
			Focus()
		}catch(e){
		}
	} )	
/////////////////////////////////////////////////////////////////////////////