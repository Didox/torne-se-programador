//28)

#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float total_salarios = 0;
  float qtd_total_salarios = 0;
  float total_filhos = 0;
  float qtd_total_filhos = 0;
  float maior_salario = 0;
  float total_pessoas = 0;
  float total_pessoas_salarios_ate_150 = 0;
  float salario = 0;
  int qtd_filhos = 0;

  while(1 == 1){
    printf("Digite seu salario\n");
    scanf("%f", &salario);

    if(salario < 0)
      break;

    total_pessoas += 1;

    if(salario <= 150)
      total_pessoas_salarios_ate_150 += 1;

    if(maior_salario < salario)
      maior_salario = salario;

    printf("Digite o numero de filhos\n");
    scanf("%d", &qtd_filhos);

    total_salarios += salario;
    qtd_total_salarios += 1;

    total_filhos += qtd_filhos;
    qtd_total_filhos += 1;

  }

  printf("A média dos salarios é: %.0f\n", (total_salarios / qtd_total_salarios));
  printf("A média dos filhos são: %.0f\n", (total_filhos / qtd_total_filhos));
  printf("O maior salário é: %.0f\n", maior_salario);
  float porcentagem = total_pessoas_salarios_ate_150 / total_pessoas * 100;
  printf("Porcentagem pessoas com salarios até 150 é: %.0f%%\n", porcentagem);
  system("pause");
}
