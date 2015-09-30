require 'rspec'
require File.expand_path('../../../model/marcacao', __FILE__)

describe Marcacao do
	describe 'instancia' do
		it 'com os atributos de instancia' do
			marcacao = Marcacao.new
			expect(marcacao.respond_to?(:valor)).to be true

			marcacao.valor = "danilo"
			expect(marcacao.valor).to eq("danilo")
		end
	end	
end