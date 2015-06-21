//39)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float total_juros = 0;
  float total_investimentos = 0, valor;
  int codigo, tipo_conta;
  while(1 == 1){
    printf("Código do cliente\n");
    scanf("%d", &codigo);

    if(codigo <= 0)
      break;

    printf("Tipo de conta\n");
    scanf("%d", &tipo_conta);
    printf("Valor investimento\n");
    scanf("%f", &valor);
    
    switch(tipo_conta){
      case 1:
        printf("Rendimento de poupança, mensal de 1,5%%\n");
        total_juros += (valor * 1.5) / 100;
        total_investimentos += valor + total_juros;
        break;
      case 2:
        printf("Rendimento de poupança plus, mensal de 2%%\n");
        total_juros += (valor * 2) / 100;
        total_investimentos += valor + total_juros;
        break;
      case 3:
        printf("Rendimento de fundo de renda fixa, mensal de 4%%\n");
        total_juros += (valor * 4) / 100;
        total_investimentos += valor + total_juros;
        break;
    }
  }

  printf("Total de investimentos: %.2f\n", total_investimentos);
  printf("Total de juros: %.2f\n", total_juros);
  system("pause");
}