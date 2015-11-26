// class implementa interface Animal{
class Cachorro implements Animal{

	public void escreverNome(){
		System.out.println("O nome é: " + this);
	}

	public String nomeCompleto(){
		return "implements nomeCompleto";
	}
}