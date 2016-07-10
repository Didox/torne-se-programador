function Document(){
    function Document.prototype.CreateIframeDiv(){
	    var divFrames = document.getElementById( "iframeAssDiv" )
	    if( ! divFrames ){
		    var divFrame = document.createElement( "iframe" )
		    divFrame.style.position = "absolute"
		    divFrame.id = "iframeAssDiv"
		    divFrame.frameborder = 0
		    divFrame.style.width = document.body.offsetWidth - 21
		    divFrame.style.height = document.body.offsetHeight
		    divFrame.style.left = 0
		    divFrame.style.top = 0
		    divFrame.style.filter = "alpha(opacity=0)"
		    document.body.appendChild( divFrame )
	    }
    }

    function Document.prototype.CloseIframeDiv(){
	    var divFrame = document.getElementById( "iframeAssDiv" )
	    if( divFrame ){
		    document.body.removeChild( divFrame )	
		    delete divFrame
	    }
    }
    
    function Document.prototype.CloseLayerAlpha(){
	    var divs = document.getElementById( "LayerAlpha" )
	    if( divs ){
		    document.body.removeChild( divs )	
		    delete divs
	    }
	    new Document().CloseIframeDiv()
    }
    
    function Document.prototype.GetLayerAlpha( URL ){	
	    new Document().CloseLayerAlpha()
	    new Document().CreateIframeDiv()
	    
	    var divAss = document.createElement( "div" )
	    divAss.id = "LayerAlpha"
	    divAss.style.position = "absolute"
	    divAss.style.border = "1px solid #c0c0c0"
	    divAss.style.width = document.getElementById( "tbGeral" ).offsetWidth + 5
	    divAss.style.height = document.getElementById( "tbGeral" ).offsetHeight + 5
	    divAss.style.left = 0
	    divAss.style.top = 0
    	
	    var table = "<TABLE WIDTH=\"100%\" height=\"100%\" border=0 CELLSPACING=\"0\" CELLPADDING=\"0\">"
	    table += "<TR>"
	    table += "<TD colspan=3 height=50% align=center class=\"divAlfa\" style=\"filter:alpha(opacity=50)\"  >&nbsp;</TD>"
	    table += "</TR>"
	    table += "<TR>"
	    table += "<Td width=30% class=\"divAlfa\" style=\"filter:alpha(opacity=50)\">&nbsp;</td>"	
	    table += "<TD width=10% height=\"10%\" align=\"center\" valign=\"top\" bgcolor=\"#ffffff\">"
    	
	    table += "<TABLE bgcolor=\"#ffffff\" BORDER=\"2\" bordercolor=\"#000000\" CELLSPACING=\"2\" CELLPADDING=\"2\" >"
        table += "	<TR>"
	    table += "		<TD height=\"25\" align=center >"
	    table += "			<table><tr><td><a class=\"aBlack\" href=\"javascript:new Document().CloseLayerAlpha()\"> <img src=\"images/fechar.gif\" border=0 ></a></td><td><a class=\"aBlack\" href=\"javascript:new Document().CloseLayerAlpha()\"> Fechar</a></td></tr></table>"
	    table += "		</TD>"
	    table += "	</TR>"
	    table += "	<TR>"
	    table += "		<TD valign=\"top\" align=center >"
	    table += "			<TABLE bgcolor=\"#ffffff\" WIDTH=\100%\" height=\"100%\" align=\"center\" BORDER=\"0\" CELLSPACING=\"0\" CELLPADDING=\"0\" >"
	    table += "				<TR>"
	    table += "					<TD align=\"center\" valign=\"top\">"
	    table += "						" + URL
	    table += "					</TD>"
	    table += "				</TR>"
	    table += "			</TABLE>"
	    table += "		</TD>"
	    table += "	</TR>"
	    table += "</TABLE>"
    	
	    table += "</TD>"	
	    table += "<TD width=30% class=\"divAlfa\" style=\"filter:alpha(opacity=50)\">&nbsp;</TD>"	
	    table += "</TR>"
	    table += "<TR>"
	    table += "<TD colspan=3 height=50% class=\"divAlfa\" style=\"filter:alpha(opacity=50)\"  >&nbsp;</TD>"
	    table += "</TR>"
	    table += "</TABLE>"
    	
	    divAss.innerHTML = table
	    document.body.appendChild( divAss )
	    CreateLoading()
    }
}