sair = "0"
while(sair != "1")
  puts "Digite alguma coisa: "
  a = $stdin.readline
  puts "o valor digitado foi: " + a
  
  puts "digite 1 para sair ou zero para continuar "
  sair = $stdin.readline.strip
end