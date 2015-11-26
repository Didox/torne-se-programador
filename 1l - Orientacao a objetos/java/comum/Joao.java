// class Joao herda de pessoa{
class Joao extends Pessoa{

	//construtor
	public Joao(){}
	public Joao(String cpf){
		this.cpf = cpf;
	}

	public static final String CONSTANTE = "valor fixo";

	// override de euSou - polimorfismo
	public void euSou(){
		System.out.println("eu sou joao");
	}

	// override de metodoSobresquever usando tb o retorno original
	public void metodoSobresquever(){
		System.out.println("sobresquevi");
		super.metodoSobresquever();
	}
}