
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int v[] = {41,7,5,48,32,15,9,6,10,11,12,34,5,67,34};
  int maior = 0, menor = 0;
  int index_maior = 0, index_menor = 0, i;

  for(i=0;i<15;i++){  
    if(maior < v[i]){
      maior = v[i];
      index_maior = i;
    }

    if(menor == 0){
      menor = v[i];
      index_menor = i;
    }
    else if(menor > v[i]){
      menor = v[i];
      index_menor = i;
    }
  }

  printf("O maior elemento é: %d e a posicao é: %d\n", maior, index_maior);
  printf("O menor elemento é: %d e a posicao é: %d\n", menor, index_menor);

  system("pause");
}