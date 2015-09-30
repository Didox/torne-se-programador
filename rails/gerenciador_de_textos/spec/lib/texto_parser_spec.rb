require 'rspec'
require File.expand_path('../../../model/marcacao', __FILE__)
require File.expand_path('../../../model/texto', __FILE__)
require File.expand_path('../../../lib/texto_parser', __FILE__)

describe TextoParser do
	describe 'parser' do
		it 'retornar um objeto texto com as marcações' do
			string = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to <b>make a type specimen book. It has survived not only five centuries</b>, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more <b>recently with desktop publishing</b> software like Aldus PageMaker including versions of Lorem Ipsum."
			retorno = TextoParser.parser(string)

			expect(retorno.class).to eq(Texto)
			expect(retorno.conteudo).to eq(string)

			expect(retorno.marcacoes.size).to eq(2)

			expect(retorno.marcacoes[0].class).to eq(Marcacao)
			expect(retorno.marcacoes[1].class).to eq(Marcacao)

			expect(retorno.marcacoes[0].valor).to eq("<b>make a type specimen book. It has survived not only five centuries</b>")
			expect(retorno.marcacoes[1].valor).to eq("<b>recently with desktop publishing</b>")
		end
	end	
end