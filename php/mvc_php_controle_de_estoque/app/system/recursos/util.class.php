<?php
	namespace system\recursos;
	class util
	{
		static function teste($var)
		{
			echo '<pre>';
			print_r($var);
			echo '</pre>';
		}
		
		static function alertJS($var)
		{
			echo '<script type="text/javascript">';
			echo "alert('$var')";
			echo '</script>';
		}
		
		static function locationJS($var)
		{
			echo '<script type="text/javascript">';
			echo "window.location.assign('$var')";
			echo '</script>';
		}

		static function unico($pref)
		{
			$num = uniqid(true);
			$unico = $pref . '_' . substr($num,strpos($num,'.')) . '_';
			return $unico;
		}
		
		static function consoleJS($action){
			echo '<script type="text/javascript">';
				//EXIBE CONSOLE;
				echo "$('#console_usuario_".$action."').show();";
				//MOSTRA MENSAGEM NO CONSOLE
				if($action=="inserido")
					echo "$('#console_usuario_".$action."').html('<span id=ok>Atenção:</span> Registro $action com sucesso');";
				else if($action=="importado")
					echo "$('#console_usuario_".$action."').html('<span id=ok>Atenção:</span> Registros ".$action."s com sucesso');";	
				else
					echo "$('#console_usuario_".$action."').html('<span id=erro>Atenção:</span> Registro $action com sucesso');";
				
			echo '</script>';
		}
		
		static function tratarData($data, $comHora, $formatoDestino){
			if($formatoDestino == 'html'){
				$separadorOrigem = '-';
				$separadorDestino = '/';
			}
			else if($formatoDestino == 'db'){
				$separadorOrigem = '/';
				$separadorDestino = '-';
			}
			
			if($comHora){
				$espaco = strpos($data,' ');
				$dataOk = substr($data,0,$espaco);
				$hora = substr($data,$espaco);
				$arr = explode($separadorOrigem,$dataOk);
				return $arr[2].$separadorDestino.$arr[1].$separadorDestino.$arr[0].' '.$hora;
			}
			else{
				$arr = explode($separadorOrigem,$data);
				if(strstr($arr[2],':'))
					$arr[2] = substr($arr[2],0,2);
				return $arr[2].$separadorDestino.$arr[1].$separadorDestino.$arr[0];
			}
		}
		
		//$str é a string, $ix é o índice final
		static function chamadaNoticia($str,$ix){
			if(strlen($str)>$ix){
				$trecho = substr($str,0,$ix);
				$esp = strrpos($trecho," ");//pega a última ocorrência do caractere " " no trecho acima
				$chamada = substr($str,0,$esp);//faz de novo o substr usando o indice $esp para pegar o espaço
				
				if($chamada!="")
					return $chamada;
				else{
					$first=explode(" ",$str);
					return $first[0];
				}
			}
			else
				return $str;
		}
		
		/* CRIA DIRETÓRIOS ESTRUTURADAMENTE */
		static function criaDirEstruturado($var){		
			$arquivo=new arquivos();
			$pastas=explode("/",$var);
			$qnt=count($pastas);
			$caminho="";
			
			for($x=0;$x<$qnt;$x++){
				if($pastas[$x]!="..")
					$nome_seguro=$arquivo->nomeSeguro($pastas[$x],true);
				else
					$nome_seguro="..";

				if($nome_seguro!="")
					if(!file_exists($caminho.$nome_seguro))
						$arquivo->criaDir($caminho.mb_strtolower($arquivo->nomeSeguro($pastas[$x],true)));
				$caminho.=$nome_seguro."/";
			}
			return mb_strtolower($caminho);	
		}
		
		//Função que verifica a extensão
		static function extensaoArquivo($arquivo){
			$tam = strlen($arquivo);
			
			//ext de 3 chars
			if( $arquivo[($tam)-4] == '.' )
				$extensao = substr($arquivo,-3);
			
			//ext de 4 chars
			elseif( $arquivo[($tam)-5] == '.' )
				$extensao = substr($arquivo,-4);
			
			//ext de 2 chars
			elseif( $arquivo[($tam)-3] == '.' )
				$extensao = substr($arquivo,-2);
			
			//Caso a extensão não tenha 2, 3 ou 4 chars ele não aceita e retorna Nulo.
			else
				$extensao = NULL;
			
			return $extensao;
		}
		
		
		
		
		
		
		
		
		
		function isLink($url){
			if(!preg_match("|^http(s)?://[a-z0-9-]+(\.[a-z0-9-]+)*(:[0-9]+)?(/.*)?$|i", $url))
				return false;
			else
				return true;
		}
	}
?>