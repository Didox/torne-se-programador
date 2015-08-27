################################################################################
#LISTA DE EXERCICIO 1 

#ESTRUTURA SEQUENCIAL
################################################################################
#1)
puts("Digite um numero")
a = gets.to_i
puts("Digite um numero")
b = gets.to_i
c = a - b
puts("A subitração é: " + c.to_s)

#2)
puts("Digite um numero")
a = gets.to_i
puts("Digite um numero")
b = gets.to_i
puts("Digite um numero")
c = gets.to_i
c = a * b * c
puts(c.to_s)
puts("A multiplicação dos três numeros é: " + c.to_s)

#3)
puts("Digite um numero")
a = gets.to_i
puts("Digite um numero que não seja zero")
b = gets.to_i
c = a / b
puts(c.to_s)
puts("A divisão é: " + c.to_s)

#4) 
puts("Digite uma nota")
nota1 = gets.to_i
puts("Digite outra nota")
nota2 = gets.to_i
pesonota1 = 2
pesonota2 = 3
media = (nota1 * pesonota1 + nota2 * pesonota2) / (pesonota1 + pesonota2)
puts(media.to_s)
puts("A média ponderada é: " + c.to_s)

#5) 
puts("Digite o preço do produto")
preco = gets.to_f
desconto = (preco * 10) / 100
puts("O desconto de 10% do preço é: " + (preco - desconto).to_s)

#6)
puts("Digite o seu salário")
salario = gets.to_f
puts("Digite o valor de suas vendas")
vendas = gets.to_f
comissao = (vendas * 4) / 100
puts("O valor de sua comissão é: " + comissao.to_s)
puts("Seu salário com a comissão é: " + (comissao + salario).to_s)

#7)
puts("Digite seu peso")
peso = gets.to_i
peso_engordo = ((peso * 15) / 100) + peso
peso_emagreco = peso - ((peso * 20) / 100)
puts("Seu peso se você engordar 15% é de: " + peso_engordo.to_s)
puts("Seu peso se você emagrecer 20% é de: " + peso_emagreco.to_s)

#8)
puts("Digite seu peso")
peso = gets.to_i
puts("Seu peso em gramas é de: " + (peso*1000).to_s)

#9)
#10)
#11)

#12)
puts("Digite o valor do salario minimo")
salario_m = gets.to_f
puts("Digite o valor de seu salario")
salario = gets.to_f
quantidade = salario / salario_m
puts("Voce ganha " + quantidade.to_s + " salarios minimos")

#13)
puts("Digite o numero da taboada")
numero = gets.to_i
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
ano_pessoa = gets.to_i
puts("Digite o ano atual")
ano_atual = gets.to_i
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
salario = gets.to_f
puts("Digite o valor da primeira conta atrazada")
c1 = gets.to_f
puts("Digite o valor da segunda conta atrazada")
c2 = gets.to_f
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
reais = gets.to_f
dolar = 1.80
marco = 2.00
libra = 1.57
puts("O valor convertido em dolar é: " + (reais * dolar).to_s)
puts("O valor convertido em marco alemao é: " + (reais * marco).to_s)
puts("O valor convertido em libra esterlina é: " + (reais * libra).to_s)

#25)
puts("Digite uma hora")
hora = gets.to_i
puts("Digite minutos")
minutos = gets.to_i

minutos_convertidos = hora * 60
total_convertidos = minutos_convertidos + minutos

puts("A hora convertido em minutos é: " + minutos_convertidos.to_s)
puts("O total de minutos é: " + total_convertidos.to_s)
puts("O total de minutos convertidos em segundos é: " + (total_convertidos * 60).to_s)

################################################################################
#LISTA DE EXERCICIO 2

#ESTRUTURA CONDICIONAL
################################################################################
#1)
puts("Digite a primeira nota")
n1 = gets.to_i
puts("Digite a segunda nota")
n2 = gets.to_i
puts("Digite a terceira nota")
n3 = gets.to_i
puts("Digite a quarta nota")
n4 = gets.to_i

media = (n1+n2+n3+n4) / 4

if(media >=7 )
  puts("Aluno aprovado, sua nota foi: " + media.to_s)
else
  puts("Aluno reprovado, sua nota foi: " + media.to_s)
end

#2)
puts("Digite a primeira nota")
n1 = gets.to_i
puts("Digite a segunda nota")
n2 = gets.to_i
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
n1 = gets.to_i
puts("Digite outro numero")
n2 = gets.to_i

if(n1 < n2)
  puts(n1.to_s + " é o numero menor")
elsif(n2 < n1)
  puts(n2.to_s + " é o numero menor")
else
  puts("os numeros são iguais")
end

#4)
puts("Digite um numero")
n1 = gets.to_i
puts("Digite outro numero")
n2 = gets.to_i

if(n1 > n2)
  puts(n1.to_s + " é o numero maior")
elsif(n2 > n1)
  puts(n2.to_s + " é o numero maior")
else
  puts("os numeros são iguais")
end

#5)
puts("Digite um numero")
n1 = gets.to_i
puts("Digite outro numero")
n2 = gets.to_i

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
  puts("o produto entre os numeros é: " + (n1*n2).to_s )
elsif(n1 == 4)
  if(n2 == 0)
    puts("O segundo numero não pode ser zero")
  else
    puts("a divisão do primeiro pelo segundo é: " + (n1/n2).to_s)
  end
else
  puts("opção inválida")
end

#6)
puts("Digite um numero")
n1 = gets.to_i
puts("Digite outro numero")
n2 = gets.to_i

case n1
when 1
  puts("a média entre os dos numeros é: " + ((n1+n2) / 2).to_s)
when 2
  diferenca = 0
  if(n1>=n2)
    diferenca = n1-n2
  else
    diferenca = n2-n1
  end
  puts("A diferença do maior pelo menor é: " + diferenca.to_s)
