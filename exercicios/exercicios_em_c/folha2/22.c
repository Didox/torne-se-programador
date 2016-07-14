//22)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int idade = 0;
  float peso = 0;

  
  printf("Digite sua idade\n");
  scanf("%d", &idade);
  printf("Digite seu peso\n");
  scanf("%f", &peso);

  if(idade < 20){
    if(peso <= 60)
      printf("Você se encontra no risco 9\n");
    else if(peso >= 60 && peso <= 90)
      printf("Você se encontra no risco 8\n");
    else if(peso > 90)
      printf("Você se encontra no risco 7\n");
  }
  else if(idade >= 20 && idade <= 50){
    if(peso <= 60)
      printf("Você se encontra no risco 6\n");
    else if(peso >= 60 && peso <= 90)
      printf("Você se encontra no risco 5\n");
    else if(peso > 90)
      printf("Você se encontra no risco 4\n");
  }
  else if(idade > 50){
    if(peso <= 60)
      printf("Você se encontra no risco 3\n");
    else if(peso >= 60 && peso <= 90)
      printf("Você se encontra no risco 2\n");
    else if(peso > 90)
      printf("Você se encontra no risco 1\n");
  }
  system("pause");
}