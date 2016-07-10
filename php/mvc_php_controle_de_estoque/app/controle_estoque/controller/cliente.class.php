<?php
	namespace app\controller;
	use app\exception\clienteException;
	use app\model\cliente as cliente_model;
	use system\recursos\util;
	use app\config;

	class cliente
	{
		public $dados;
		public $mensagem;

		private $id;
		private $nome;
		private $email;
		private $telefone;


		//CONSTRUTOR
		function __construct()
		{
			if(isset($_GET['modulo']) && $_GET['modulo'] === basename(get_class($this)))
			{
				//EDIÇÃO DE REGISTRO
				if(isset($_GET['id']) AND is_numeric($_GET['id']) AND $_GET['id'] > 0)
				{
					$this->setId($_GET['id']);
					if(!($this->verifica_id())) throw new clienteException('redirect','Verificação de id falhou.');
					$this->setDados();
				}

				//ENVIO DE FORMULÁRIO
				if($_SERVER['REQUEST_METHOD'] === 'POST')
				{
					//REMOÇÃO
					if(isset($_POST['id']) AND is_numeric($_POST['id']))
					{
						$this->setId($_POST['id']);
						
						$this->removeCliente();
						$this->mensagem['message']='Cliente removido com sucesso!';
						$this->mensagem['class']='danger';
					}
					else
					{
						$this->setNome($_POST['nome']);
						$this->setEmail($_POST['email']);
						$this->setTelefone($_POST['telefone']);

						if(isset($_GET['id']) AND is_numeric($_GET['id']) AND $_GET['id'] > 0)
						{
							$this->setId($_GET['id']);
							$this->atualizaCliente();
							$this->mensagem['message']='Cliente atualizado com sucesso!';
							$this->mensagem['class']='warning';
						}
						else
						{
							$this->cadastraCliente();
							$this->mensagem['message']='Cliente cadastrado com sucesso!';
							$this->mensagem['class']='success';
						}					
						$this->setDados();
					}
				}
			}
		}


		//GETTERS
		public function getClientes()
		{
			return $this->getClientesBd();
		}


		//SETTERS
		private function setId($var)
		{
			$this->id=addslashes(trim($var));
		}

		private function setNome($var)
		{
			$this->nome=addslashes(trim($var));
		}

		private function setEmail($var)
		{
			$this->email=addslashes(trim($var));
		}

		private function setTelefone($var)
		{
			$this->telefone=addslashes(trim($var));
		}
				private function setDados(){

		//DADOS
			$model=new cliente_model();
			$dados=$model->getCliente($this->id);

			$this->dados=$dados[0];
		}

		private function getClientesBd(){
			$model=new cliente_model();
			return $model->getClientes();
		}


		//FUNCTIONS
		private function verifica_id()
		{
			$model=new cliente_model();
			$cliente=$model->verificaClienteId($this->id);

			return $cliente[0][0]==1?true:false;
		}

		private function cadastraCliente()
		{
			$model=new cliente_model();
			$model->cadastraCliente(
									$this->nome,
									$this->email,
									$this->telefone
								   );
		}

		private function atualizaCliente()
		{
			$model=new cliente_model();
			$model->atualizaCliente(
									$this->id,
									$this->nome,
									$this->email,
									$this->telefone
								   );
		}

		private function removeCliente()
		{
			$model=new cliente_model();
			$model->removeCliente($this->id);
		}
	}