when 3
  puts("o produto entre os numeros é: " + (n1*n2).to_s )
else
  puts("opção inválida")
end

#7)
puts("Digite seu salario")
salario = gets.to_f
if(salario < 500)
  porcentagem = (salario * 30) / 100
  puts("Seu salario com aumento é: " + (salario + porcentagem).to_s)
else
  puts("Invelizmente você não terá aumento")
end

#8)
puts("Digite seu salario")
salario = gets.to_f
if(salario <= 300)
  porcentagem = (salario * 35) / 100
  puts("Você teve um aumento de 35%, seu salario com aumento é: " + (salario + porcentagem).to_s)
else
  porcentagem = (salario * 15) / 100
  puts("Você teve um aumento de 15%, seu salário com aumento é: " + (salario + porcentagem).to_s)
end

#9)
puts("Digite seu saldo médio")
saldo = gets.to_i
if(saldo <= 200)
  porcentagem = (saldo * 10) / 100
  puts("O saldo médio é de: #{(saldo + porcentagem)} e o valor do credito é de 10%: #{porcentagem}")
elsif(saldo <= 300)
  porcentagem = (saldo * 20) / 100
  puts("O saldo médio é de: #{(saldo + porcentagem)} e o valor do credito é de 20%: #{porcentagem}")
elsif(saldo <= 400)
  porcentagem = (saldo * 25) / 100
  puts("O saldo médio é de: #{(saldo + porcentagem)} e o valor do credito é de 25%: #{porcentagem}")
else
  porcentagem = (saldo * 30) / 100
  puts("O saldo médio é de: #{(saldo + porcentagem)} e o valor do credito é de 30%: #{porcentagem}")
end

#10)
puts("Digite o custo de fabrica de um carro")
custo_de_fabrica = gets.to_i
if(custo_de_fabrica <= 12000)
  porcentagem_distribuidor = (custo_de_fabrica * 5) / 100
  impostos = 0
  puts("O custo para o consumidor é de: " + (custo_de_fabrica + porcentagem_distribuidor + impostos).to_s)
elsif(custo_de_fabrica <= 25000)
  porcentagem_distribuidor = (custo_de_fabrica * 10) / 100
  impostos = (custo_de_fabrica * 15) / 100
  puts("O custo para o consumidor é de: " + (custo_de_fabrica + porcentagem_distribuidor + impostos).to_s)
else
  porcentagem_distribuidor = (custo_de_fabrica * 15) / 100
  impostos = (custo_de_fabrica * 20) / 100
  puts("O custo para o consumidor é de: " + (custo_de_fabrica + porcentagem_distribuidor + impostos).to_s)
end

#11)
puts("Digite seu salario")
salario = gets.to_f
if(salario <= 300)
  porcentagem = (salario * 15) / 100
  puts("Você teve um aumento de 15%, seu salario com aumento é: " + (salario + porcentagem).to_s)
elsif(salario <= 600)
  porcentagem = (salario * 10) / 100
  puts("Você teve um aumento de 10%, seu salario com aumento é: " + (salario + porcentagem).to_s)
elsif(salario <= 900)
  porcentagem = (salario * 5) / 100
  puts("Você teve um aumento de 5%, seu salario com aumento é: " + (salario + porcentagem).to_s)
else
  puts("Você teve um aumento de 0%, seu salário com aumento é: " + salario.to_s)
end

#12)
puts("Digite seu salario")
salario = gets.to_f
if(salario <= 350)
  porcentagem = (salario * 7) / 100
  gratificacao = 100
  puts("Você teve uma gratificação de #{gratificacao}, seu salario menos imposto é de: " + ((salario - porcentagem) + gratificacao).to_s)
elsif(salario <= 600)
  porcentagem = (salario * 7) / 100
  gratificacao = 75
  puts("Você teve uma gratificação de #{gratificacao}, seu salario menos imposto é de: " + ((salario - porcentagem) + gratificacao).to_s)
elsif(salario <= 900)
  porcentagem = (salario * 7) / 100
  gratificacao = 50
  puts("Você teve uma gratificação de #{gratificacao}, seu salario menos imposto é de: " + ((salario - porcentagem) + gratificacao).to_s)
else
  porcentagem = (salario * 7) / 100
  gratificacao = 35
  puts("Você teve uma gratificação de #{gratificacao}, seu salario menos imposto é de: " + ((salario - porcentagem) + gratificacao).to_s)
end

#13)
puts("Digite o preço do produto")
preco = gets.to_f
if(preco <= 50)
  porcentagem = (preco * 5) / 100
  novo_preco = preco + porcentagem
elsif(preco <= 100)
  porcentagem = (preco * 10) / 100
  novo_preco = preco + porcentagem
else
  porcentagem = (preco * 15) / 100
  novo_preco = preco + porcentagem
end

if(novo_preco <= 80)
  puts("O preco do produto #{novo_preco.to_s}, classificação: barato")
elsif(novo_preco <= 120)
  puts("O preco do produto #{novo_preco.to_s}, classificação: normal")
elsif(novo_preco <= 200)
  puts("O preco do produto #{novo_preco.to_s}, classificação: caro")
elsif(novo_preco > 200)
  puts("O preco do produto #{novo_preco.to_s}, classificação: muito caro")
end


#14)
puts("Digite seu salario")
salario = gets.to_f
if(salario <= 300)
  porcentagem = (salario * 50) / 100
  novo_salario = salario + porcentagem
elsif(salario <= 500)
  porcentagem = (salario * 40) / 100
  novo_salario = salario + porcentagem
elsif(salario <= 700)
  porcentagem = (salario * 30) / 100
  novo_salario = salario + porcentagem
elsif(salario <= 800)
  porcentagem = (salario * 20) / 100
  novo_salario = salario + porcentagem
