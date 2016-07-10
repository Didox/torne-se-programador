<?php
	namespace app\view;

	use app\controller\cliente as cliente_controller; //CONTROLLER
	use system\seguranca\navegacao as nav;
	use system\recursos\util;
	
	use app\exception\clienteException;

	class cliente
	{
		private $controller;

		public $dados;
		public $mensagem;

		//CONSTRUTOR
		function __construct()
		{
			try
			{
				$this->controller=new cliente_controller();	

				$this->dados=$this->controller->dados;
				$this->mensagem=$this->controller->mensagem;		
			}
			catch(clienteException $e)
			{
				switch($e->exception)
				{
					case 'redirect':
						header('Location: index.php?modulo='.$_GET['modulo']);
						break;
					default:
						echo $e->getMessage();
						break;
				}
				exit();
			}
		}

		//GETTER
		public function getDados()
		{
			return $this->dados;
		}

		public function getMensagem()
		{
			return $this->mensagem;
		}

		public function getClientes()
		{
			return $this->controller->getClientes();
		}
	}
?>