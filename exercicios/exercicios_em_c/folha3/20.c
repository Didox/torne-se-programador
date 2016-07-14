//20)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int maior = 0;
  int menor = 0;
  int numero = 1;
  while(numero != 0){
    if(menor == 0)
      menor = numero;

    printf("Digite um numero\n");
    scanf("%d", &numero);
    
    if(numero < 0)
      printf("Somente numeros positivos\n");
    else if(numero > 0){
      if(numero > maior)
        maior = numero;

      if(numero < menor)
        menor = numero;
    }
  }

  printf("O maior numero é: %d\n", maior);
  printf("O menor numero é: %d\n", menor);
  system("pause");
}