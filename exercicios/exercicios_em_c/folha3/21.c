//21)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int numero;
  printf("Digite um numero: \n"); 
  scanf("%d", &numero);
  int fatorial = 1, i;

  for(i=1; i<= numero; i++){
    fatorial = fatorial * i;
  }

  printf("O fatorial de %d e: %d\n", numero, fatorial); 
  system("pause");
}