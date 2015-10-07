class Exec{
	public static void main(String[]args){
		//exec instance
		Joao j = new Joao("448.2339.566-08");
		j.nome = "João";
		j.sobrenome = "da silva";
		//j.cpf = "448.2339.566-08";

		System.out.println(j.nomeCompleto());
		j.completo();

		//exec static
		System.out.println(Joao.oQueEuSou());
	}
}