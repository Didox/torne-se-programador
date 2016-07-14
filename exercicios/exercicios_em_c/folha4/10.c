
#include <stdio.h>
#include <string.h>
int main() 
{
  int i, x=0, j; //10
  int vetor1[] = {4,7,5,8,2,15,9,6,10,11};
  int vetor2[] = {3,4,5,8,2};

  int primeiro_vetor_resultante[] = {0,0,0,0,0};
  for(i=0;i<10;i++){
    float v = vetor1[i] % 2;
    if(v <= 0){
      int par = vetor1[i];
      int valores_somados = 0;
      for(j=0;j<5;j++){
        valores_somados += vetor2[j];
      }
      primeiro_vetor_resultante[x] = valores_somados + par;
      x++;
    }
  }

  x = 0;
  int segundo_vetor_resultante[] = {0,0,0,0,0};
  for(i=0;i<10;i++){
    float v = vetor1[i] % 2;
    if(v > 0){
      int impar = vetor1[i];
      int quantidade_divisores = 0;
      for(j=0;j<5;j++){
        float divi = impar % vetor2[j];
        if(divi <=0){
          quantidade_divisores += 1;
        }
      }
      segundo_vetor_resultante[x] = quantidade_divisores;      
      x++;
    }
  }

  printf("Primeiro vetor resultante:\n");
  for(i=0;i<5;i++){
    printf("%d, ", primeiro_vetor_resultante[i]);
  }
  printf("\n");

  printf("Segundo vetor resultante:\n");
  for(i=0;i<5;i++){
    printf("%d, ", segundo_vetor_resultante[i]);
  }
  printf("\n");
  system("pause");
}