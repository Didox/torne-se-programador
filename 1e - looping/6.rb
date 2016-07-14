puts("Digite um numero" )
a = gets.to_i
tabuada=1

while(tabuada <= 10) do
  puts(a.to_s + " X " + tabuada.to_s + " = " + (a * tabuada).to_s)
  tabuada = tabuada + 1
end