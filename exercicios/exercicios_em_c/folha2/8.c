//8)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float salario = 0, porcentagem = 0;

  printf("Digite seu salario\n");
  scanf("%f", &salario);
  if(salario <= 300){
    porcentagem = (salario * 35) / 100;
    printf("Você teve um aumento de 35%%, seu salario com aumento é: %.2f\n", (salario + porcentagem));
  }
  else{
    porcentagem = (salario * 15) / 100;
    printf("Você teve um aumento de 15%%, seu salário com aumento é: %.2f\n", (salario + porcentagem));
  }
  system("pause");
}