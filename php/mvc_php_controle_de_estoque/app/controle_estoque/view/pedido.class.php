<?php
	namespace app\view;

	use app\controller\pedido as pedido_controller; //CONTROLLER
	use app\controller\produto as produto_controller; //CONTROLLER
	use app\controller\cliente as cliente_controller; //CONTROLLER

	use system\seguranca\navegacao as nav;
	use system\recursos\util;
	
	use app\exception\pedidoException;

	class pedido
	{
		private $controller;

		public $dados;
		public $mensagem;

		//CONSTRUTOR
		function __construct()
		{
			try
			{
				$this->controller=new pedido_controller();

				$this->dados=$this->controller->dados;
				$this->mensagem=$this->controller->mensagem;		
			}
			catch(pedidoException $e)
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

		public function getPedidos()
		{
			return $this->controller->getPedidos();
		}

		public function getClientes()
		{
			$cliente=new cliente_controller();
			return $cliente->getClientes();
		}

		public function getProdutos()
		{
			$produto=new produto_controller();
			return $produto->getProdutos();
		}
	}
?>