elsif(salario <= 1000)
  porcentagem = (salario * 10) / 100
  novo_salario = salario + porcentagem
else
  porcentagem = (salario * 5) / 100
  novo_salario = salario + porcentagem
end

puts("Seu novo salário com aumento é: " + novo_salario.to_s)

#15)
puts("Digite o tipo de investimento")
puts("(1) - Poupança")
puts("(2) - Fundos de renda fixa")
tipo = gets.to_i
puts("Digite o valor")
valor = gets.to_f
if(tipo == 1)
  porcentagem = (valor * 3) / 100
  valor = valor + porcentagem
  puts("Seu valor corrigido é: " + valor.to_s)
elsif(tipo == 2)
  porcentagem = (valor * 4) / 100
  valor = valor + porcentagem
  puts("Seu valor corrigido é: " + valor.to_s)
else
  puts("Opção inválida seu valor é: " + valor.to_s)
end

#16)
puts("Digite o preço")
preco = gets.to_f
if(preco <= 30)
  puts("Preço: #{preco}, sem desconto, preço novo: #{preco}")
elsif(preco <= 100)
  porcentagem = (preco * 10) / 100
  novo_preco = preco - porcentagem
  puts("Preço: #{preco}, desconto: #{porcentagem}, preço novo: #{novo_preco}")
elsif(preco > 100)
  porcentagem = (preco * 15) / 100
  novo_preco = preco - porcentagem
  puts("Preço: #{preco}, desconto: #{porcentagem}, preço novo: #{novo_preco}")
end

#17)
puts("Digite sua senha")
senha = gets
if(senha.strip == "4531")
  puts("Acesso concedido")
else
  puts("Senha inválida")
end

#18)
puts("Digite sua idade")
idade = gets.to_i
if(idade >= 18)
  puts("Você atingiu a maioridade")
else
  puts("Você é de menor")
end

#19)
puts("Digite sua altura")
altura = gets.to_i
puts("Digite seu sexo")
sexo = gets

if(sexo.strip == "masculino")
  peso = (72.7*altura) - 58
  puts("Seu peso ideal é: #{peso.to_s}")
elsif(sexo.strip == "feminino")
  peso = (62.1*altura) - 44.7
  puts("Seu peso ideal é: #{peso.to_s}")
else
  puts("digite masculino ou feminino para calcular peso")
end

#20)
puts("Digite a idade do nadador")
idade = gets.to_i
if(idade >= 5 && idade <= 7)
  puts("Infantil")
elsif(idade >= 8 && idade <= 10)
  puts("Juvenil")
elsif(idade >= 11 && idade <= 15)
  puts("Adolescente")
elsif(idade >= 16 && idade <= 30)
  puts("Adulto")
elsif(idade > 30)
  puts("Sênior")
end

#21)
puts("Digite o preço do produto")
preco = gets.to_f
puts("Digite o código de origem")
origem = gets.to_i

procedencia = ""

if(origem == 1)
  procedencia = "Sul"
elsif(origem == 2)
  procedencia = "Norte"
elsif(origem == 3)
  procedencia = "Leste"
elsif(origem == 4)
  procedencia = "Oeste"
elsif(origem == 5 || origem == 6)
  procedencia = "Nordeste"
elsif(origem == 7 || origem == 8 || origem == 9)
  procedencia = "Sudeste"
elsif(origem >= 10 && origem <= 20)
  procedencia = "Centro-oeste"
elsif(origem >= 21 && origem <= 30)
  procedencia = "Noroeste"
end

puts("Preço do produto " + preco.to_s + ", procedência " + procedencia)

#22)
puts("Digite sua idade")
idade = gets.to_i
puts("Digite seu peso")
peso = gets.to_i

if(idade < 20)
  if(peso <= 60)
    puts("Você se encontra no risco 9")
  elsif(peso >= 60 && peso <= 90)
    puts("Você se encontra no risco 8")
  elsif(peso > 90)
    puts("Você se encontra no risco 7")
  end
elsif(idade >= 20 && idade <= 50)
  if(peso <= 60)
    puts("Você se encontra no risco 6")
  elsif(peso >= 60 && peso <= 90)
    puts("Você se encontra no risco 5")
  elsif(peso > 90)
    puts("Você se encontra no risco 4")
  end
elsif(idade > 50)
  if(peso <= 60)
    puts("Você se encontra no risco 3")
  elsif(peso >= 60 && peso <= 90)
    puts("Você se encontra no risco 2")
  elsif(peso > 90)
    puts("Você se encontra no risco 1")
  end
end

#23)
puts("Digite o código do produto")
codigo = gets.to_i
puts("Digite a quantidade")
quantidade = gets.to_i

preco = 0
if(codigo >= 1 && codigo <= 10)
  preco = 10
elsif(codigo >= 11 && codigo <= 20)
  preco = 15
elsif(codigo >= 21 && codigo <= 30)
  preco = 20
elsif(codigo >= 31 && codigo <= 40)
  preco = 30
else
  puts("Código do produto inválido")
end

if(preco > 0)
  preco_total = preco * quantidade

  desconto = 0
  if(preco_total >= 250)
    desconto = (preco_total*5) / 100
  elsif(preco_total >= 250 && preco_total <= 500)
    desconto = (preco_total*10) / 100
  elsif(preco_total > 500)
    desconto = (preco_total*15) / 100
  end

  puts("O preço unitário do produto é: #{preco.to_s}")
  puts("O preço total é: #{preco_total.to_s}")
  puts("Desconto de: #{desconto.to_s}")
  puts("O preço final com desconto é: #{(preco_total - desconto).to_s}")
end

#24)
puts("Digite o preço")
preco = gets.to_f
puts("Digite a categoria 1,2,3")
categoria = gets.to_i
puts("Digite a situação R,N")
situacao = gets.strip

