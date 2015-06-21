//27)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float canal_4 = 0;
  float pessoas_4 = 0;
  float canal_5 = 0;
  float pessoas_5 = 0;
  float canal_7 = 0;
  float pessoas_7 = 0;
  float canal_12 = 0;
  float pessoas_12 = 0;
  int canal = 1, pessoas;
  char ligada;
  while(canal != 0){
    
    printf("Sua TV estava ligada S/N\n");
    scanf(" %c",&ligada);

    if(ligada == 'S'){
      printf("Digite o canal\n");
      scanf("%d", &canal);

      if(canal == 0)
        break;

      printf("Digite a quantidade de pessoas\n");
      scanf("%d", &pessoas);

      if(canal == 4){
        canal_4 += 1;
        pessoas_4 += pessoas;
      }
      else if(canal == 5){
        canal_5 += 1;
        pessoas_5 += pessoas;
      }
      else if(canal == 7){
        canal_7 += 1;
        pessoas_7 += pessoas;
      }
      else if(canal == 12){
        canal_12 += 1;
        pessoas_12 += pessoas;
      }
    }

  }

  float total_canal_4 = (canal_4 * pessoas_4);
  float total_canal_5 = (canal_5 * pessoas_5);
  float total_canal_7 = (canal_7 * pessoas_7);
  float total_canal_12 = (canal_12 * pessoas_12);
  float total_canal_assistidos = total_canal_4 + total_canal_5  + total_canal_7  + total_canal_12;

  if(total_canal_4 > 0){
    float porcentagem = total_canal_4 / total_canal_assistidos * 100;
    printf("Porcentagem de audiencia do canal 4 é: %.0f%%\n", porcentagem);
  }

  if(total_canal_5 > 0){
    float porcentagem = total_canal_5 / total_canal_assistidos * 100;
    printf("Porcentagem de audiencia do canal 5 é: %.0f%%\n", porcentagem);
  }

  if(total_canal_7 > 0){
    float porcentagem = total_canal_7 / total_canal_assistidos * 100;
    printf("Porcentagem de audiencia do canal 7 é: %.0f%%\n", porcentagem);
  }

  if(total_canal_12 > 0){
    float porcentagem = total_canal_12 / total_canal_assistidos * 100;
    printf("Porcentagem de audiencia do canal 12 é: %.0f%%\n", porcentagem);
  }
  system("pause");
}