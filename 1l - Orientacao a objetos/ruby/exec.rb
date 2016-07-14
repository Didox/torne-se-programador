require File.expand_path('../joao', __FILE__)

# é o mostre que ensinei nos algoritimos
puts("Digite o CPF")
cpf = gets #leia que mostrei nos algoritimos;
puts("\n\n\n")

j = Joao.new(cpf)

j.nome = "sss"
puts j.nome

puts("CPF digitado" + j.cpf)
j.eu_sou()

puts("==========================");

j.metodo_sobresquever();

puts("==========================");

Joao.o_que_eu_sou();