<?php
	namespace system;
	
	interface config{
		static function encode();
		static function timezone();
		static function url();
		static function raiz();
	}
?>