class Exec{
	public static void main(String[]args){
		// é o mostre que ensinei nos algoritimos
		System.out.println("Digite o CPF");
		String cpf = System.console().readLine(); // leia que mostrei nos algoritimos;
		System.out.printf("\n\n\n");

		Joao j = new Joao(cpf);
		System.out.println("CPF digitado" + j.cpf);
		j.euSou();

		// utilizando metodos agregados
		j.euSou("danilo agregado");


		System.out.println("==========================");

		j.metodoSobresquever();
		
		System.out.println("==========================");

		Joao.oQueEuSou();
		// j.nome = "João";
		// j.sobrenome = "da silva";
		// //j.cpf = "448.2339.566-08";

		// System.out.println(j.nomeCompleto());
		// j.completo();

		// //exec static
		// System.out.println(Joao.oQueEuSou());
	}
}