<?php
	namespace system\db;
	class db
	{
		private $host;
		private $user;
		private $pass;
		private $database;
		
		private $_DATA;
		private $fetch;
		private $rows;
		private $sql;
		
		private $resource;
		
		public function __construct(){
			$this->host = "localhost";
			$this->user = "root";
			$this->pass = "";
			$this->database = "controle_estoque";
			
			$this->connectDb();
			$this->selectDb();
		}
			
		public function connectDb()
		{
			$this->resource = mysql_connect($this->host, $this->user, $this->pass);
			return $this->resource;
		}
		
		function getRes()
		{
			return $this->resource;
		}
		
		public function selectDb(){
			mysql_select_db($this->database);
			mysql_set_charset('utf8',$this->resource);
		}
		
		public function selectId($tab, $id)
		{
			return $this->fetch('select * from ' . $tab . ' where id = ' . $id);
		}
			
		public function query($var){
			//die(Util::teste($var));
			return mysql_query($var);
		}
		
		public function fetch($var){
			//Util::teste($var);
			$this->_DATA = array();
			if($this->sql = mysql_query($var))
				while($this->fetch = mysql_fetch_array($this->sql)){
					$this->_DATA[] = $this->fetch;
				}
			return $this->_DATA;
		}
		
		public function getDbName()
		{
			return $this->database;
		}
		
		public function encerra()
		{
			mysql_close($this->resource);
		}
	}
?>