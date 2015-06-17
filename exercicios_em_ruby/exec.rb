
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