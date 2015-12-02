//2)

#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int vetor[7], multiplos_2[3], multiplos_3[2], multiplos_2_3[5];
  int i;

  for(i=0;i<7;i++){
    vetor[i] = (i+1);
  }

  int qtd = (int)(sizeof(vetor)/sizeof(vetor[0]));
  int x = 0, j = 0;

  for(i=0;i<qtd;i++){
    int valor = vetor[i];

    float sobra = valor % 2;
    if(sobra <= 0){
      multiplos_2[x] = valor;
      x++;
    }

    sobra = valor % 3;
    if(sobra <= 0){
      multiplos_3[j] = valor;
      j++;
    }
  }

  printf("Os multilos de 2 são: ");
  qtd = (int)(sizeof(multiplos_2)/sizeof(multiplos_2[0]));
  for(i=0;i<qtd;i++){
    printf("%d, ", multiplos_2[i]);
  }
  printf("\n");

  printf("Os multiplos de 3 são: ");
  qtd = (int)(sizeof(multiplos_3)/sizeof(multiplos_3[0]));
  for(i=0;i<qtd;i++){
    printf("%d, ", multiplos_3[i]);
  }
  printf("\n");

  printf("Os multiplos de 2 e 3 são: ");
  qtd = (int)(sizeof(multiplos_2)/sizeof(multiplos_2[0]));
  for(i=0;i<qtd;i++){
    printf("%d, ", multiplos_2[i]);
  }
  qtd = (int)(sizeof(multiplos_3)/sizeof(multiplos_3[0]));
  for(i=0;i<qtd;i++){
    printf("%d, ", multiplos_3[i]);
  }
  printf("\n");
  system("pause");
}