var vurl, vid, vnome="nome", vemail="email", vtabela="gred", vpag="pag",vtipo,vbot="bot", quant = 0;;

function  cadastrar(url, nome, email)
{
	vurl = url;
	vnome = nome;
	vemail = email;	
	vtipo=0;
	nome = document.getElementById(vnome).value;
	email = document.getElementById(vemail).value;
	url = url + "?nome="+nome+"&email="+email;
	// code for Mozilla, etc.
	if (window.XMLHttpRequest)
    {
	  xmlhttp=new XMLHttpRequest()
	  xmlhttp.onreadystatechange=xmlhttpChange
	  xmlhttp.open("POST",url,true)
	  xmlhttp.send(null)
    }
// code for IE
	else if (window.ActiveXObject)
    {
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP")
	  if (xmlhttp)
      {
	    xmlhttp.onreadystatechange=xmlhttpChange
	    xmlhttp.open("POST",url,true)
	    xmlhttp.send()
      }
    }
}




function  excluir(url, id)
{
	vurl = url;
	vid = id;
	vtipo=0;
	url = url + "?excluir=ok&id="+id;		
	// code for Mozilla, etc.
	if (window.XMLHttpRequest)
    {
	  xmlhttp=new XMLHttpRequest()
	  xmlhttp.onreadystatechange=xmlhttpChange
	  xmlhttp.open("POST",url,true)
	  xmlhttp.send(null)
    }
// code for IE
	else if (window.ActiveXObject)
    {
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP")
	  if (xmlhttp)
      {
	    xmlhttp.onreadystatechange=xmlhttpChange
	    xmlhttp.open("POST",url,true)
	    xmlhttp.send()
      }
    }
}
function  alterar(url, id, nome, email)
{
	vurl = url;
	vid = id;
	vnome = nome;
	vemail = email;
	vtipo=0;
	  
	nome = document.getElementById(vnome).value;
	email = document.getElementById(vemail).value;
	url = url + "?alterar=ok&id="+id+"&nome="+nome+"&email="+email;	
		
	// code for Mozilla, etc.
	if (window.XMLHttpRequest)
    {
	  xmlhttp=new XMLHttpRequest()
	  xmlhttp.onreadystatechange=xmlhttpChange
	  xmlhttp.open("POST",url,true)
	  xmlhttp.send(null)
    }
// code for IE
	else if (window.ActiveXObject)
    {
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP")
	  if (xmlhttp)
      {
	    xmlhttp.onreadystatechange=xmlhttpChange
	    xmlhttp.open("POST",url,true)
	    xmlhttp.send()
      }
    }
}




function  buscaalt(url, id, nome,email)
{
    vid = id;
	vnome = nome;
	vemail = email;	
	vtipo=1;		
	nome = document.getElementById(vnome).value;
	email = document.getElementById(vemail).value;		
	
	url = url + "?id="+id;
	//alert(url);
	// code for Mozilla, etc.
	if (window.XMLHttpRequest)
    {
	  xmlhttp=new XMLHttpRequest()
	  xmlhttp.onreadystatechange=xmlhttpChange
	  xmlhttp.open("POST",url,true)
	  xmlhttp.send(null)
    }
// code for IE
	else if (window.ActiveXObject)
    {
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP")
	  if (xmlhttp)
      {		  
	    xmlhttp.onreadystatechange=xmlhttpChange
	    xmlhttp.open("POST",url,true)
	    xmlhttp.send()
      }
    }
}


function  Buscar(url, nome, tabela,pag, pagina)
{
	vnome = nome;
	vtabela = tabela
	vpag = pag
	//alert(vpag);
	nome = document.getElementById(vnome).value;
	vtipo = 1

	url = url + "?pagina="+pagina+"&nome="+nome;
	//alert(url);
	// code for Mozilla, etc.
	if (window.XMLHttpRequest)
    {
	  xmlhttp=new XMLHttpRequest()
	  xmlhttp.onreadystatechange=xmlhttpChange
	  xmlhttp.open("POST",url,true)
	  xmlhttp.send(null)
    }
// code for IE
	else if (window.ActiveXObject)
    {
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP")
	  if (xmlhttp)
      {		  
	    xmlhttp.onreadystatechange=xmlhttpChange
	    xmlhttp.open("POST",url,true)
	    xmlhttp.send()
      }
    }
}


