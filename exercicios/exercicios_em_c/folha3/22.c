//22)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  int qtd_pessoas_1_10 = 0;
  int pesos_pessoas_1_10 = 0;

  int qtd_pessoas_11_20 = 0;
  int pesos_pessoas_11_20 = 0;

  int qtd_pessoas_21_30 = 0;
  int pesos_pessoas_21_30 = 0;

  int qtd_pessoas_acima_30 = 0;
  int pesos_pessoas_acima_30 = 0;
  int idade, i;
  float peso;

  for(i=1; i<= 15; i++){
    printf("Digite a idade\n");
    scanf("%d", &idade);

    printf("Digite um peso\n");
    scanf("%f", &peso);

    if(idade >=1 && idade<=10){
      qtd_pessoas_1_10 += 1;
      pesos_pessoas_1_10 += peso;
    }
    else if(idade >=11 && idade<=20){
      qtd_pessoas_11_20 += 1;
      pesos_pessoas_11_20 += peso;
    }
    else if(idade >=21 && idade<=30){
      qtd_pessoas_21_30 += 1;
      pesos_pessoas_21_30 += peso;
    }
    else if(idade > 30){
      qtd_pessoas_acima_30 += 1;
      pesos_pessoas_acima_30 += peso;
    }
  }

  printf("Média pessoas de 1 a 10: %d\n", (pesos_pessoas_1_10 / qtd_pessoas_1_10)); 
  printf("Média pessoas de 11 a 20: %d\n", (pesos_pessoas_11_20 / qtd_pessoas_11_20)); 
  printf("Média pessoas de 21 a 30: %d\n", (pesos_pessoas_21_30 / qtd_pessoas_21_30)); 
  printf("Média pessoas acima de 30: %d\n", (pesos_pessoas_acima_30 / qtd_pessoas_acima_30)); 
  system("pause");
}