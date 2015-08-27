# faça um programa que receba um valor e calcule se este valor for 1 some 1 + 5 se não atribua o valor 3, depois mostre o valor é? valor calculado
puts(" digite um valor " )

a = gets.to_i
if(a == 1)
  a = 1*2
else
  a = 3
end

puts(" o valor de a é: " + a.to_s)