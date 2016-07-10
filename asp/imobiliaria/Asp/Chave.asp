<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#include file="aDOVBS.inc" -->
<%%>
<html>
<head>
<title>:::::IMOBI....:::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<style type="text/css">
<!--
  .Fa2
    {
      background: #F0F4F0;
    }
  .FB2
    {
      background: #E8ECF0;
    }
-->
</style>
<script language=javascript>
<!--
function muda_img(c,CB)
  {
    CB.value=c;
    CB=CB.parentNode;
    CB.className = c;
  }
-->
</script>
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<table width=588 border=0>
  <TR>
    <TD WIDTH="1%" VaLIGN=top>
      <TaBLE  BORDER=0 WIDTH="100%">
        <tr>
          <td bgcolor="#E8ECF0"></td>
        </tr>
      </table>
      <TaBLE BORDER=0 WIDTH="100%">
        <TR>
          <TD NOWRaP COLSPaN=4 aLIGN=CENTER>
	    <TaBLE CELLSPaCING=0 CELLPaDDING=0 BORDER=0 WIDTH=100%>
	      <TR>
		<TD bgcolor=#6B7585 align=left>
                  <a HREF="<%=URL&"?mes="&(mes-1)%>"><img src="../img/left.gif" border=0></font></b></a>
		</TD>
		<TD bgcolor=#6B7585 align=center> <font color="#FFFFFF"><B>
		  <B>QUADRO DE CHAVES</font></B>
		</TD>
		<TD bgcolor=#6B7585 align=right>
                  <a HREF="<%=URL&"?mes="&(mes+1)%>"><b><font size=4 face=arial><img src="../img/right.gif" border=0></font></b></a>
		</TD>
	      </TR>
	    </TaBLE>
          </TD>
        </TR>
        <TR>
	  <TD COLSPaN=4>
	    <TaBLE  CELLSPaCING=1 CELLPaDDING=0 BORDER=0>
	      <TR bgcolor="#FFFFFF">
		<%For i= 1 to 39  
		   if (i = day(now)) and (Mes=Month(now)) Then%>
		      <TD onMouseOver="this.className='FB2';this.style.cursor='hand'" onMouseOut="this.className='Fa2'" height=41 bgcolor=#F0F4F0 onclick="javascript:parent.location.href='Detalhe_agenda.asp?data=<%=DAteSerial(Year(Now),Mes,i)%>'" align="center" width="85">
		        <FONT COLOR=#FF0000 size=2><b><%=DAy(DAteSerial(Year(Now),Mes,i))%></b></font>
		      </TD>
		   <%Elseif (i<1) or (i > DAy(UltimoDiaMes)) Then%>
		      <TD height=41 bgcolor=#F0F4F0 align="center" width="85"></TD>
		   <%Else%>
		      <TD onMouseOver="this.className='FB2';this.style.cursor='hand'" onMouseOut="this.className='Fa2'" height=41 bgcolor=#F0F4F0 onclick="javascript:parent.location.href='Detalhe_agenda.asp?data=<%=DAteSerial(Year(Now),Mes,i)%>'" align="center" width="85">
		        <FONT COLOR=#000000 size=2><b><%=DAy(DAteSerial(Year(Now),Mes,i))%></b></font>
		      </TD>
		   <%End if
		   If j = 7 then
		      J = 0
		      Response.Write "</tr>"%>
  		   <%end if
		   J = j + 1
		Next%>
	      </TR>
	    </Table>
	  </TD>
	</tr>
      </Table>
    </td>
  </tr>
</table>
</body>
</html>