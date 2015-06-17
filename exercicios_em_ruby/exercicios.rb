#LISTA DE EXERCICIO 1 

#ESTRUTURA SEQUENCIAL

#1)
puts("Digite um numero")
a = $stdin.readline.to_i
puts("Digite um numero")
b = $stdin.readline.to_i
c = a - b
puts("A subitração é: " + c.to_s)

#2)
puts("Digite um numero")
a = $stdin.readline.to_i
puts("Digite um numero")
b = $stdin.readline.to_i
puts("Digite um numero")
c = $stdin.readline.to_i
c = a * b * c
puts(c.to_s)
puts("A multiplicação dos três numeros é: " + c.to_s)

#3)
puts("Digite um numero")
a = $stdin.readline.to_i
puts("Digite um numero que não seja zero")
b = $stdin.readline.to_i
c = a / b
puts(c.to_s)
puts("A divisão é: " + c.to_s)

#4) 
puts("Digite uma nota")
nota1 = $stdin.readline.to_i
puts("Digite outra nota")
nota2 = $stdin.readline.to_i
pesonota1 = 2
pesonota2 = 3
media = (nota1 * pesonota1 + nota2 * pesonota2) / (pesonota1 + pesonota2)
puts(media.to_s)
puts("A média ponderada é: " + c.to_s)

#5) 
puts("Digite o preço do produto")
preco = $stdin.readline.to_f
desconto = (preco * 10) / 100
puts("O desconto de 10% do preço é: " + (preco - desconto).to_s)

#6)
puts("Digite o seu salário")
salario = $stdin.readline.to_f
puts("Digite o valor de suas vendas")
vendas = $stdin.readline.to_f
comissao = (vendas * 4) / 100
puts("O valor de sua comissão é: " + comissao.to_s)
puts("Seu salário com a comissão é: " + (comissao + salario).to_s)

#7)
puts("Digite seu peso")
peso = $stdin.readline.to_i
peso_engordo = ((peso * 15) / 100) + peso
peso_emagreco = peso - ((peso * 20) / 100)
puts("Seu peso se você engordar 15% é de: " + peso_engordo.to_s)
puts("Seu peso se você emagrecer 20% é de: " + peso_emagreco.to_s)

#8)
puts("Digite seu peso")
peso = $stdin.readline.to_i
puts("Seu peso em gramas é de: " + (peso*1000).to_s)

#9)
#10)
#11)

#12)
puts("Digite o valor do salario minimo")
salario_m = $stdin.readline.to_f
puts("Digite o valor de seu salario")
salario = $stdin.readline.to_f
quantidade = salario / salario_m
puts("Voce ganha " + quantidade.to_s + " salarios minimos")

#13)
puts("Digite o numero da taboada")
numero = $stdin.readline.to_i
puts(numero.to_s + " X 1:" + (numero*1).to_s)
puts(numero.to_s + " X 2:" + (numero*2).to_s)
puts(numero.to_s + " X 3:" + (numero*3).to_s)
puts(numero.to_s + " X 4:" + (numero*4).to_s)
puts(numero.to_s + " X 5:" + (numero*5).to_s)
puts(numero.to_s + " X 6:" + (numero*6).to_s)
puts(numero.to_s + " X 7:" + (numero*7).to_s)
puts(numero.to_s + " X 8:" + (numero*8).to_s)
puts(numero.to_s + " X 9:" + (numero*9).to_s)
puts(numero.to_s + " X 10:" + (numero*10).to_s)

#14
puts("Digite o seu ano de nascimento")
ano_pessoa = $stdin.readline.to_i
puts("Digite o ano atual")
ano_atual = $stdin.readline.to_i
anos = ano_atual - ano_pessoa
puts("a idade em anos é: " + anos.to_s)
meses = anos * 12
puts("a idade em meses é: " + meses.to_s)
dias = anos * 365
puts("a idade em dias é: " + dias.to_s)
semanas = anos * (365 / 7)
puts("a idade em semanas é: " + semanas.to_s)

