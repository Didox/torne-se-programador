sair = "0"
while(sair != "1")
  puts "Digite alguma coisa: "
  a = gets
  puts "o valor digitado foi: " + a
  
  puts "digite 1 para sair ou zero para continuar "
  sair = gets.strip
end