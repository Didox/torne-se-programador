//13)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float preco = 0, porcentagem = 0, novo_preco = 0;
  
  
  printf("Digite o preço do produto\n");
  scanf("%f", &preco);
  if(preco <= 50){
    porcentagem = (preco * 5) / 100;
    novo_preco = preco + porcentagem;
  }
  else if(preco <= 100){
    porcentagem = (preco * 10) / 100;
    novo_preco = preco + porcentagem;
  }
  else{
    porcentagem = (preco * 15) / 100;
    novo_preco = preco + porcentagem;
  }

  if(novo_preco <= 80)
    printf("O preco do produto %.2f, classificação: barato\n", novo_preco);
  else if(novo_preco <= 120)
    printf("O preco do produto %.2f, classificação: normal\n", novo_preco);
  else if(novo_preco <= 200)
    printf("O preco do produto %.2f, classificação: caro\n", novo_preco);
  else if(novo_preco > 200)
    printf("O preco do produto %.2f, classificação: muito caro\n", novo_preco);
  system("pause");
}