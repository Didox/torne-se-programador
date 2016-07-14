require 'rspec'
require File.expand_path('../../../model/texto', __FILE__)

describe Texto do
	describe 'instancia' do
		it 'com os atributos de instancia' do
			texto = Texto.new
			expect(texto.respond_to?(:titulo)).to be true
			expect(texto.respond_to?(:conteudo)).to be true

			texto.titulo = "titulo"
			expect(texto.titulo).to eq("titulo")

			texto.conteudo = "conteudo"
			expect(texto.conteudo).to eq("conteudo")
		end
	end	
end