if(categoria == 1 || categoria == 2 || categoria == 3)
  if(situacao == "R" || situacao == "N" )
    aumento = 0
    if(preco <= 25)
      case categoria
      when 1
        aumento = (preco * 5) / 100
      when 2
        aumento = (preco * 8) / 100
      when 3
        aumento = (preco * 10) / 100
      end
    elsif(preco > 25)
      case categoria
      when 1
        aumento = (preco * 12) / 100
      when 2
        aumento = (preco * 15) / 100
      when 3
        aumento = (preco * 18) / 100
      end
    end

    imposto = 0
    if(categoria == 2 && situacao == "R")
      imposto = (preco * 5) / 100
    else
      imposto = (preco * 8) / 100
    end

    novo_preco = preco + aumento - imposto
    if(novo_preco <= 50)
      puts("Barato")
    elsif(novo_preco >= 50 && novo_preco <= 120)
      puts("Normal")
    elsif(novo_preco > 120)
      puts("Caro")
    end
  else
    puts("Situação inválida")
  end
else
  puts("Categoria inválida")
end

#25)
puts("Digite a quantidade de horas extras")
extras = gets.to_i
puts("Digite a quantidade de horas faltas")
faltas = gets.to_i

h = extras - 2/3 * faltas

if(h > 2400)
  puts("Sua gratificação é de R$ 500,00")
elsif(h >= 1800 && h < 2400)
  puts("Sua gratificação é de R$ 400,00")
elsif(h >= 600 && h < 1200)
  puts("Sua gratificação é de R$ 200,00")
elsif(h < 600)
  puts("Sua gratificação é de R$ 100,00")
end


################################################################################
#LISTA DE EXERCICIO 3

#ESTRUTURA DE REPETIÇÃO
################################################################################

#9)
puts("Digite um numero")
numero = gets.to_i
puts("Taboada é:")
(1..10).each do |x| 
  puts("#{numero} X #{x} = #{(numero*x).to_s}")
end

#10)
(1..10).each do |i| 
  puts("Taboada do #{i} é:")
  (1..10).each do |x| 
    puts("#{i} X #{x} = #{(i*x).to_s}")
  end
end

#11)
valor_vista = 0
valor_prazo = 0

(1..15).each do |i| 
  puts("Digite o código da transação V,P")
  transacao = gets.strip
  puts("Digite o valor")
  valor = gets.to_f
  if(transacao == "V")
    valor_vista += valor
  elsif(transacao == "P")
    valor_prazo += valor
  end
end

puts("Valor total a vista #{valor_vista.to_s}")
puts("Valor total a prazo #{valor_prazo.to_s}")
puts("Valor total #{(valor_vista + valor_prazo).to_s}")
puts("Valor da primeira prestação a prazo é #{(valor_prazo / 3).to_s}")

#12)
idade_mais_50_anos = 0
quantidade_10_20_anos = 0
altura_10_20_anos = 0
quantidade_inverior_40_quilos = 0
media_inverior_40_quilos = 0
todas_pessoas = 0

(1..25).each do |i| 
  puts("Digite a idade")
  idade = gets.to_i
  puts("Digite a altura")
  altura = gets.to_f
  puts("Digite a peso")
  peso = gets.to_f

  if(idade > 50)
    idade_mais_50_anos += 1
  elsif(idade >= 10 && idade <= 20)
    quantidade_10_20_anos += 1
    altura_10_20_anos += altura
  end
  
  if(peso < 40)
    quantidade_inverior_40_quilos += 1
  end

  todas_pessoas = i
end

puts("Pessoas com mais de 50 anos: #{idade_mais_50_anos.to_s}")

media_10_20_anos  = altura_10_20_anos / quantidade_10_20_anos
puts("A média das alturas das pessoas entre 10 a 20 anos: #{media_10_20_anos.to_s}")

quantidade_inverior_40_quilos = 1
todas_pessoas = 3

porcentagem = quantidade_inverior_40_quilos.to_f / todas_pessoas.to_f * 100
puts("A porcentagem de pessoas com peso inferior a 40 quilos é: #{porcentagem.to_s}%")

#13)
idade_mais_90_quilos = 0
idades = 0
todas_pessoas = 0

(1..7).each do |i| 
  puts("Digite a idade")
  idade = gets.to_i
  puts("Digite a peso")
  peso = gets.to_i

  if(peso > 90)
    idade_mais_90_quilos += 1
  end
  
  idades += idade
  todas_pessoas = i
end

puts("Pessoas com mais de 90 quilos: #{idade_mais_90_quilos.to_s}")
puts("Média de idade das pessoas: #{(idades / todas_pessoas).to_s}")


#14)
idade_superior_50_peso_inferior_60 = 0
qtd_inferior_peso_1_50 = 0
idades_inferior_peso_1_50 = 0
todas_pessoas = 0
qtd_olhos_azuis = 0
qtd_ruivos_nao_olhos_azuis = 0

(1..20).each do |i| 
  puts("Digite a idade")
  idade = gets.to_i
  puts("Digite a peso")
  peso = gets.to_i
  puts("Digite a altura")
  altura = gets.to_f
  puts("Digite a cor dos olhos")
  olhos = gets.strip
  puts("Digite a cor dos cabelos")
  cabelos = gets.strip

  if(idade > 50 && peso < 60)
    idade_superior_50_peso_inferior_60 += 1
  end
  
  if(altura < 1.50)
    qtd_inferior_peso_1_50 += 1
    idades_inferior_peso_1_50 += idade
  end

  if(olhos == "A")
    qtd_olhos_azuis += 1
  end

  if(cabelos == "R" && olhos != "A")
    qtd_ruivos_nao_olhos_azuis += 1
  end

  todas_pessoas = i
