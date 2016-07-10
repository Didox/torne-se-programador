<?php
	namespace app\controller;
	use app\exception\produtoException;
	use app\model\produto as produto_model;
	use system\recursos\util;
	use app\config;

	class produto
	{
		public $dados;
		public $mensagem;

		private $id;
		private $nome;
		private $descricao;
		private $preco;


		//CONSTRUTOR
		function __construct()
		{
			if(isset($_GET['modulo']) && $_GET['modulo'] === basename(get_class($this)))
			{
				//EDIÇÃO DE REGISTRO
				if(isset($_GET['id']) AND is_numeric($_GET['id']) AND $_GET['id'] > 0)
				{
					$this->setId($_GET['id']);
					if(!($this->verifica_id())) throw new produtoException('redirect','Verificação de id falhou.');
					$this->setDados();
				}

				//ENVIO DE FORMULÁRIO
				if($_SERVER['REQUEST_METHOD'] === 'POST')
				{
					//REMOÇÃO
					if(isset($_POST['id']) AND is_numeric($_POST['id']))
					{
						$this->setId($_POST['id']);
						
						$this->removeProduto();
						$this->mensagem['message']='Produto removido com sucesso!';
						$this->mensagem['class']='danger';
					}
					else
					{
						$this->setNome($_POST['nome']);
						$this->setDescricao($_POST['descricao']);
						$this->setPreco($_POST['preco']);

						if(isset($_GET['id']) AND is_numeric($_GET['id']) AND $_GET['id'] > 0)
						{
							$this->setId($_GET['id']);
							$this->atualizaProduto();
							$this->mensagem['message']='Produto atualizado com sucesso!';
							$this->mensagem['class']='warning';
						}
						else
						{
							$this->cadastraProduto();
							$this->mensagem['message']='Produto cadastrado com sucesso!';
							$this->mensagem['class']='success';
						}					
						$this->setDados();
					}
				}
			}
		}


		//GETTERS
		public function getProdutos()
		{
			return $this->getProdutosBd();
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

		private function setDescricao($var)
		{
			$this->descricao=addslashes(trim($var));
		}

		private function setPreco($var)
		{
			$this->preco=addslashes(trim($var));
		}

		//DADOS
		private function setDados(){
			$model=new produto_model();
			$dados=$model->getProduto($this->id);

			$this->dados=$dados[0];
		}

		private function getProdutosBd(){
			$model=new produto_model();
			return $model->getProdutos();
		}


		//FUNCTIONS
		private function verifica_id()
		{
			$model=new produto_model();
			$produto=$model->verificaProdutoId($this->id);

			return $produto[0][0]==1?true:false;
		}

		private function cadastraProduto()
		{
			$model=new produto_model();
			$model->cadastraProduto(
									$this->nome,
									$this->descricao,
									$this->preco
								   );
		}

		private function atualizaProduto()
		{
			$model=new produto_model();
			$model->atualizaProduto(
									$this->id,
									$this->nome,
									$this->descricao,
									$this->preco
								   );
		}

		private function removeProduto()
		{
			$model=new produto_model();
			$model->removeProduto($this->id);
		}
	}