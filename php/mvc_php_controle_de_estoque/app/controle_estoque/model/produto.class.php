<?php
	namespace app\model;
	use system\db\db;

	class produto
	{
		private $db;
		private $tabela='produtos';

		//AUTOLOAD
		function __construct()
		{
			$this->db=new db();
		}

		//FUNCTIONS
		public function verificaProdutoId($id)
		{
			$sql='SELECT 
					count(nome)
				  FROM '.$this->tabela.'
				  WHERE 
					id='.$id;
			
			return $this->db->fetch($sql);
		}

		public function getProduto($id)
		{
			$sql='SELECT 
					id,
					nome,
					descricao,
					preco
				  FROM '.$this->tabela.'
				  WHERE 
					id = '.$id;

			return $this->db->fetch($sql);
		}

		public function getProdutos()
		{
			$sql='SELECT *
				  FROM '.$this->tabela.'
				  ORDER BY id DESC';

			return $this->db->fetch($sql);
		}

		//INSERT
		public function cadastraProduto($nome,$descricao,$preco)
		{
			$sql='INSERT INTO '.$this->tabela.'
				  (
				  	nome,
				  	descricao,
				  	preco
				  )
				  VALUES(
				  	"'.$nome.'",
				  	"'.$descricao.'",
				  	'.$preco.'
				  )';

			$this->db->query($sql);
		}

		//UPDATE
		public function atualizaProduto($id,$nome,$descricao,$preco)
		{
			$sql='UPDATE '.$this->tabela.'
				  SET
				  	nome 	 = "'.$nome.'",
				  	descricao 	 = "'.$descricao.'",
				  	preco = '.$preco.'
				  WHERE 
				  	id = '.$id;

			$this->db->query($sql);
		}

		//DELETE
		public function removeProduto($id)
		{
			$sql='DELETE FROM '.$this->tabela.'
				  WHERE 
				  	id = '.$id;

			$this->db->query($sql);
		}
	}
?>