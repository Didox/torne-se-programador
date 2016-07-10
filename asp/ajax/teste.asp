<%
Dim xmlDoc, rootEl, child1, child2, p'Create an XML document
Set xmlDoc = Server.CreateObject("Microsoft.XMLDOM")'Create a root element and append it to the document
Set rootEl = xmlDoc.createElement("root")
xmlDoc.appendChild rootEl'Create and append child elements
Set child1 = xmlDoc.createElement("child1")
Set child2 = xmlDoc.createElement("child2")
rootEl.appendChild child1
rootEl.appendChild child2'Add an XML processing instruction
'and insert it before the root element
Set p=xmlDoc.createProcessingInstruction("xml","version='1.0'")
xmlDoc.insertBefore p,xmlDoc.childNodes(0)'Save the XML file to the c directory
xmlDoc.Save "c:\test.xml"
%> 
