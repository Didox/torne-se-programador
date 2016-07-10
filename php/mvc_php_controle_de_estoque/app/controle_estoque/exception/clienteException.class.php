<?php
	namespace app\exception;
	use \Exception;

	class clienteException extends Exception
	{
		public $exception;
		public $message;

		function __construct($exception,$message)
		{
			$this->exception = $exception;
			$this->message   = $message;
		}

		//GETTERS
		public function exception(){
			return $this->exception;
		}

		public function message(){
			return $this->message;
		}
	}
?>