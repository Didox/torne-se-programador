puts "Digite um valor: "

a = $stdin.readline.to_i
if a == 1
  a = 1 + 5
else
  a = 3
end

puts("o valor de b é: " + a.to_s)
