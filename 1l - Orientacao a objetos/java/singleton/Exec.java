class Exec{
	public static void main(String[]args){
		// exec interface
		//Singleton i = new Singleton();
		Singleton.criarInstancia();
		String a = Singleton.getInstancia().attr;
		System.out.println(a);
	}
}