<?php
	namespace app\model;
	use system\db\db;

	class cliente
	{
		private $db;
		private $tabela='clientes';

		//AUTOLOAD
		function __construct()
		{
			$this->db=new db();
		}

		//FUNCTIONS
		public function verificaClienteId($id)
		{
			$sql='SELECT 
					count(nome)
				  FROM '.$this->tabela.'
				  WHERE 
					id='.$id;
			
			return $this->db->fetch($sql);
		}

		public function getCliente($id)
		{
			$sql='SELECT 
					id,
					nome,
					email,
					telefone
				  FROM '.$this->tabela.'
				  WHERE 
					id = '.$id;

			return $this->db->fetch($sql);
		}

		public function getClientes()
		{
			$sql='SELECT *
				  FROM '.$this->tabela.'
				  ORDER BY id DESC';

			return $this->db->fetch($sql);
		}

		//INSERT
		public function cadastraCliente($nome,$email,$telefone)
		{
			$sql='INSERT INTO '.$this->tabela.'
				  (
				  	nome,
				  	email,
				  	telefone
				  )
				  VALUES(
				  	"'.$nome.'",
				  	"'.$email.'",
				  	"'.$telefone.'"
				  )';

			$this->db->query($sql);
		}

		//UPDATE
		public function atualizaCliente($id,$nome,$email,$telefone)
		{
			$sql='UPDATE '.$this->tabela.'
				  SET
				  	nome 	 = "'.$nome.'",
				  	email 	 = "'.$email.'",
				  	telefone = "'.$telefone.'"
				  WHERE 
				  	id = '.$id;

			$this->db->query($sql);
		}

		//DELETE
		public function removeCliente($id)
		{
			$sql='DELETE FROM '.$this->tabela.'
				  WHERE 
				  	id = '.$id;

			$this->db->query($sql);
		}
	}
?>