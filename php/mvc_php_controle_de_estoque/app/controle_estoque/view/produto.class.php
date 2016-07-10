<?php
	namespace app\view;

	use app\controller\produto as produto_controller; //CONTROLLER
	use system\seguranca\navegacao as nav;
	use system\recursos\util;
	
	use app\exception\produtoException;

	class produto
	{
		private $controller;

		public $dados;
		public $mensagem;

		//CONSTRUTOR
		function __construct()
		{
			try
			{
				$this->controller=new produto_controller();	

				$this->dados=$this->controller->dados;
				$this->mensagem=$this->controller->mensagem;		
			}
			catch(produtoException $e)
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

		public function getProdutos()
		{
			return $this->controller->getProdutos();
		}
	}
?>