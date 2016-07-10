<?php
	namespace app\model;
	use system\db\db;

	class Pedido
	{
		private $db;
		private $tabela='pedidos';

		//AUTOLOAD
		function __construct()
		{
			$this->db=new db();
		}

		//FUNCTIONS
		public function getPedidos()
		{
			$sql='SELECT 
					'.$this->tabela.'.produto,
					'.$this->tabela.'.cliente,
					produtos.nome produto_nome,
					clientes.nome cliente_nome
				  FROM '.$this->tabela.'
				  
				  LEFT JOIN produtos
				  ON '.$this->tabela.'.produto = produtos.id

				  LEFT JOIN clientes
				  ON '.$this->tabela.'.cliente = clientes.id

				  ORDER BY '.$this->tabela.'.cliente';

			return $this->db->fetch($sql);
		}

		//INSERT
		public function cadastraPedido($produto,$cliente)
		{
			$sql='INSERT INTO '.$this->tabela.'
				  (
				  	produto,
				  	cliente
				  )
				  VALUES(
				  	'.$produto.',
				  	'.$cliente.'
				  )';

			$this->db->query($sql);
		}

		//DELETE
		public function removePedido($produto,$cliente)
		{
			$sql='DELETE FROM '.$this->tabela.'
				  WHERE 
				  	produto = '.$produto.' AND
				  	cliente = '.$cliente;

			$this->db->query($sql);
		}
	}
?>