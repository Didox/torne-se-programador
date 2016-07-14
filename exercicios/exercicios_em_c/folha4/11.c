
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int i, x=0; //10
  int vetor1[] = {4,7,5,8,2,15,9,6,10,11};
  int vetor_par[5];
  int vetor_impar[5];

  for(i=0;i<10;i++){
    float v = vetor1[i] % 2;
    if(v <= 0){
      vetor_par[x] = vetor1[i];
      x++;
    }
  }

  x = 0;
  for(i=0;i<10;i++){
    float v = vetor1[i] % 2;
    if(v > 0){
      vetor_impar[x] = vetor1[i];
      x++;
    }
  }

  printf("Vetor par:\n");
  for(i=0;i<5;i++){
    printf("%d, ", vetor_par[i]);
  }
  printf("\n");

  printf("Vetor impar:\n");
  for(i=0;i<5;i++){
    printf("%d, ", vetor_impar[i]);
  }
  printf("\n");

  system("pause");
}