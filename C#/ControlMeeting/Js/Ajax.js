
Ajax = function(){
	if( window.XMLHttpRequest )
		this.xmlHttp = new XMLHttpRequest()
	else if (window.ActiveXObject)
		this.xmlHttp = new ActiveXObject("Microsoft.XMLHTTP")
	else if (window.ActiveXObject){
		try{
			this.xmlHttp = new ActiveXObject("Msxml2.xmlHttp");
		}catch(e){
			try{
				this.xmlHttp = new ActiveXObject("Microsoft.xmlHttp");
			}catch(E){
				this.xmlHttp = false;
			}
		}		
	}
}

Ajax.prototype.Create = function() {	
	try{
		this.xmlHttp = new xmlHttpRequest();			
	}catch(ee){
		try{
			this.xmlHttp = new ActiveXObject("Msxml2.xmlHttp");

		}catch(e){
			try{
				this.xmlHttp = new ActiveXObject("Microsoft.xmlHttp");
			}catch(E){
				this.xmlHttp = false;
			}
		}
	}
	return true;		
}

Ajax.prototype.Loadeds = function() {
	return (this.xmlHttp.readyState == 4);
}

Ajax.prototype.Loading = function() {
	estadoAtual = this.xmlHttp.readyState;
	return (estadoAtual && (estadoAtual < 4));
}

Ajax.prototype.Process = function() {
	if (this.xmlHttp.readyState == 4 && this.xmlHttp.status == 200) {
		return true;
	}
}

Ajax.prototype.GetLength = function( field, index ){
	if( this.xmlHttp )
		return this.xmlHttp.responseXML.getElementsByTagName(field).length;
	else
		return 0;
}

Ajax.prototype.Get = function( field, index ){
	if( this.xmlHttp ){
		try{
			return this.xmlHttp.responseXML.getElementsByTagName(field)[index].firstChild.nodeValue
		}catch(e){ return null; }
	}
	else return null;
}

Ajax.prototype.Send = function(url, metodo, modo, calbreak ) {
	if (!this.xmlHttp) this.Create();
	if (!this.Loading()) {			
		if(metodo == "GET") {
			this.xmlHttp.open("GET", url, modo);
			this.xmlHttp.onreadystatechange = calbreak;
			this.xmlHttp.send(null);								
		}else {        
			this.xmlHttp.open("POST", url, modo);
			this.xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			this.xmlHttp.setRequestHeader("Cache-Control", "no-store, no-cache, must-revalidate");
			this.xmlHttp.setRequestHeader("Cache-Control", "post-check=0, pre-check=0");
			this.xmlHttp.setRequestHeader("Pragma", "no-cache");
			this.xmlHttp.onreadystatechange = calbreak;
			alert( url )
			this.xmlHttp.send(url);
		}    
		return this.xmlHttp;
	}
	return null;
}