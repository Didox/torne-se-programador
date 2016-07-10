<?php
	namespace app;
	use system\config as conf;
	use system\seguranca\navegacao as navegacao;
	use app\view\login;
	
	class config implements conf
	{
		function __construct()
		{
			new navegacao();
		}

		static function encode(){
			return "utf-8";
		}

		static function timezone(){
			return "America/Sao_Paulo";
		}

		static function url(){
			return "D:\workspace\SERVER\web\php\app\\";
		}

		static function raiz(){
			return "utf-8";
		}

		static function timeout(){
			return 600;
		}
	}	
?>