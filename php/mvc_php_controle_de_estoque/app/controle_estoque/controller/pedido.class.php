<?php
	namespace app\controller;
	use app\exception\pedidoException;
	use app\model\pedido as pedido_model;
	use system\recursos\util;
	use app\config;

	class pedido
	{
		public $dados;
		public $mensagem;

		private $produto;
		private $cliente;


		//CONSTRUTOR
		function __construct()
		{
			if(isset($_GET['modulo']) && $_GET['modulo'] === basename(get_class($this)))
			{
				//ENVIO DE FORMULÁRIO
				if($_SERVER['REQUEST_METHOD'] === 'POST')
				{
					//REMOÇÃO
					if(isset($_POST['action']) && $_POST['action'] === 'remove' &&
					   isset($_POST['produto']) && is_numeric($_POST['produto']) &&
					   isset($_POST['cliente']) && is_numeric($_POST['cliente']))
					{
						$this->setProduto($_POST['produto']);
						$this->setCliente($_POST['cliente']);
						
						$this->removePedido();
						$this->mensagem['message']='Pedido removido com sucesso!';
						$this->mensagem['class']='danger';
					}
					else
					{
						$this->setProduto($_POST['produto']);
						$this->setCliente($_POST['cliente']);
						
						$this->cadastraPedido();
						$this->mensagem['message']='Pedido cadastrado com sucesso!';
						$this->mensagem['class']='success';
					}
				}
			}
		}


		//GETTERS
		public function getPedidos()
		{
			return $this->getPedidosBd();
		}


		//SETTERS
		private function setCliente($var)
		{
			$this->cliente=addslashes(trim($var));
		}

		private function setProduto($var)
		{
			$this->produto=addslashes(trim($var));
		}

		//DADOS
		private function getPedidosBd(){
			$model=new pedido_model();
			return $model->getPedidos();
		}


		//FUNCTIONS
		private function cadastraPedido()
		{
			$model=new pedido_model();
			$model->cadastraPedido(
									$this->produto,
									$this->cliente
								   );
		}

		private function removePedido()
		{
			$model=new pedido_model();
			$model->removePedido(
								  $this->produto,
							      $this->cliente
							    );
		}
	}