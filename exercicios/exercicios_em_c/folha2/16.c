//16)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float preco = 0, porcentagem = 0, novo_preco = 0;
  
  printf("Digite o preço\n");
  scanf("%f", &preco);
  if(preco <= 30)
    printf("Preço: %.2f, sem desconto, preço novo: %.2f\n", preco, preco);
  else if(preco <= 100){
    porcentagem = (preco * 10) / 100;
    novo_preco = preco - porcentagem;
    printf("Preço: %.2f, desconto: %.2f, preço novo: %.2f\n", preco, porcentagem, novo_preco);
  }
  else if(preco > 100){
    porcentagem = (preco * 15) / 100;
    novo_preco = preco - porcentagem;
    printf("Preço: %.2f, desconto: %.2f, preço novo: %.2f\n", preco, porcentagem, novo_preco);
  }
  system("pause");
}