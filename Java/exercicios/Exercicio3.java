class Exercicio3{
	public static void main( String [] args ){	
			Temporizador objTemporizador = new Temporizador();
						
			Letra6x5 objLetra= new Letra6x5();		
			objLetra.posicionar( 100,200 );
			objLetra.mostrarLetraD();
			
			objTemporizador.esperar(1);
			objLetra.posicionar( 220,200 );
			objLetra.mostrarLetraA();
			
			objTemporizador.esperar(1);
			objLetra.posicionar( 340,200 );
			objLetra.mostrarLetraN();
			
			objTemporizador.esperar(1);
			objLetra.posicionar( 430,200 );
			objLetra.mostrarLetraI();
			
			objTemporizador.esperar(1);
			objLetra.posicionar( 530,200 );
			objLetra.mostrarLetraL();
			
			objTemporizador.esperar(1);
			objLetra.posicionar( 650,200 );
			objLetra.mostrarLetraO();
	}
}
