<?php
	namespace system\validacao;

	class texto
	{
		static function padrao($entrada){
			$entrada=trim($entrada);
			return $entrada;
		}

		static function removeEspeciais($entrada){
			//$especiais=array('!@#$%¨ ' &*()_+-=|\/<>:?}{,.;]['')


			$entrada=trim($entrada);
			return $entrada;
		}

		static function removeAcentos($entrada){
			/*$a = array(
					 "[ÂÀÁÄÃ]"=>"A",
					 "[âãàáä]"=>"a",
					 "[ÊÈÉË]"=>"E",
					 "[êèéë]"=>"e",
					 "[ÎÍÌÏ]"=>"I",
					 "[îíìï]"=>"i",
					 "[ÔÕÒÓÖ]"=>"O",
					 "[ôõòóö]"=>"o",
					 "[ÛÙÚÜ]"=>"U",
					 "[ûúùü]"=>"u",
					 "ç"=>"c",
					 "Ç"=>"C");
					 ´`^~
			
			$entrada=preg_replace(array_keys($a), array_values($a), $Msg);

			return $entrada;*/
		}

		
	}