end

puts("Pessoas superior a 50 anos e inferior a 60 quilos: #{idade_superior_50_peso_inferior_60.to_s}")
qtd_inferior_peso_1_50 = 1 if(qtd_inferior_peso_1_50 < 1)
puts("A media de pessoas inferiores a 1.5: #{(idades_inferior_peso_1_50 / qtd_inferior_peso_1_50).to_s}")
porcentagem = qtd_olhos_azuis.to_f / todas_pessoas.to_f * 100
puts("A porcentagem de pessoas com olhos azuis são: #{porcentagem.to_s}%")
puts("A quantidade de pessoas ruivos que não possuem olhos azuis: #{qtd_ruivos_nao_olhos_azuis.to_s}")

#15)
quantidade_30_90 = 0
(1..10).each do |i| 
  puts("Digite um numero")
  numero = gets.to_i
  if(numero >= 30 && numero <= 90)
    quantidade_30_90 += 1
  end
end
puts("A quantidade de numeros entr 30 e 90 é: #{quantidade_30_90.to_s}")

#16)
idades = 0
peso_superior_90_altura_inferior_1_50 = 0
qtd_pessoas_10_30_anos_e_mais_1_90_altura = 0
todas_pessoas = 0

(1..10).each do |i| 
  puts("Digite a idade")
  idade = gets.to_i

  puts("Digite um peso")
  peso = gets.to_f

  puts("Digite uma altura")
  altura = gets.to_f

  if(peso > 90 && altura < 1.50)
    peso_superior_90_altura_inferior_1_50 += 1
  end

  if(altura > 1.90)
    if(idade >= 10 && idade <= 30)
      qtd_pessoas_10_30_anos_e_mais_1_90_altura += 1
    end
  end

  idades += idade
  todas_pessoas = i
end
puts("A média de idades é: #{(idades/10).to_s}")
puts("Quantidade de pessoas com altura superior a 90 e peso inverior a 1.50: #{peso_superior_90_altura_inferior_1_50.to_s}")
porcentagem = qtd_pessoas_10_30_anos_e_mais_1_90_altura.to_f / todas_pessoas.to_f * 100
puts("Porcentagem de pessoas que medem mais de 1,90 e com idade entre 10 e 30: #{porcentagem.to_s}%")

#17)
idades = 0
idades_mulheres = 0
idades_homens = 0
quantidade = 7
quantidade_mulheres = 0
quantidade_homens = 0
(1..quantidade).each do |i|
  puts("Digite a idade")
  idade = gets.to_i

  puts("Digite o sexo M/F")
  sexo = gets.strip
  puts(sexo)

  idades += idade

  if(sexo == "M")
    idades_homens += idade
    quantidade_homens += 1
  end

  if(sexo == "F")
    idades_mulheres += idade
    quantidade_mulheres += 1
  end
end

puts("A idade média do grupo é: #{(idades/quantidade).to_s}")
puts("A idade média das mulheres é: #{(idades_mulheres/quantidade_mulheres).to_s}")
puts("A idade média dos homens é: #{(idades_homens/quantidade_homens).to_s}")

#19)
idades = 0
idade = 1
quantidade = 0
while(idade != 0) do
  quantidade += 1
  puts("Digite a idade")
  idade = gets.to_i
  idades += idade
end

puts("A idade média é: #{(idades/quantidade).to_s}")

#20)
maior = 0
menor = 0
numero = 1
while(numero != 0) do
  if(menor == 0)
    menor = numero
  end

  puts("Digite um numero")
  numero = gets.to_i
  
  if(numero < 0)
    puts("Somente numeros positivos")
  elsif(numero > 0)
    if(numero > maior)
      maior = numero
    end

    if(numero < menor)
      menor = numero
    end
  end

end

puts("O maior numero é: #{maior.to_s}")
puts("O menor numero é: #{menor.to_s}")

#21)
puts("Digite um numero: ") 
numero = gets.to_i
fatorial = 1 

(fatorial..numero).each do |i|
  fatorial = fatorial * i 
end

puts("O fatorial de #{numero} e: #{fatorial}") 

#22)
qtd_pessoas_1_10 = 0
pesos_pessoas_1_10 = 0

qtd_pessoas_12_20 = 0
pesos_pessoas_11_20 = 0

qtd_pessoas_21_30 = 0
pesos_pessoas_21_30 = 0

qtd_pessoas_acima_30 = 0
pesos_pessoas_acima_30 = 0

(1..15).each do |i| 
  puts("Digite a idade")
  idade = gets.to_i

  puts("Digite um peso")
  peso = gets.to_f

  if(idade >=1 && idade<=10)
    qtd_pessoas_1_10 += 1
    pesos_pessoas_1_10 += peso
  elsif(idade >=11 && idade<=20)
    qtd_pessoas_11_20 += 1
    pesos_pessoas_11_20 += peso
  elsif(idade >=21 && idade<=30)
    qtd_pessoas_21_30 += 1
    pesos_pessoas_21_30 += peso
  elsif(idade > 30)
    qtd_pessoas_acima_30 += 1
    pesos_pessoas_acima_30 += peso
  end
end

puts("Média pessoas de 1 a 10: #{(pesos_pessoas_1_10 / qtd_pessoas_1_10).to_i}") 
puts("Média pessoas de 11 a 20: #{(pesos_pessoas_11_20 / qtd_pessoas_11_20).to_i}") 
puts("Média pessoas de 21 a 30: #{(pesos_pessoas_21_30 / qtd_pessoas_21_30).to_i}") 
puts("Média pessoas acima de 30: #{(pesos_pessoas_acima_30 / qtd_pessoas_acima_30).to_i}") 

#23)
idades_otimo = 0
qtd_otimo = 0

qtd_regular = 0
qtd_bom = 0
total = 15;