function xmlhttpChange()
{
	//alert(xmlhttp.readyState);
	//alert(vtipo);
	if(xmlhttp.readyState == 1 || vtipo == 1 );
	    document.getElementById(vtabela).innerHTML = "Carregando aquarde" ;//+ eval(quant+=1);
	
		
	if (xmlhttp.readyState==4)	
    {
       if (xmlhttp.status==200)
       {		   
		   switch( vtipo )
		   {
				case 1:						
					quant = 1;					
					BuscarReg();
				break;				
				default:					
				   VerificaCadastro();
				break
		   }
	   }
       else
       {
          alert("Erro ao carregar a página")
       }
    }
}

var xmlDoc



function VerificaCadastro()
{
//load xml file
// code for IE
  if (window.ActiveXObject)
  {
	  xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
	  xmlDoc.async=false;
	  xmlDoc.load("test.xml");	  
	  Confirmar()
  }
// code for Mozilla, etc.	
  else if (document.implementation && document.implementation.createDocument)
  {
	  xmlDoc= document.implementation.createDocument("","",null);
	  xmlDoc.load("test.xml");
	  xmlDoc.onload=Confirmar
  }
  else
  {
      alert('Erro ao carregar');
  }
}

function Confirmar()
{
	//alert(xmlDoc.getElementsByTagName("Salve")[0].firstChild.nodeValue);
	switch( eval(xmlDoc.getElementsByTagName("Salve")[0].firstChild.nodeValue) ){
	    case 1:
	        document.getElementById(vnome).value = "";
	        document.getElementById(vemail).value = "";
	        Buscar('buscar.asp','bnome','grid','pag','1')
	        alert("Cadastrao concluido");	
	    break;
	    case 2:
	        vtabela = "grid"
		    vpag = "pag"
	        Buscar('buscar.asp','bnome','grid','pag','1')
	    break;
	    case 3:		        
	        Buscar('buscar.asp','bnome','grid','pag','1')	        
	        alert("Alteracao concluido");        
	    break;	    
	    default:
	        alert("erro ao cadastrar");
	    break;
	}		
}

function BuscarReg()
{
//load xml file
// code for IE
  if (window.ActiveXObject)
  {
	  xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
	  xmlDoc.async=false;
	  xmlDoc.load("busca.xml");	  
	  MontarBusca()
  }
// code for Mozilla, etc.	
  else if (document.implementation && document.implementation.createDocument)
  {
	  xmlDoc= document.implementation.createDocument("","",null);
	  xmlDoc.load("busca.xml");
	  xmlDoc.onload=MontarBusca
  }
  else
  {
      alert('Erro ao carregar');
  }
}

function MontarBusca()
{	
	if( xmlDoc.getElementsByTagName("s")[0].firstChild.nodeValue == "s" ){	
	    document.getElementById(vbot).innerHTML = "<input name=alterar  type=button onClick=alterar('cadastrar.asp','"+vid+"','nome','email') value=alterar>";
        document.getElementById(vnome).value = xmlDoc.getElementsByTagName("nome")[0].firstChild.nodeValue;
        document.getElementById(vemail).value = xmlDoc.getElementsByTagName("email")[0].firstChild.nodeValue;                
    }   
    else{
        document.getElementById("bot").innerHTML = "<input name=enviar  type=button onClick=cadastrar('cadastrar.asp','nome','email') value=cadastrar>";         
        document.getElementById("nome").value = "";
        document.getElementById("email").value = "";
    }
       
	var mtabela = "";	
	mtabela+= "<table width=100% border=1>";
	
	for( x=0; x< xmlDoc.getElementsByTagName("id").length ; x++ )
	{
		mtabela+="<tr>"
		mtabela += "<td width=10% >"+ xmlDoc.getElementsByTagName("id")[x].firstChild.nodeValue + "</td>";
		mtabela += "<td width=60%>"+ xmlDoc.getElementsByTagName("nome")[x].firstChild.nodeValue + "</td>";
		mtabela += "<td width=26% >"+ xmlDoc.getElementsByTagName("email")[x].firstChild.nodeValue + "</td>";
		mtabela += "<td width=2% >"+ xmlDoc.getElementsByTagName("alterar")[x].firstChild.nodeValue + "</td>";
		mtabela += "<td width=2% >"+ xmlDoc.getElementsByTagName("excluir")[x].firstChild.nodeValue + "</td>";
		mtabela+="</tr>"	
	}
	mtabela+= "</table>"
	document.getElementById(vtabela).innerHTML = mtabela;
	document.getElementById(vpag).innerHTML = xmlDoc.getElementsByTagName("pag")[0].firstChild.nodeValue;
}