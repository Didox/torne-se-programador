puts("Digite" )
puts("1 - taboada do  1" )
puts("2 - taboada do 2" )
a = gets.to_i

if(a == 1 || a == 2)
  puts(a.to_s + " X 1 = " + (a * 1).to_s)
  puts(a.to_s + " X 2 = " + (a * 2).to_s)
  puts(a.to_s + " X 3 = " + (a * 3).to_s)
  puts(a.to_s + " X 4 = " + (a * 4).to_s)
  puts(a.to_s + " X 5 = " + (a * 5).to_s)
  puts(a.to_s + " X 6 = " + (a * 6).to_s)
  puts(a.to_s + " X 7 = " + (a * 7).to_s)
  puts(a.to_s + " X 8 = " + (a * 8).to_s)
  puts(a.to_s + " X 9 = " + (a * 9).to_s)
  puts(a.to_s + " X 10 = " + (a * 10).to_s)
else
  puts("opção inválida")
end
