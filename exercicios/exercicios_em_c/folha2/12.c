//12)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float salario = 0, porcentagem = 0, gratificacao = 0;
  
  printf("Digite seu salario\n");
  scanf("%f", &salario);
  if(salario <= 350){
    porcentagem = (salario * 7) / 100;
    gratificacao = 100;
    printf("Você teve uma gratificação de %.2f, seu salario menos imposto é de: %.2f\n", gratificacao, ((salario - porcentagem) + gratificacao));
  }
  else if(salario <= 600){
    porcentagem = (salario * 7) / 100;
    gratificacao = 75;
    printf("Você teve uma gratificação de %.2f, seu salario menos imposto é de: %.2f\n", gratificacao, ((salario - porcentagem) + gratificacao));
  }
  else if(salario <= 900){
    porcentagem = (salario * 7) / 100;
    gratificacao = 50;
    printf("Você teve uma gratificação de %.2f, seu salario menos imposto é de: %.2f\n", gratificacao, ((salario - porcentagem) + gratificacao));
  }
  else{
    porcentagem = (salario * 7) / 100;
    gratificacao = 35;
    printf("Você teve uma gratificação de %.2f, seu salario menos imposto é de: %.2f\n", gratificacao, ((salario - porcentagem) + gratificacao));
  }
  system("pause");
}
