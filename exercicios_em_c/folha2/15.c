//15)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int tipo = 0;
  float porcentagem = 0, valor = 0;
  
  printf("Digite o tipo de investimento\n");
  printf("(1) - Poupança\n");
  printf("(2) - Fundos de renda fixa\n");
  scanf("%d", &tipo);
  printf("Digite o valor\n");
  scanf("%f", &valor);
  if(tipo == 1){
    porcentagem = (valor * 3) / 100;
    valor = valor + porcentagem;
    printf("Seu valor corrigido é: %.2f\n", valor);
  }
  else if(tipo == 2){
    porcentagem = (valor * 4) / 100;
    valor = valor + porcentagem;
    printf("Seu valor corrigido é: %.2f\n", valor);
  }
  else
    printf("Opção inválida seu valor é: %.2f\n", valor);
  system("pause");
}