class Texto
	def titulo
		@titulo
	end

	def titulo=(titulo)
		@titulo = titulo
	end

	def conteudo
		@conteudo
	end

	def conteudo=(conteudo)
		@conteudo = conteudo
	end

	def marcacoes
		marcacoes = []
		@conteudo.scan(/<b.*?<\/b>/).each do |valor|
			m = Marcacao.new
			m.valor = valor
			marcacoes << m
		end

		marcacoes
	end
end