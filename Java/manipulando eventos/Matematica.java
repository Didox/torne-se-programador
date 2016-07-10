class Matematica{
	public static double pi=3.1459;
	public static double quadrado( double x ){
		return x*x;
	}
	
	public static double potencia( double x, int y ){		
		if( y==0 )
			return 1;
		return x*potencia(x,y-1);
	}
}