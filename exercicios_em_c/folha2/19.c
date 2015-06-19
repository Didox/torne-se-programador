//19)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float altura = 0, peso = 0;
  char sexo;

  printf("Digite sua altura\n");
  scanf("%f", &altura);
  printf("Digite seu sexo M/F\n");
  scanf(" %c",&sexo);  

  if(sexo == 'M'){
    peso = (72.7*altura) - 58;
    printf("Seu peso ideal é: %.2f\n", peso);
  }
  else if(sexo == 'F'){
    peso = (62.1*altura) - 44.7;
    printf("Seu peso ideal é: %.2f\n", peso);
  }
  else
    printf("digite masculino ou feminino para calcular peso\n");
  system("pause");
}
