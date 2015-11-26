
#dado que eu tenho tres variáveis, 
#com os valores 3,5,8, depois mostro 'digite seu nome', 
#depois leio o nome, depois mostro 'seu nome é' concatenando o nome,
#'e os valores secretos são' concatenando os valores secretos
#e mostro os numeros das tres variáveis, 
# crie o algorítimo e o teste de mesa para seu nome

 

a = 3
b = 5
c = 8


puts('Digite seu nome')
nome = gets

puts('seu nome é ' + nome + ' e os valores secretos são:' + a.to_s + ',' + b.to_s + ',' + c.to_s)