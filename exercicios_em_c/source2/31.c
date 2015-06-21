//31)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int quantidade = 0;
  float total_preco_compra = 0;
  float total_preco_venda = 0;
  char letra;
  float preco_compra, preco_venda;

  while(1 == 1){
    printf("Digite uma letra\n");
    scanf(" %c",&letra);
    if(letra == 'F')
      break;

    printf("Digite o preco de compra\n");
    scanf("%f", &preco_compra);

    printf("Digite o preco de venda\n");
    scanf("%f", &preco_venda);

    total_preco_compra += preco_compra;
    total_preco_venda += preco_venda;
  }

  printf("O total do preco de compra é: %.2f\n", total_preco_compra);
  printf("O total do preco de venda é: %.2f\n", total_preco_venda);

  system("pause");
}