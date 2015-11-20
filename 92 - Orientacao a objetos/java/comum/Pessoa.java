public class Pessoa{
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




	//metodos publicos
	public void euSou(){
		System.out.println("eu sou pessoa");
	}
	//agregando metodos
	public void euSou(String nome){
		System.out.println("eu sou " + nome);
	}

	public void metodoSobresquever(){
		System.out.println("Metodo original");
	}




	//metodos privados
	private String concatenaNomes(){
		return this.nome + " " + this.sobrenome;
	}




	//metodos protegidos
	protected String nomeCompletoComCPF(){
		return this.nome + " " + this.sobrenome + ", CPF: " + this.cpf;
	}




	//metodos staticos
	public static String oQueEuSou(){
		return "Eu sou uma classe que herda de Pessoa";
	}
}