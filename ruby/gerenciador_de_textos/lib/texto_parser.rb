class TextoParser
	def self.parser(string)
		texto = Texto.new
		texto.conteudo = string
		texto
	end
end