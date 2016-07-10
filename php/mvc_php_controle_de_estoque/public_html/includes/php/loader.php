<?php
	if(!defined('ebp')) throw new PermissaoException('Acesso não autorizado');
	session_start();

	if(isset($_GET['developer']) AND $_GET['developer'])
	{
		error_reporting(E_ALL);
		ini_set('display_errors', 1);
	}
	else
	{
		error_reporting(0);
		ini_set('display_errors', 0);
	}
	
	//APP NAME
	DEFINE('APP','controle_estoque');

	//DIR PATHS
	$url_path='http://localhost/SERVER/TESTES/editora_abril/controle_estoque/Projeto/public_html/';
	$raiz_path='D:\workspace\SERVER\TESTES\editora_abril\controle_estoque\Projeto\app\\';

	//URL PATHS
	DEFINE('APP_URL',$url_path);
	DEFINE('APP_PATH',$raiz_path);

	function __autoload($nomeClasse)
	{
		//CONVERTER NAMESPACE PARA DIRETÓRIO E MINUSCULAS
		//$classe=mb_strtolower($nomeClasse);
		$classe=explode('\\',$nomeClasse);

		//VERIFICA SE É APLICAÇÃO OU SISTEMA
		if($classe[0]==='app')
			$classe[0]=APP;

		if($classe[0]==='system')
			$classe[0]='system';

		//CONSTRÓI CAMINHO E NOME PARA IMPORTAÇÃO
		$classe=APP_PATH.implode("\\",$classe).'.class.php';

		if(file_exists($classe)&&is_file($classe)) //CASO EXISTA E SEJA ARQUIVO
		{
			require_once($classe); //IMPORTA ARQUIVO
		}
		else
		{
			echo $classe."<br>";
		}
	}

	//CONFIGURAÇÕES GLOBAIS
	use app\config;
	$config=new config();
?>