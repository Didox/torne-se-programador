require File.expand_path('../pessoa', __FILE__)

class Joao < Pessoa
	def initialize(cpf)
		@cpf = cpf
	end

	attr_accessor :cpf

	# override de euSou - polimorfismo
	def eu_sou
		puts("eu sou joao")
	end

	# override de metodoSobresquever usando tb o retorno original
	def metodo_sobresquever
		puts("sobresquevi")
		super
	end
end