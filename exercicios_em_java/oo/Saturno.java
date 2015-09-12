class Saturno extends Mundo{
	public final int aneis=20;
	public void incrementarDia(int horas){
		dia+=(horas/200);
	}
	public Saturno(int x, double y){
		dia=x+y;
	}
}
