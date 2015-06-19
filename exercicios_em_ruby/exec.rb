
total_juros = 0
total_investimentos = 0
while(1 == 1) do
  puts("Código do cliente")
  codigo = $stdin.readline.to_i

  if(codigo <= 0)
    break
  end

  puts("Tipo de conta")
  tipo_conta = $stdin.readline.to_i
  puts("Valor investimento")
  valor = $stdin.readline.to_f
  
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