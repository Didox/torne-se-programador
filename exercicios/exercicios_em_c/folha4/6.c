//6)

#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int qtd_espacos = 10, i;
  float total_vendas[qtd_espacos];
  float total_vendas_porcentagem[qtd_espacos];
  float percentual_vendedores[qtd_espacos];
  char nome_vendedores[qtd_espacos][100];

  for(i=0;i<qtd_espacos;i++){
    printf("Digite o total de vendas do vendedor %d\n", (i + 1));
    scanf("%f", &total_vendas[i]);

    printf("Digite o percentual de vendas do vendedor %d\n", (i + 1));
    scanf("%f", &percentual_vendedores[i]);

    printf("Digite o nome do vendedor %d\n", (i + 1));
    scanf("%s", nome_vendedores[i]);

    float valor = total_vendas[i] + (total_vendas[i] * percentual_vendedores[i] / 100);
    total_vendas_porcentagem[i] = valor;
  } 

  printf("Vendedores e valor que irá receber: ");
  for(i=0;i<qtd_espacos;i++){
    printf("\n  %s - R$ %.2f", nome_vendedores[i], total_vendas_porcentagem[i]);
  }
  printf("\n");

  float total_vendas_vendedor = 0;
  for(i=0;i<qtd_espacos;i++){
    total_vendas_vendedor += total_vendas[i];
  }
  printf("Total de vendas de todos os vendedores: R$ %.2f\n", total_vendas_vendedor);

  char maior_valor_nome[100], menor_valor_nome[100];
  float maior_valor = 0, menor_valor = -1;

  for(i=0;i<qtd_espacos;i++){
    if(menor_valor == -1){
      menor_valor = total_vendas_porcentagem[i];
      strcpy(menor_valor_nome, nome_vendedores[i]);
    }
    if(menor_valor > total_vendas_porcentagem[i]){
      menor_valor = total_vendas_porcentagem[i];
      strcpy(menor_valor_nome, nome_vendedores[i]);
    } 

    if(maior_valor < total_vendas_porcentagem[i]){
      maior_valor = total_vendas_porcentagem[i];
      strcpy(maior_valor_nome, nome_vendedores[i]);
    }
  }
  printf("O vendedor com maior valor: %s - R$ %.2f\n", maior_valor_nome, maior_valor);
  printf("O vendedor com menor valor:  %s - R$ %.2f\n", menor_valor_nome, menor_valor);
  system("pause");
}