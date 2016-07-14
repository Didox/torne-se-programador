// Se = if
// Senão = else
// Senão se = else if
// Case = switch

// Sintax

// JavaScript
//--------------- Caso joão ------------------
debugger
joao = prompt("Digite a opção do joao");
if(joao == 'academia'){
	alert('Forte');
}
else{
	alert('inteligente');
}

//--------------- Caso jose ------------------
debugger
jose = prompt("Digite a opção do jose");
if(jose == 'josefina'){
	alert('beijos');
}
else if(jose == 'bar'){
	alert('bebado');
}
else{
	if(jose == 'trabalho'){
		alert('ganhar dinheiro');
	}
	else{
		alert('ficar inteligente');
	}
}
//--------------- Caso maria ------------------
debugger
maria = prompt("Digite a opção da maria");
switch(maria) {
    case 'unhas':
        alert("gastei com unhas");
        break;
    case 'cabeleireiro':
        alert("gastei com o cabelo");
        break;
    case 'academia':
        alert("melhorei aparencia");
        break;
    case 'compras':
        alert("gastei com compras");
        break;
    case 'trabalho':
        alert("ganhei com trabalho");
        break;
    default:
        alert("gastei com sapatos");
}









