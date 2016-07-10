/**
 * Um objeto desta classe é composto por 15 quadrados, organizados
 * em 5 linhas e 3 colunas.
 *
 */

class Letra {

	// atributos da classe Letra
	Quadrado q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15;
	
	/**
	 * Método: posicionar
	 * Parâmetros:
	 *  - x (do tipo inteiro)
	 *  - y (do tipo inteiro)
	 * 
	 * Descrição:
	 * Este é o primeiro método que deve ser executado após a criação de um objeto 
	 * da classe Letra. Este método:
	 * - instancia os 15 quadrados;
	 * - posiciona cada quadrado de modo a formar uma matriz de 5 linhas por 3 colunas,
	 *   sendo que o canto superior esquerdo fica posicionado nas coordenadas
	 *   x e y (que são os parâmetros do método);
	 * - faz com que todos os quadrados assumam a cor inicial verde.
	 */
	void posicionar (int x, int y) {
		
		// largura e altura de um circulo
		int largura = 20, altura = 20; 
		
		// instancia os quadrados da primeira linha
		q1 = new Quadrado();
		q2 = new Quadrado();
		q3 = new Quadrado();
		// posiciona os circulos da primeira linha
		q1.posicionar( x , y );
		q2.posicionar( x+largura , y );
		q3.posicionar( x+2*largura , y );
		
		// instancia os quadrados da segunda linha
		q4 = new Quadrado();
		q5 = new Quadrado();
		q6 = new Quadrado();
		// posiciona os circulos da segunda linha
		q4.posicionar( x , y + altura );
		q5.posicionar( x + largura , y + altura);
		q6.posicionar( x + 2*largura , y + altura );

		// instancia os quadrados da terceira linha
		q7 = new Quadrado();
		q8 = new Quadrado();
		q9 = new Quadrado();
		// posiciona os circulos da terceira linha
		q7.posicionar( x , y + 2*altura );
		q8.posicionar( x + largura , y + 2*altura);
		q9.posicionar( x + 2*largura , y + 2*altura );
	
		// instancia os quadrados da quarta linha
		q10 = new Quadrado();
		q11 = new Quadrado();
		q12 = new Quadrado();
		// posiciona os circulos da quarta linha
		q10.posicionar( x , y + 3*altura );
		q11.posicionar( x + largura , y + 3*altura);
		q12.posicionar( x + 2*largura , y + 3*altura );

		// instancia os quadrados da quinta linha
		q13 = new Quadrado();
		q14 = new Quadrado();
		q15 = new Quadrado();	
		// posiciona os circulos da quinta linha
		q13.posicionar( x , y + 4*altura );
		q14.posicionar( x + largura , y + 4*altura);
		q15.posicionar( x + 2*largura , y + 4*altura );
	} // fim do método posicionar
	
	/**
	 * Método: mostrarLetraA
	 * Altera as cores dos quadrados de maneira a formar a letra A
	 */
	void mostrarLetraA() {
		
		// quadrados da primeira linha
		q1.acender();
		q2.acender();
		q3.acender();
		
		// quadrados da segunda linha
		q4.acender();
		q5.apagar();
		q6.acender();
		
		// quadrados da terceira linha
		q7.acender();
		q8.acender();
		q9.acender();
		
		// quadrados da quarta linha
		q10.acender();
		q11.apagar();
		q12.acender();
		
		// quadrados da quinta linha
		q13.acender();
		q14.apagar();
		q15.acender();
		
	} // fim do método mostrarLetraA
	
	 /**
	 * Método: mostrarLetraE
	 * Altera as cores dos quadrados de maneira a formar a letra E
	 */
	void mostrarLetraE() {
		
		// quadrados da primeira linha
		q1.acender();
		q2.acender();
		q3.acender();
		
		// quadrados da segunda linha
		q4.acender();
		q5.apagar();
		q6.apagar();
		
		// quadrados da terceira linha
		q7.acender();
		q8.acender();
		q9.acender();
		
		// quadrados da quarta linha
		q10.acender();
		q11.apagar();
		q12.apagar();
		
		// quadrados da quinta linha
		q13.acender();
		q14.acender();
		q15.acender();
		
	} // fim do método mostrarLetraE

}
