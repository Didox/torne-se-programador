abstract class Mundo{
	public int diametrokm;
	public double dia;
	public final void reduzirDiametro(int x){
		diametrokm-=x;
	}
	abstract void incrementarDia(int horas);
	public Mundo(){
		diametrokm=0; dia=0;
	}
	public Mundo(int x, double y){
		diametrokm=x; dia=y;
	}
}

			