(1..total).each do |i| 
  puts("Digite a idade")
  idade = gets.to_i

  puts("Digite sua opinião (ótimo - 3, bom - 2, regular - 1)")
  opiniao = gets.to_i

  if(opiniao == 3)
    qtd_otimo += 1
    idades_otimo += idade
  elsif(opiniao == 1)
    qtd_regular += 1
  elsif(opiniao == 2)
    qtd_bom += 1
  end
end

puts("Média de idade das pessoas que respondeu ótimo: #{(idades_otimo / qtd_otimo).to_i}") 
puts("Quantidade de pessoas que respondeu regular: #{qtd_regular.to_i}") 
porcentagem = qtd_bom.to_f / total.to_f * 100
puts("Porcentagem que respondeu bom: #{(porcentagem).to_i}%") 

#24)
mulheres_sim = 0
total_sim = 0
total_nao = 0
total_homem = 0
total_homem_nao = 0

(1..10).each do |i| 
  puts("Digite sexo M/F")
  sexo = gets.strip

  puts("Digite a resposta S/N")
  resposta = gets.strip

  if(resposta == "S")
    total_sim += 1
    if(sexo == "F")
      mulheres_sim += 1
    end
  elsif(resposta == "N")
    total_nao += 1
    if(sexo == "M")
      total_homem_nao += 1
    end
  end

  if(sexo == "M")
    total_homem += 1
  end
end


puts("Pessoas que falaram sim: #{total_sim.to_i}") 
puts("Pessoas que falaram não: #{total_nao.to_i}") 
puts("Mulheres que falaram sim: #{mulheres_sim.to_i}") 
porcentagem = total_homem_nao.to_f / total_homem.to_f * 100
puts("Porcentagem de homens não entre todos os homens: #{(porcentagem).to_i}%") 

#25)
maior_nota = 0
menor_nota = 0
reprovados = 0
total_alunos = 10
reprovado_por_faltas = 0
alunos = ""
(1..total_alunos).each do |i| 
  puts("Digite o numero da matricula")
  matricula = gets.to_i

  puts("Digite nota 1")
  n1 = gets.to_f
  puts("Digite nota 2")
  n2 = gets.to_f
  puts("Digite nota 3")
  n3 = gets.to_f

  puts("Digite o numero de aulas frequentadas")
  aulas = gets.to_f

  media = (n1+n2+n3) / 3
  status = "aprovado"

  if(aulas < 40)
    status = "reprovado"
    reprovados += 1
    reprovado_por_faltas += 1
  else
    if(media < 6)
      status = "reprovado"
      reprovados += 1
    end
  end

  if(reprovado_por_faltas == 0)
    alunos += "\nAluno da matricula #{matricula.to_s}, sua média é: #{media.to_s} e você está: #{status}"
  else
    alunos += "\nAluno da matricula #{matricula.to_s} reprovado por faltas"
  end 

  if(maior_nota < n1)
    maior_nota = n1
  end

  if(maior_nota < n2)
    maior_nota = n2
  end

  if(maior_nota < n3)
    maior_nota = n3
  end


  if(menor_nota == 0)
    menor_nota = n1
  end
  
  if(menor_nota > n1)
    menor_nota = n1
  end

  if(menor_nota > n2)
    menor_nota = n2
  end

  if(menor_nota > n3)
    menor_nota = n3
  end

end

puts(alunos) 
puts("A maior nota da turma é #{maior_nota.to_s}, e a menor é #{menor_nota.to_s}") 
puts("O total de alunos reprovados é de: #{reprovados.to_s}") 
porcentagem = reprovado_por_faltas.to_f / total_alunos.to_f * 100
puts("Porcentagem alunos reprovados por faltas: #{(porcentagem).to_s}%") 

#26)
idades = 0
qtd = 0
idade = 1
while(idade != 0) do
  if(idade == 0)
    break
  end

  puts("Digite uma idade")
  idade = gets.to_i
  
  idades += idade
  qtd += 1
end

puts("A média das idades é: #{(idades / qtd).to_s}") 

#27)
canal_4 = 0
pessoas_4 = 0
canal_5 = 0
pessoas_5 = 0
canal_7 = 0
pessoas_7 = 0
canal_12 = 0
pessoas_12 = 0
qtd = 0
canal = 1
while(canal != 0) do
  
  puts("Sua TV estava ligada S/N")
  ligada = gets.strip

  if(ligada == "S")
    puts("Digite o canal")
    canal = gets.to_i

    if(canal == 0)
      break
    end

    puts("Digite a quantidade de pessoas")
    pessoas = gets.to_i

    if(canal == 4)
      canal_4 += 1
      pessoas_4 += pessoas
    elsif(canal == 5)
      canal_5 += 1
      pessoas_5 += pessoas
    elsif(canal == 7)
      canal_7 += 1
      pessoas_7 += pessoas
    elsif(canal == 12)
      canal_12 += 1
      pessoas_12 += pessoas
    end
  end

end

total_canal_4 = (canal_4 * pessoas_4)
total_canal_5 = (canal_5 * pessoas_5)
total_canal_7 = (canal_7 * pessoas_7)
total_canal_12 = (canal_12 * pessoas_12)
total_canal_assistidos = total_canal_4 + total_canal_5  + total_canal_7  + total_canal_12

if(total_canal_4 > 0)
  porcentagem = total_canal_4.to_f / total_canal_assistidos.to_f * 100
  puts("Porcentagem de audiencia do canal 4 é: #{porcentagem.to_s}%")
end

if(total_canal_5 > 0)
  porcentagem = total_canal_5.to_f / total_canal_assistidos.to_f * 100
  puts("Porcentagem de audiencia do canal 5 é: #{porcentagem.to_s}%")
end

