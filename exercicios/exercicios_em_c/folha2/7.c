//7)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float salario = 0, porcentagem = 0;
  
  printf("Digite seu salario\n");
  scanf("%f", &salario);
  if(salario < 500){
    porcentagem = ((salario * 30) / 100);
    printf("Seu salario com aumento é: %.2f\n", salario);

    printf("Seu salario com aumento é: %.2f\n", (salario + porcentagem));
  }
  else
    printf("Invelizmente você não terá aumento\n");

  system("pause");
}