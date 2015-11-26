class Singleton{
	private Singleton(){}

	private static Singleton instancia;
	public String attr = "tetse";


	public static void criarInstancia(){
		instancia = new Singleton();
	}

	public static Singleton getInstancia(){
		return instancia;
	}
}