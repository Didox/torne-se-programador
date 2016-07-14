
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int i; //10
  int numeros[5];

  for(i=0;i<5;i++){
    printf("Digite o %dº número:\n", (i + 1));
    scanf("%d", &numeros[i]);
  }

  printf("Os números digitados foram:\n");
  int soma = 0;
  for(i=0;i<5;i++){
    soma += numeros[i];
    if(i < 4) printf("%d + ", numeros[i]);
    else printf("%d = %d", numeros[i], soma);
  }
  printf("\n");

  system("pause");
}