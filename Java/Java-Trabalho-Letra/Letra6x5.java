class Letra6x5{
	// atributos da classe Letra6x5
	public Quadrado q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15,q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30;
		/**
	 * Método: posicionar
	 * Parâmetros:
	 *  - x (do tipo inteiro)
	 *  - y (do tipo inteiro)
	 * 
	 * Descrição:
	 * Este é o primeiro método que deve ser executado após a criação de um objeto 
	 * da classe Letra. Este método:
	 * - instancia os 30 quadrados;
	 * - posiciona cada quadrado de modo a formar uma matriz de 6 linhas por 5 colunas,
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
		q4 = new Quadrado();
		q5 = new Quadrado();
		// posiciona os circulos da primeira linha
		q1.posicionar( x , y );
		q2.posicionar( x+largura , y );
		q3.posicionar( x+2*largura , y );
		q4.posicionar( x+3*largura, y );
		q5.posicionar( x+4*largura , y );
		
		// instancia os quadrados da segunda linha		
		q6 = new Quadrado();
		q7 = new Quadrado();
		q8 = new Quadrado();
		q9 = new Quadrado();
		q10 = new Quadrado();
		// posiciona os circulos da segunda linha
		q6.posicionar( x , y + altura );
		q7.posicionar( x + largura , y + altura );		
		q8.posicionar( x+2*largura , y + altura);
		q9.posicionar( x+3*largura , y + altura);
		q10.posicionar( x+4*largura , y + altura);
		
		// instancia os quadrados da terceira linha		
		q11 = new Quadrado();
		q12 = new Quadrado();
		q13 = new Quadrado();
		q14 = new Quadrado();
		q15 = new Quadrado();
		// posiciona os circulos da terceira linha
		q11.posicionar( x , y + 2 * altura );
		q12.posicionar( x + largura , y + 2 * altura );		
		q13.posicionar( x+2*largura , y + 2 * altura);
		q14.posicionar( x+3*largura , y + 2 * altura);
		q15.posicionar( x+4*largura , y + 2 * altura);
		
		// instancia os quadrados da quarta linha		
		q16 = new Quadrado();
		q17 = new Quadrado();
		q18 = new Quadrado();
		q19 = new Quadrado();
		q20 = new Quadrado();
		// posiciona os circulos da quarta linha
		q16.posicionar( x , y + 3 * altura );
		q17.posicionar( x + largura , y + 3 * altura );		
		q18.posicionar( x+2*largura , y + 3 * altura);
		q19.posicionar( x+3*largura , y + 3 * altura);
		q20.posicionar( x+4*largura , y + 3 * altura);
		
		// instancia os quadrados da quinta linha		
		q21 = new Quadrado();
		q22 = new Quadrado();
		q23 = new Quadrado();
		q24 = new Quadrado();
		q25 = new Quadrado();
		// posiciona os circulos da quinta linha
		q21.posicionar( x , y + 4 * altura );
		q22.posicionar( x + largura , y + 4 * altura );		
		q23.posicionar( x+2*largura , y + 4 * altura);
		q24.posicionar( x+3*largura , y + 4 * altura);
		q25.posicionar( x+4*largura , y + 4 * altura);
		
		// instancia os quadrados da sexta linha		
		q26 = new Quadrado();
		q27 = new Quadrado();
		q28 = new Quadrado();
		q29 = new Quadrado();
		q30 = new Quadrado();
		// posiciona os circulos da sexta linha
		q26.posicionar( x , y + 5 * altura );
		q27.posicionar( x + largura , y + 5 * altura );		
		q28.posicionar( x+2*largura , y + 5 * altura);
		q29.posicionar( x+3*largura , y + 5 * altura);
		q30.posicionar( x+4*largura , y + 5 * altura);

	} // fim do método mostrarLetraE
	
	
	void mostrarLetraA() {
		
		// quadrados da primeira linha
		q1.acender();
		q2.acender();
		q3.acender();
		q4.acender();
		q5.acender();
		
		// quadrados da segunda linha
		q6.acender();
		q7.apagar();
		q8.apagar();
		q9.apagar();
		q10.acender();
		
		// quadrados da terceira linha
		q11.acender();
		q12.acender();
		q13.acender();
		q14.acender();
		q15.acender();
		
		// quadrados da quarta linha
		q16.acender();
		q17.apagar();
		q18.apagar();
		q19.apagar();
		q20.acender();
		
		// quadrados da quinta linha
		q21.acender();
		q22.apagar();
		q23.apagar();
		q24.apagar();
		q25.acender();
		
		// quadrados da quinta linha
		q26.acender();
		q27.apagar();
		q28.apagar();
		q29.apagar();
		q30.acender();
		
		
	} // fim do método mostrarLetraA
	
	void mostrarLetraD() {
		
		// quadrados da primeira linha
		q1.acender();
		q2.acender();
		q3.acender();
		q4.acender();
		q5.acender();
		
		// quadrados da segunda linha
		q6.acender();
		q7.apagar();
		q8.apagar();
		q9.apagar();
		q10.acender();
		
		// quadrados da terceira linha
		q11.acender();
		q12.apagar();
		q13.apagar();
		q14.apagar();
		q15.acender();
		
		// quadrados da quarta linha
		q16.acender();
		q17.apagar();
		q18.apagar();
		q19.apagar();
		q20.acender();
		
		// quadrados da quinta linha
		q21.acender();
		q22.apagar();
		q23.apagar();
		q24.apagar();
		q25.acender();
		
		
		// quadrados da sexta linha
		q26.acender();
		q27.acender();
		q28.acender();
		q29.acender();
		q30.acender();

	} // fim do método mostrarLetraD
	
	void mostrarLetraL() {
		
		// quadrados da primeira linha
		q1.acender();
		q2.apagar();
		q3.apagar();
		q4.apagar();
		q5.apagar();
		
		// quadrados da segunda linha
		q6.acender();
		q7.apagar();
		q8.apagar();
		q9.apagar();
		q10.apagar();
		
		// quadrados da terceira linha
		q11.acender();
		q12.apagar();
		q13.apagar();
		q14.apagar();
		q15.apagar();
		
		// quadrados da quarta linha
		q16.acender();
		q17.apagar();
		q18.apagar();
		q19.apagar();
		q20.apagar();
		
		// quadrados da quinta linha
		q21.acender();
		q22.apagar();
		q23.apagar();
		q24.apagar();
		q25.apagar();
		
		
		// quadrados da sexta linha
		q26.acender();
		q27.acender();
		q28.acender();
		q29.acender();
		q30.acender();

	} // fim do método mostrarLetraL
	
	void mostrarLetraI() {
		
		// quadrados da primeira linha
		q1.apagar();
		q2.apagar();
		q3.acender();
		q4.apagar();
		q5.apagar();
		
		// quadrados da segunda linha
		q6.apagar();
		q7.apagar();
		q8.apagar();
		q9.apagar();
		q10.apagar();
		
		// quadrados da terceira linha
		q11.apagar();
		q12.apagar();
		q13.acender();
		q14.apagar();
		q15.apagar();
		
		// quadrados da quarta linha
		q16.apagar();
		q17.apagar();
		q18.acender();
		q19.apagar();
		q20.apagar();
		
		// quadrados da quinta linha
		q21.apagar();
		q22.apagar();
		q23.acender();
		q24.apagar();
		q25.apagar();
		
		
		// quadrados da sexta linha
		q26.apagar();
		q27.apagar();
		q28.acender();
		q29.apagar();
		q30.apagar();

	} // fim do método mostrarLetraI
	
	void mostrarLetraN() {
		
		// quadrados da primeira linha
		q1.acender();
		q2.acender();
		q3.acender();
		q4.apagar();
		q5.acender();
		
		// quadrados da segunda linha
		q6.acender();
		q7.apagar();
		q8.acender();
		q9.apagar();
		q10.acender();
		
		// quadrados da terceira linha
		q11.acender();
		q12.apagar();
		q13.acender();
		q14.apagar();
		q15.acender();
		
		// quadrados da quarta linha
		q16.acender();
		q17.apagar();
		q18.acender();
		q19.acender();
		q20.acender();
		
		// quadrados da quinta linha
		q21.acender();
		q22.apagar();
		q23.apagar();
		q24.apagar();
		q25.apagar();
		
		
		// quadrados da sexta linha
		q26.acender();
		q27.apagar();
		q28.apagar();
		q29.apagar();
		q30.apagar();

	} // fim do método mostrarLetraN
	
	void mostrarLetraO() {
		
		// quadrados da primeira linha
		q1.acender();
		q2.acender();
		q3.acender();
		q4.acender();
		q5.acender();
		
		// quadrados da segunda linha
		q6.acender();
		q7.apagar();
		q8.apagar();
		q9.apagar();
		q10.acender();
		
		// quadrados da terceira linha
		q11.acender();
		q12.apagar();
		q13.apagar();
		q14.apagar();
		q15.acender();
		
		// quadrados da quarta linha
		q16.acender();
		q17.apagar();
		q18.apagar();
		q19.apagar();
		q20.acender();
		
		// quadrados da quinta linha
		q21.acender();
		q22.apagar();
		q23.apagar();
		q24.apagar();
		q25.acender();
		
		
		// quadrados da sexta linha
		q26.acender();
		q27.acender();
		q28.acender();
		q29.acender();
		q30.acender();

	} // fim do método mostrarLetraO
}
