abstract class Pessoa{
	//construtor
	public Pessoa(){
		this.nome_temp = "tmp nome";
	}

	//atributos publicos
	public String nome;
	public String sobrenome;
	public String cpf;

	//atributos privados
	private String nome_temp;

	//metodos para sobrescrever
	abstract public void escreveNome();

	// metodos que não pode ser sobrescrito
	public final String nomeCompleto(){
		return this.concatenaNomes();
	}

	//protegidos
	protected String nomeCompletoComCPF(){
		return this.nome + " " + this.sobrenome + ", CPF: " + this.cpf;
	}

	//privados
	private String concatenaNomes(){
		return this.nome + " " + this.sobrenome;
	}

	//metodos staticos
	public static String oQueEuSou(){
		return "Eu sou uma classe que herda de Pessoa";
	}
}