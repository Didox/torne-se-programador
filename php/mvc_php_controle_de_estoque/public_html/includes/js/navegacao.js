//CONTROLE DE ESTOQUE
$(function()
{
	if($('input[name=telefone]').length > 0) $('input[name=telefone]').mask('(99) 9999-9999');

	$('form[name=remove]').submit(function(e){
		if(!confirm('Tem certeza que deseja remover este registro?'))
		{
			e.preventDefault();
			return false;
		}
		else return true;
	})
})