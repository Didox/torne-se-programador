class EquacaoSegungoGrau{
	public static double [] calc ( double a, double b, double c ){
		double x1=(-b+ (Math.sqrt( Matematica.potencia(b,2)-4*a*c)  ) )/(2*a);
		double x2=(-b-(Math.sqrt( Matematica.potencia(b,2)-4*a*c)  ) )/(2*a);
		double ret[] = new double[2];
		ret[0] = x1;
		ret[1] = x2;
		return ret;
	}
}