
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int cont=10, i, v[cont], b[cont]; //10

  for(i=0;i<cont;i++){
    printf("Digite um numero %d:\n", (i + 1));
    if (scanf("%d", &v[i]) != 1) 
      v[i] = -1; 
  }

  for(i=0;i<cont;i++){
    if (v[i] >= 0){
      b[i] = v[i];
    }
    else b[i] = -1;
  }

  printf("O vetor b é: \n");
  for(i=0;i<cont;i++){
    if(b[i] != -1)
      printf("%d, ", b[i]);
  }
  printf("\n");

  system("pause");
}