if(total_canal_7 > 0)
  porcentagem = total_canal_7.to_f / total_canal_assistidos.to_f * 100
  puts("Porcentagem de audiencia do canal 7 é: #{porcentagem.to_s}%")
end

if(total_canal_12 > 0)
  porcentagem = total_canal_12.to_f / total_canal_assistidos.to_f * 100
  puts("Porcentagem de audiencia do canal 12 é: #{porcentagem.to_s}%")
end

#28)
total_salarios = 0
qtd_total_salarios = 0

total_filhos = 0
qtd_total_filhos = 0

maior_salario = 0
total_pessoas = 0
total_pessoas_salarios_ate_150 = 0

while(1 == 1) do
  puts("Digite seu salario")
  salario = gets.to_f

  if(salario < 0)
    break
  end

  total_pessoas += 1

  if(salario <= 150)
    total_pessoas_salarios_ate_150 += 1
  end

  if(maior_salario < salario)
    maior_salario = salario
  end

  puts("Digite o numero de filhos")
  qtd_filhos = gets.to_i

  total_salarios += salario
  qtd_total_salarios += 1

  total_filhos += qtd_filhos
  qtd_total_filhos += 1

end

puts("A média dos salarios é: #{(total_salarios / qtd_total_salarios).to_s}")
puts("A média dos filhos são: #{(total_filhos / qtd_total_filhos).to_s}")
puts("O maior salário é: #{maior_salario.to_s}")
porcentagem = total_pessoas_salarios_ate_150.to_f / total_pessoas.to_f * 100
puts("Porcentagem pessoas com salarios até 150 é: #{porcentagem.to_s}%")


#29)
qtd_total = 0
total_salarios = 0
maior_idade = 0
menor_idade = 0
qtd_mulhres_salario_200 = 0
menor_salario = 0
idade_menor_salario = 0
sexo_menor_salario = ""
while(1 == 1) do

  puts("Digite sua idade")
  idade = gets.to_i

  if(idade < 0)
    break
  end

  puts("Digite seu sexo M/F")
  sexo = gets.strip
  puts("Digite seu salario")
  salario = gets.to_f

  if(menor_salario == 0)
    menor_salario = salario
    idade_menor_salario = idade
    sexo_menor_salario = sexo
  end

  if(salario < menor_salario)
    menor_salario = salario
    idade_menor_salario = idade
    sexo_menor_salario = sexo
  end

  if(menor_idade == 0)
    menor_idade = idade
  end

  if(idade < menor_idade)
    menor_idade = idade
  end

  if(idade > maior_idade)
    maior_idade = idade
  end

  if(sexo == "F" && salario >= 200)
    qtd_mulhres_salario_200 += 1
  end

  qtd_total += 1
  total_salarios += salario
end

puts("A média dos salarios é: #{(total_salarios / qtd_total).to_s}")
puts("A maior idade é:#{maior_idade} e a menor idade é: #{menor_idade.to_s}")
puts("A quantidade de mulheres com salarios até 200: #{qtd_mulhres_salario_200.to_s}")
puts("O menor salario é: #{menor_salario.to_s}, o sexo do menor salario é: #{sexo_menor_salario}, a idade do menor salario é: #{idade_menor_salario}")


#30)
total_precos = 0
total_precos_reajuste = 0
quantidade = 0
while(1 == 1) do
  puts("Digite código do produto")
  codigo = gets.to_i
  if(codigo < 0)
    break
  end

  puts("Digite o preco do produto")
  preco = gets.to_f
  novo_preco = (preco + ((preco * 20) / 100))

  puts("Codigo do produto: #{codigo.to_s}, preço: #{preco.to_s}, prejo reajustado: #{novo_preco.to_s}")
  total_precos += preco
  total_precos_reajuste += novo_preco
  quantidade += 1
end

media_precos = total_precos / quantidade
media_precos_reajuste = total_precos_reajuste / quantidade

puts("A média de preço é: #{media_precos.to_s}")
puts("A média de preço reajustado é: #{media_precos_reajuste.to_s}")

#31)
quantidade = 0
total_preco_compra = 0
total_preco_venda = 0
while(1 == 1) do
  puts("Digite uma letra")
  letra = gets.strip
  if(letra == "F")
    break
  end

  puts("Digite o preco de compra")
  preco_compra = gets.to_f

  puts("Digite o preco de venda")
  preco_venda = gets.to_f

  total_preco_compra += preco_compra
  total_preco_venda += preco_venda
end

puts("O total do preco de compra é: #{total_preco_compra.to_s}")
puts("O total do preco de venda é: #{total_preco_venda.to_s}")

#32)
numeros_inferior_35 = 0
quantidade_positivos = 0
total_positivos = 0
todos_numeros = 0
numeros_entre_50_100 = 0
numeros_entre_10_20 = 0

(1..3).each do |i|
  puts("Digite um numero")
  numero = gets.to_i

  if(numero < 35)
    numeros_inferior_35 += 1
  end

  if(numero >= 0)
    quantidade_positivos += 1
    total_positivos += numero
  end

  if(numero >= 50 && numero <= 100)
    numeros_entre_50_100 += 1
  end

  if(numero < 50)
    if(numero >= 10 && numero <= 20)
      numeros_entre_10_20 += 1
    end
  end
  todos_numeros += 1
end

puts("Quantidade de numeros inveriores a 35 é: #{numeros_inferior_35.to_s}")
puts("Media de numeros positivos é: #{(total_positivos / quantidade_positivos).to_s}")
porcentagem = numeros_entre_50_100.to_f / todos_numeros.to_f * 100
puts("Porcentagem de numeros entre 50 a 100 é: #{porcentagem.to_s}%")
porcentagem = numeros_entre_10_20.to_f / todos_numeros.to_f * 100
puts("Porcentagem de numeros entre 10 a 20 e menor que 50 é: #{porcentagem.to_s}%")


