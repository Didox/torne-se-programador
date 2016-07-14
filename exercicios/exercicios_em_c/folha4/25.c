
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int cont=15, i; //15
  float v[cont], maior=0;

  for(i=0;i<cont;i++){
    printf("Digite um numero:\n");
    scanf("%f", &v[i]);
    if(maior < v[i]) maior = v[i];
  }

  
  printf("Os numeros são: \n");
  for(i=0;i<cont;i++){
    printf("%.2f, ", (v[i] / maior));
  }
  printf("\n");

  system("pause");
}