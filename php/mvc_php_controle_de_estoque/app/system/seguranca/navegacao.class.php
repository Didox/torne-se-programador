<?php
	namespace system\seguranca;
	class navegacao
	{
		function __construct()
		{
			if(isset($_SESSION['navegacao']['active']))
			{
				$_SESSION['navegacao']['previous']=$_SESSION['navegacao']['active'];
			}

			$_SESSION['navegacao']['active']['browser']=$_SERVER['HTTP_USER_AGENT'];
			$_SESSION['navegacao']['active']['server']=$_SERVER['HTTP_HOST'];
			$_SESSION['navegacao']['active']['uri']=str_replace(basename($_SERVER['PHP_SELF']),'',$_SERVER['SCRIPT_NAME']);
			$_SESSION['navegacao']['active']['page']=basename($_SERVER['PHP_SELF']);
			$_SESSION['navegacao']['active']['parameters']=$_SERVER['QUERY_STRING'];
			
			$_SESSION['navegacao']['active']['referrer']=$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME'].($_SERVER['QUERY_STRING'] != ""?'?'.$_SERVER['QUERY_STRING']:'');
			
			$_SESSION['navegacao']['active']['POST']=$_POST;
			$_SESSION['navegacao']['active']['GET']=$_GET;
		}
		
		//GETTERS
		static function activePage()
		{
			return $_SESSION['navegacao']['active']['page'];
		}
		
		static function previousPage()
		{
			return $_SESSION['navegacao']['previous']['page'];
		}
		
		//DEVELOPER
		static function view()
		{
			var_dump($_SESSION['navegacao']);
		}		
	}
?>