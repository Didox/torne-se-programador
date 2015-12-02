
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int cont=50, i, v1[cont];

  for(i=0;i<cont;i++){
    printf("Digite um numero %d:\n", (i + 1));
    scanf("%d", &v1[i]);
  }

  printf("Os números positivos são: \n");
  for(i=0;i<cont;i++){
    if(v1[i] >= 0){
      printf("%d, ", v1[i]);
    }
  }
  printf("\n");

  system("pause");
}