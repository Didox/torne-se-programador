class Main{
	public static void main( String[] args){
		/*double valord = EntradaGrafica.lerDouble();
		int valori = EntradaGrafica.lerInteiro();
		double recebe =  Matematica.potencia( valord, valori-1 ) + Matematica.potencia( valord -1, valori-2);
		SaidaGrafica.imprimir("O valor da potencia é: "+ recebe + "" );	*/

		double segundog[] = null;
		segundog = EquacaoSegungoGrau.calc(EntradaGrafica.lerDouble() , EntradaGrafica.lerDouble(), EntradaGrafica.lerDouble() );
		SaidaGrafica.imprimir("O valor de x1 é "+ segundog[0] + "" );	
		SaidaGrafica.imprimir("O valor de x2 é "+ segundog[1] + "" );	
	}
		
}