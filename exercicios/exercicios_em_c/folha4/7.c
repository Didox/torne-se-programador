//7)
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int qtd_espacos = 10, i;
  float numeros[qtd_espacos];
  int qtd_negativos = 0;
  float soma_positivos = 0;

  for(i=0;i<qtd_espacos;i++){
    printf("Digite um numero real R$ \n");
    scanf("%f", &numeros[i]);
  } 

  for(i=0;i<qtd_espacos;i++){
    if(numeros[i] < 0) qtd_negativos++;
    else soma_positivos += numeros[i];
  }

  printf("A quantidade de numeros negativos é: %d\n", qtd_negativos);
  printf("A soma dos positivos é: %.2f\n", soma_positivos);
  system("pause");
}