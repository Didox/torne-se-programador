  function chamar_cep()
    {
      window.open("consulta_cep.html","chamar_cep","resizable=no,scrollbars=no,location=no,top=20,left=20,width=355,height=320")
    }
  function chamar_login()
    {
      window.open("../html/pop_login.html","chamar_login","resizable=no,scrollbars=no,location=no,top=20,left=20,width=400,height=180")
    }
  function chamar_senha()
    {
      window.open("../html/pop_senha.html","chamar_senha","resizable=no,scrollbars=no,location=no,top=20,left=20,width=400,height=180")
    }
  function todos()
    {
      for (i=0; i<document.form1.length; i++)
         if (document.form1.selecionar.checked)
            {
              if (document.form1.elements[i].name=='deletar')
                 document.form1.elements[i].checked = true;
            }
         else
            {
              if (document.form1.elements[i].name=='deletar')
                 document.form1.elements[i].checked = false;
            }
    }
  function submeter()
    {
      document.form1.submit();
    }
  function limpar()
    {
      document.form1.reset();
    }
  function confirma(endereco) 
    {
      if (confirm("Tem certeza que deseja excluir o(s) registro(s) seleconado(s)?")==true)
         if (endereco=='')
            submeter()
         else
            location.href=endereco;
    }
  function recupera(endereco) 
    {
      if (confirm("Tem certeza que deseja recuperar o(s) registro(s) seleconado(s)?")==true)
         if (endereco=='')
            submeter()
         else
            location.href=endereco;
    }
  function remover(endereco) 
    {
      if (confirm("Tem certeza que deseja remover a publicação?")==true)
         if (endereco=='')
            submeter()
         else
            location.href=endereco;
    }
  function publicar(endereco) 
    {
      if (confirm("Tem certeza que deseja publicar este imóvel?")==true)
         if (endereco=='')
            submeter()
         else
            location.href=endereco;
    }
  function disponivel(endereco) 
    {
      if (confirm("Tem certeza que deseja disponibilizar para pesquisa?")==true)
         if (endereco=='')
            submeter()
         else
            location.href=endereco;
    }
  function indisponivel(endereco) 
    {
      if (confirm("Tem certeza que deseja remover da pesquisa?")==true)
         if (endereco=='')
            submeter()
         else
            location.href=endereco;
    }         
  function Numero() 
    { 
      if (event.keyCode == '13') 
         {} 
      else if (event.keyCode < '48' || event.keyCode > '58') 
         {
           event.keyCode = '127'; 
         } 
    } 
 function Moeda(obj)
  {
   var objeto,valor,valor2,formatado
   valor=""
   valor2=""
   formatado=""
   obj.value=obj.value.replace(",","")
   obj.value=obj.value.replace(".","")
   obj.value=obj.value.replace(".","")
   obj.value=obj.value.replace(".","")
   objeto=obj.value.substr(0,obj.value.length-2)
   if (obj.value.length >= 6)
     {
       for (i=1;i<=objeto.length;i++)
         {
           if ((i-1)%3==0 && i!=1)
              {
                valor="."+objeto.substr(objeto.length-i+1,3)+valor;
                valor2=objeto.substr(0,objeto.length-i+1);
                formatado=valor2+valor;
              }
         }
      obj.value=formatado+obj.value.substr(obj.value.length-2,obj.value.length)
     }
   if(obj.value.length >= 3)
      obj.value = obj.value.substr(0,obj.value.length-2)+","+obj.value.substr(obj.value.length-2,obj.value.length);
  } 

function CEP(obj)
  {
   if(obj.value.length == 2)
      obj.value = obj.value+".";
   if(obj.value.length == 6)
      obj.value = obj.value+"-";
  }
  
function CPF(obj)
  {
   if(obj.value.length == 3)
      obj.value = obj.value+".";
   if(obj.value.length == 7)
      obj.value = obj.value+".";
   if(obj.value.length == 11)
      obj.value = obj.value+"-";
  }
  
function DATA(obj)
  {
   if(obj.value.length == 2)
      obj.value = obj.value+"/";
   if(obj.value.length == 5)
      obj.value = obj.value+"/";
  }
function HORA(obj){
  if(obj.value.length==2)
    obj.value = obj.value+":";  	
}
