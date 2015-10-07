// class Joao implements Animal{
class Joao extends Pessoa{

	//construtor
	public Joao(){}
	public Joao(String cpf){
		this.cpf = cpf;
	}

	public void escreveNome(){
		System.out.println("O nome é: " + this);
	}

	// public String nomeCompleto(){
	// 	return "implements nomeCompleto";
	// }

	public void completo(){
		System.out.println(this.nomeCompletoComCPF());
	}
}