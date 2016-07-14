//14)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float salario = 0, porcentagem = 0, novo_salario = 0;
  
  printf("Digite seu salario\n");
  scanf("%f", &salario);
  if(salario <= 300){
    porcentagem = (salario * 50) / 100;
    novo_salario = salario + porcentagem;
  }
  else if(salario <= 500){
    porcentagem = (salario * 40) / 100;
    novo_salario = salario + porcentagem;
  }
  else if(salario <= 700){
    porcentagem = (salario * 30) / 100;
    novo_salario = salario + porcentagem;
  }
  else if(salario <= 800){
    porcentagem = (salario * 20) / 100;
    novo_salario = salario + porcentagem;
  }
  else if(salario <= 1000){
    porcentagem = (salario * 10) / 100;
    novo_salario = salario + porcentagem;
  }
  else{
    porcentagem = (salario * 5) / 100;
    novo_salario = salario + porcentagem;
  }

  printf("Seu novo salário com aumento é: %.2f\n", novo_salario);
  system("pause");
}