#33)
while(1 == 1) do
  puts("Menu de opções")
  puts("1 - Média aritimética")
  puts("2 - Média ponderada")
  puts("3 - Sair")

  c = gets.to_i
  
  case c
  when 1
    puts("Digite a nota 1")
    n1 = gets.to_i

    puts("Digite a nota 1")
    n2 = gets.to_i

    puts("A média aritimética das notas é: #{((n1+n2)/2).to_s}")
  when 2

    puts("Digite a nota 1")
    n1 = gets.to_i

    puts("Digite o peso 1")
    p1 = gets.to_i

    puts("Digite a nota 1")
    n2 = gets.to_i

    puts("Digite o peso 2")
    p2 = gets.to_i

    puts("Digite a nota 3")
    n3 = gets.to_i

    puts("Digite o peso 3")
    p3 = gets.to_i

    media = (n1 * p1 + n2 * p2 + n2 * p3) / (p1 + p2 + p3)

    puts("A média ponderada das notas é: #{media.to_s}")
  when 3
    break
  else
    puts("opção inválida")
  end

end

#34)
candidato1 = 0
candidato2 = 0
candidato3 = 0
candidato4 = 0
nulos = 0
brancos = 0
total_votos = 0
while(1 == 1) do
  puts("Digite o código de seu candidato")
  c = gets.to_i
  
  case c
  when 1
    candidato1 += 1
  when 2
    candidato2 += 1
  when 3
    candidato3 += 1
  when 4
    candidato4 += 1
  when 5
    nulos += 1
  when 6
    brancos += 1
  when 0
    break
  else
    puts("opção inválida")
  end

  total_votos += 1
end

puts("O total de votos para o candidato 1: #{candidato1.to_s}")
puts("O total de votos para o candidato 2: #{candidato2.to_s}")
puts("O total de votos para o candidato 3: #{candidato3.to_s}")
puts("O total de votos para o candidato 4: #{candidato4.to_s}")
puts("O total de votos nulos: #{nulos.to_s}")
puts("O total de votos brancos: #{brancos.to_s}")

porcentagem = nulos.to_f / total_votos.to_f * 100
puts("Porcentagem de votos nulos: #{porcentagem.to_s}%")

porcentagem = brancos.to_f / total_votos.to_f * 100
puts("Porcentagem de votos brancos: #{porcentagem.to_s}%")

#35)
total_negativo = 0
total_positivo = 0
while(1 == 1) do
  puts("Digite um numero")
  n=gets.to_i

  if(n == 0)
    break
  end

  if(n >= 0)
    total_positivo += n
  else
    total_negativo += n
  end
end

puts("Total de positivos: #{total_positivo.to_s}%")
puts("Total de negativos: #{total_negativo.to_s}%")
puts("Total negativo + positivo: #{(total_positivo + total_negativo).to_s}")

#36)
alturas_mais_50 = 0
qtd_alturas_mais_50 = 0
while(1 == 1) do
  puts("Digite a idade")
  idade = gets.to_i

  if(idade <= 0)
    break
  end

  puts("Digite a altura")
  altura = gets.to_f

  if(idade > 50)
    alturas_mais_50 += altura
    qtd_alturas_mais_50 += 1
  end
end

if(qtd_alturas_mais_50 > 0)
  puts("Média das alturas de pessoas com mais de 50 anos: #{(alturas_mais_50/qtd_alturas_mais_50).to_s}")
else
  puts("Nenhuma pessoa com mais de 50 anos")
end

#37)
while(1 == 1) do
  puts("Menu de opções")
  puts("1 - Adição")
  puts("2 - Subitração")
  puts("3 - Multiplicação")
  puts("4 - Divisão")
  puts("5 - Sair")

  c = gets.to_i
  
  case c
  when 1
    puts("Digite um numero")
    n1 = gets.to_i

    puts("Digite um numero")
    n2 = gets.to_i

    puts("A Adição dos numeros é: #{(n1+n2).to_s}")
  when 2
    puts("Digite um numero")
    n1 = gets.to_i

    puts("Digite um numero")
    n2 = gets.to_i

    puts("A Subitração dos numeros é: #{(n1-n2).to_s}")
  when 3
    puts("Digite um numero")
    n1 = gets.to_i

    puts("Digite um numero")
    n2 = gets.to_i

    puts("A Multiplicação dos numeros é: #{(n1*n2).to_s}")
  when 4
    puts("Digite um numero")
    n1 = gets.to_i

    puts("Digite um numero")
    n2 = gets.to_i

    puts("A Divisão dos numeros é: #{(n1*n2).to_s}")
  when 5
    break
  else
    puts("opção inválida")
  end
end

#39)
total_juros = 0
total_investimentos = 0
while(1 == 1) do
  puts("Código do cliente")
  codigo = gets.to_i

  if(codigo <= 0)
    break
  end

  puts("Tipo de conta")
  tipo_conta = gets.to_i
  puts("Valor investimento")
  valor = gets.to_f
  
  case tipo_conta
  when 1
    puts("Rendimento de poupança, mensal de 1,5%")
    total_juros += (valor * 1.5) / 100
    total_investimentos += valor + total_juros
  when 2
    puts("Rendimento de poupança plus, mensal de 2%")
    total_juros += (valor * 2) / 100
    total_investimentos += valor + total_juros
  when 3
    puts("Rendimento de fundo de renda fixa, mensal de 4%")
    total_juros += (valor * 4) / 100
    total_investimentos += valor + total_juros
  end
end

puts("Total de investimentos: #{total_investimentos.to_s}")
puts("Total de juros: #{total_juros.to_s}")

################################################################################
#LISTA DE EXERCICIO 4

#ESTRUTURA DE REPETIÇÃO
################################################################################





































