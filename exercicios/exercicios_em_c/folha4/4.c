//4)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int qtd_espacos = 15, i;
  int vetor[] = {12, 30, 43, 2, 3, 5, 22, 4, 79, 30, 4, 56, 10, 30, 46};

  for(i=0;i<qtd_espacos;i++){
    int v = vetor[i];
    if(v == 30)
      printf("Elemento igual a 30 na posição %d\n", i);
  }
  system("pause");
}