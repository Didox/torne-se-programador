<html>
	<head>
		<script type="text/javascript">
var xmlDoc
function loadXML()
{
//load xml file
// code for IE
if (window.ActiveXObject)
  {
  xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
  xmlDoc.async=false;
  xmlDoc.load("test.xml");
  getmessage()
  }
// code for Mozilla, etc.	
else if (document.implementation &&
document.implementation.createDocument)
  {
  xmlDoc= document.implementation.createDocument("","",null);
  xmlDoc.load("test.xml");
  xmlDoc.onload=getmessage
  }
else
  {
      alert('Erro ao carregar');
  }
}

function getmessage()
{
	alert(xmlDoc.getElementsByTagName("body")[0].firstChild.nodeValue);
	document.getElementById("message").innerHTML=xmlDoc.getElementsByTagName("body")[0].firstChild.nodeValue;
	document.getElementById("to").innerHTML=xmlDoc.getElementsByTagName("to")[0].firstChild.nodeValue;
	document.getElementById("from").innerHTML=xmlDoc.getElementsByTagName("from")[0].firstChild.nodeValue;
}

function  loadXMLDoc(url)
{
// code for Mozilla, etc.
if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest()
  xmlhttp.onreadystatechange=xmlhttpChange
  xmlhttp.open("GET",url,true)
  xmlhttp.send(null)
  }
// code for IE
else if (window.ActiveXObject)
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP")
    if (xmlhttp)
    {
    xmlhttp.onreadystatechange=xmlhttpChange
    //alert(url)
    xmlhttp.open("GET",url,true)
    xmlhttp.send()
    }
  }
}
function xmlhttpChange()
{
// if xmlhttp shows "loaded"
if (xmlhttp.readyState==4)
  {
  // if "OK"
  if (xmlhttp.status==200)
    {
    	loadXML()    	
	}
  else
    {
    alert("Erro ao carregar a página")
    }
  }
}
		</script>
	</head>
	<body onload="loadXMLDoc('geraxml.asp')" bgcolor="yellow" >
			<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="780"  height=600 border="1">
				<TR>
					<TD colspan=2 height=20%><span id="to"></span></TD>
					
				</TR>
				<TR>
					<TD width=15% valign=top><span id="from"></span></TD>
					<TD  valign=top><span id="message"></span></TD>
				</TR>
			</TABLE>			
		<P></P>
	</body>
</html>
