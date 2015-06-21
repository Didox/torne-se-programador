//35)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  int total_negativo = 0;
  int total_positivo = 0, n;
  while(1 == 1){
    printf("Digite um numero\n");
    scanf("%d", &n);

    if(n == 0)
      break;

    if(n >= 0)
      total_positivo += n;
    else
      total_negativo += n;
  }

  printf("Total de positivos: %d\n", total_positivo);
  printf("Total de negativos: %d\n", total_negativo);
  printf("Total negativo + positivo: %d\n", (total_positivo + total_negativo));

  system("pause");
}