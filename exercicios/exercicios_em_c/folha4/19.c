
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int cont=10; //10
  int v1[cont], v2[cont], v3[cont], i;

  for(i=0;i<cont;i++){
    printf("Digite o %dº numero da lista 1:\n", (i + 1));
    scanf("%d", &v1[i]);
  }

  for(i=0;i<cont;i++){
    printf("Digite o %dº numero da lista 2:\n", (i + 1));
    scanf("%d", &v2[i]);
  }

  for(i=0;i<cont;i++){
    v3[i] = v1[i] * v2[i];
  }

  printf("A multiplicação dos indices são: \n");
  for(i=0;i<cont;i++){
    printf("%d, ", v3[i]);
  }
  printf("\n");

  system("pause");
}