#15)
puts("Digite o salario de joao")
salario = $stdin.readline.to_f
puts("Digite o valor da primeira conta atrazada")
c1 = $stdin.readline.to_f
puts("Digite o valor da segunda conta atrazada")
c2 = $stdin.readline.to_f
multa1 = (c1*2) / 100
multa2 = (c2*2) / 100
sobra = salario - ((c1 + multa1) + (c2 + multa2))
puts("A sobra de seu salario é de: " + sobra)

#16)
#17)
#18)
#19)
#20)
#21)
#22)
#23)

#24)
puts("Digite o valor do dinheiro em reais")
reais = $stdin.readline.to_f
dolar = 1.80
marco = 2.00
libra = 1.57
puts("O valor convertido em dolar é: " + (reais * dolar).to_s)
puts("O valor convertido em marco alemao é: " + (reais * marco).to_s)
puts("O valor convertido em libra esterlina é: " + (reais * libra).to_s)

#25)
puts("Digite uma hora")
hora = $stdin.readline.to_i
puts("Digite minutos")
minutos = $stdin.readline.to_i

minutos_convertidos = hora * 60
total_convertidos = minutos_convertidos + minutos

puts("A hora convertido em minutos é: " + minutos_convertidos.to_s)
puts("O total de minutos é: " + total_convertidos.to_s)
puts("O total de minutos convertidos em segundos é: " + (total_convertidos * 60).to_s)

#LISTA DE EXERCICIO 2

#ESTRUTURA CONDICIONAL
#1)
puts("Digite a primeira nota")
n1 = $stdin.readline.to_i
puts("Digite a segunda nota")
n2 = $stdin.readline.to_i
puts("Digite a terceira nota")
n3 = $stdin.readline.to_i
puts("Digite a quarta nota")
n4 = $stdin.readline.to_i

media = (n1+n2+n3+n4) / 4

if(media >=7 )
  puts("Aluno aprovado, sua nota foi: " + media.to_s)
else
  puts("Aluno reprovado, sua nota foi: " + media.to_s)
end

#2)
puts("Digite a primeira nota")
n1 = $stdin.readline.to_i
puts("Digite a segunda nota")
n2 = $stdin.readline.to_i
media = (n1+n2) / 2

if(media >=7 )
  puts("Aluno aprovado, sua nota foi: " + media.to_s)
elsif(media >=4 )
  puts("Aluno de exame, sua nota foi: " + media.to_s)
else
  puts("Aluno reprovado, sua nota foi: " + media.to_s)
end

#3)
puts("Digite um numero")
n1 = $stdin.readline.to_i
puts("Digite outro numero")
n2 = $stdin.readline.to_i

if(n1 < n2)
  puts(n1.to_s + " é o numero menor")
elsif(n2 < n1)
  puts(n2.to_s + " é o numero menor")
else
  puts("os numeros são iguais")
end

#4)
puts("Digite um numero")
n1 = $stdin.readline.to_i
puts("Digite outro numero")
n2 = $stdin.readline.to_i

if(n1 > n2)
  puts(n1.to_s + " é o numero maior")
elsif(n2 > n1)
  puts(n2.to_s + " é o numero maior")
else
  puts("os numeros são iguais")
end

#5)
puts("Digite um numero")
n1 = $stdin.readline.to_i
puts("Digite outro numero")
n2 = $stdin.readline.to_i

if(n1 == 1)
  puts("a média entre os dos numeros é: " + ((n1+n2) / 2).to_s)
elsif(n1 == 2)
  diferenca = 0
  if(n1>=n2)
    diferenca = n1-n2
  else
    diferenca = n2-n1
  end
  puts("A diferença do maior pelo menor é: " + diferenca.to_s)
elsif(n1 == 3)
  puts("o produto entre os numeros é: " + )
elsif(n1 == 4)
  puts("a divisão do primeiro pelo segundo é: " + (n1/n2).to_s)
else
  puts("opção inválida")
end































