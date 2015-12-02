//25)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float extras = 0, faltas = 0, h = 0;
  
  printf("Digite a quantidade de horas extras\n");
  scanf("%f", &extras);
  printf("Digite a quantidade de horas faltas\n");
  scanf("%f", &faltas);

  h = extras - 2/3 * faltas;

  if(h > 2400)
    printf("Sua gratificação é de R$ 500,00\n");
  else if(h >= 1800 && h < 2400)
    printf("Sua gratificação é de R$ 400,00\n");
  else if(h >= 600 && h < 1200)
    printf("Sua gratificação é de R$ 200,00\n");
  else if(h < 600)
    printf("Sua gratificação é de R$ 100,00\n");
  system("pause");
}