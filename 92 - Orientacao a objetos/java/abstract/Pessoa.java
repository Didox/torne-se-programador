abstract class Pessoa{
	//atributos publicos
	public String nome;

	//metodos publicos
	public String falar(){
		return "oi";
	}

	//metodos para sobrescrever
	abstract public void escreveNome();
}