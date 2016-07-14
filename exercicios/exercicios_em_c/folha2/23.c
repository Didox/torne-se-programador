//23)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float preco = 0, preco_total = 0, desconto = 0;
  int codigo = 0, quantidade = 0;
  
  printf("Digite o código do produto\n");
  scanf("%d", &codigo);
  printf("Digite a quantidade\n");
  scanf("%d", &quantidade);

  if(codigo >= 1 && codigo <= 10)
    preco = 10;
  else if(codigo >= 11 && codigo <= 20)
    preco = 15;
  else if(codigo >= 21 && codigo <= 30)
    preco = 20;
  else if(codigo >= 31 && codigo <= 40)
    preco = 30;
  else
    printf("Código do produto inválido\n");

  if(preco > 0){
    preco_total = preco * quantidade;

    if(preco_total >= 250)
      desconto = (preco_total*5) / 100;
    else if(preco_total >= 250 && preco_total <= 500)
      desconto = (preco_total*10) / 100;
    else if(preco_total > 500)
      desconto = (preco_total*15) / 100;

    printf("O preço unitário do produto é: %.2f\n", preco);
    printf("O preço total é: %.2f\n", preco_total);
    printf("Desconto de: %.2f\n", desconto);
    printf("O preço final com desconto é: %.2f\n", (preco_total - desconto));
  }
  system("pause");
}