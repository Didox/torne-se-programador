//21)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float preco = 0;
  int origem = 0;
  
  printf("Digite o preço do produto\n");
  scanf("%f", &preco);
  printf("Digite o código de origem\n");
  scanf("%d", &origem);

  if(origem == 1)
    printf("Preço do produto é: %.2f, procedência: Sul\n", preco);
  else if(origem == 2)
    printf("Preço do produto é: %.2f, procedência: Norte\n", preco);
  else if(origem == 3)
    printf("Preço do produto é: %.2f, procedência: Leste\n", preco);
  else if(origem == 4)
    printf("Preço do produto é: %.2f, procedência: Oeste\n", preco);
  else if(origem == 5 || origem == 6)
    printf("Preço do produto é: %.2f, procedência: Nordeste\n", preco);
  else if(origem == 7 || origem == 8 || origem == 9)
    printf("Preço do produto é: %.2f, procedência: Sudeste\n", preco);
  else if(origem >= 10 && origem <= 20)
    printf("Preço do produto é: %.2f, procedência: Centro-oeste\n", preco);
  else if(origem >= 21 && origem <= 30)
    printf("Preço do produto é: %.2f, procedência: Noroeste\n", preco);
  system("pause");
}