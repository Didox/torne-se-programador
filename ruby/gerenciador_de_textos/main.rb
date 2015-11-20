require File.expand_path('../lib/texto_parser', __FILE__)
require File.expand_path('../model/marcacao', __FILE__)
require File.expand_path('../model/texto', __FILE__)

puts "digite o texto"
texto = gets

texto = TextoParser.parser(texto)

puts "a quantidade de marcacoes que tem no texto que vc digitou é: " + texto.marcacoes.size.to_s

puts "e as marcacoes são:"
texto.marcacoes.each do |marcacao|
	puts marcacao.valor
end