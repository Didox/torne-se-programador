//11)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float salario = 0, porcentagem = 0;
  
  printf("Digite seu salario\n");
  scanf("%f", &salario);
  if(salario <= 300){
    porcentagem = (salario * 15) / 100;
    printf("Você teve um aumento de 15%%, seu salario com aumento é: %.2f\n", (salario + porcentagem));
  }
  else if(salario <= 600){
    porcentagem = (salario * 10) / 100;
    printf("Você teve um aumento de 10%%, seu salario com aumento é: %.2f\n", (salario + porcentagem));
  }
  else if(salario <= 900){
    porcentagem = (salario * 5) / 100;
    printf("Você teve um aumento de 5%%, seu salario com aumento é: %.2f\n", (salario + porcentagem));
  }
  else
    printf("Você teve um aumento de 0%%, seu salário com aumento é: %.2f\n", salario);
  system("pause");
}