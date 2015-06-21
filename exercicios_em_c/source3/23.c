
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int cont=5, i, x=0, a[cont], b[cont]; //5

  for(i=0;i<cont;i++){
    printf("Digite um numero %d para p vetor A:\n", (i + 1));
    scanf("%d", &a[i]);

    printf("Digite um numero %d para p vetor B:\n", (i + 1));
    scanf("%d", &b[i]);
  }

  int soma = 0;
  for(i=0;i<cont;i++){
    int sub = b[cont-(i+1)] - a[i];
    soma += sub;
    printf("sub %d - %d = %d / soma %d \n", b[cont-(i+1)], a[i], sub, soma);
  }

  printf("O valor da soma é: %d\n", soma);

  system("pause");
}