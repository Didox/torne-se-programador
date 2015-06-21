
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int cont=30, i, v1[cont], v2[cont]; //30

  for(i=0;i<cont;i++){
    printf("Digite um numero %d:\n", (i + 1));
    if (scanf("%d", &v1[i]) != 1) 
      v1[i] = -1; 
  }

  for(i=0;i<cont;i++){
    if (v1[i] != -1) v2[i] = v1[i];
    else v2[i] = 1;
  }

  printf("Os valores do vetor 1 são: \n");
  for(i=0;i<cont;i++){
    if(v1[i] >= 0){
      printf("%d, ", v1[i]);
    }
  }
  printf("\n");

  printf("Os valores do vetor 2 são: \n");
  for(i=0;i<cont;i++){
    if(v2[i] >= 0){
      printf("%d, ", v2[i]);
    }
  }
  printf("\n");

  system("pause");
}