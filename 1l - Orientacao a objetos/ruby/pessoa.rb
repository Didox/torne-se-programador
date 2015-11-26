class Pessoa
	def initialize
		@nome_temp = "tmp nome"
	end

	public
	#atributos publicos
	attr_accessor :nome, :sobrenome, :cpf


	#atributos privados
	private 
	attr_accessor :nome_temp




	#metodos publicos
	public 
	def eu_sou
		puts("eu sou pessoa")
	end
	def metodo_sobresquever
		puts("Metodo original")
	end




	#metodos privados
	private 
	def concatenaNomes
		return self.nome + " " + self.sobrenome
	end




	#metodos protegidos
	protected 
	def nomeCompletoComCPF
		return self.nome + " " + self.sobrenome + ", CPF: " + self.cpf
	end




	#metodos staticos
	def self.o_que_eu_sou()
		return "Eu sou uma classe que herda de Pessoa"
	end
end