
/////////////////////////////////////////////////////////////////////////////

function createIframeDiv(){
	var divFrames = document.getElementById( "iframeAssDiv" )
	var form = document.getElementById( "Form1" )
	if( ! divFrames ){
		if( form ){
			var divFrame = document.createElement( "iframe" )
			divFrame.style.position = "absolute"
			divFrame.id = "iframeAssDiv"
			divFrame.frameborder = 0
			divFrame.style.width = document.body.offsetWidth - 5
			divFrame.style.height = document.body.offsetHeight - 5
			divFrame.style.left = 0
			divFrame.style.top = 0
			divFrame.style.filter = "alpha(opacity=0)"
			form.appendChild( divFrame )
		}
	}
}

function closeIframeDiv(){	
	var divFrame = document.getElementById( "iframeAssDiv" )
	var form = document.getElementById( "Form1" )
	if( divFrame ){
		if( form ){
			form.removeChild( divFrame )	
			delete divFrame
		}
	}
}

function heightIframe(){
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

	height += 8
	width  += 10
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

function setEventF5(){
	if( event.keyCode == 116 ) top.events = true
	else top.events = false
}

function focus(){
	var elens = document.getElementsByTagName( "input");	
	for( i=0; i<elens.length; i++ ){
		if( elens[i].type == "text" ){
			elens[i].focus()
			return
		}
	}
	
	elens = document.getElementsByTagName( "textarea");	
	for( i=0; i<elens.length; i++ ){
		elens[i].focus()
		return
	}
}


// Actions Document /////////////////////////////////////////////////////////
//document.onmousedown = hideLoading
//document.oncontextmenu	= new Function ("return false");
//document.onkeydown = new Function ("setEventF5()");

if( window.addEventListener ) window.addEventListener( "load", function() { 
		try{			
			top.hideLoading()
			heightIframe()
			AttributesCalendar()
			focus()
		}catch(e){
		}
	}, false )
else if( window.attachEvent ) window.attachEvent( "onload", function() { 
		try{
			top.hideLoading()
			heightIframe()
			AttributesCalendar()
			focus()
		}catch(e){
		}
	} )	
/////////////////////////////////////////////////////////////////////////////