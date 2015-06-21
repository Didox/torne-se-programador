//29)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  float qtd_total = 0;
  float total_salarios = 0;
  float maior_idade = 0;
  float menor_idade = 0;
  float qtd_mulhres_salario_200 = 0;
  float menor_salario = 0;
  float idade_menor_salario = 0;
  char sexo_menor_salario, sexo;
  int idade;
  float salario;

  while(1 == 1){

    printf("Digite sua idade\n");
    scanf("%d", &idade);

    if(idade < 0)
      break;

    printf("Digite seu sexo M/F\n");
    scanf(" %c",&sexo);
    printf("Digite seu salario\n");
    scanf("%f", &salario);

    if(menor_salario == 0){
      menor_salario = salario;
      idade_menor_salario = idade;
      sexo_menor_salario = sexo;
    }

    if(salario < menor_salario){
      menor_salario = salario;
      idade_menor_salario = idade;
      sexo_menor_salario = sexo;
    }

    if(menor_idade == 0)
      menor_idade = idade;

    if(idade < menor_idade)
      menor_idade = idade;

    if(idade > maior_idade)
      maior_idade = idade;

    if(sexo == 'F' && salario >= 200)
      qtd_mulhres_salario_200 += 1;

    qtd_total += 1;
    total_salarios += salario;
  }

  printf("A média dos salarios é: %.0f\n", (total_salarios / qtd_total));
  printf("A maior idade é: %.0f e a menor idade é: %.0f\n", maior_idade, menor_idade);
  printf("A quantidade de mulheres com salarios até 200: %.0f\n", qtd_mulhres_salario_200);
  printf("O menor salario é: %.2f, o sexo do menor salario é: %c, a idade do menor salario é: %.2f\n", menor_salario, sexo_menor_salario, idade_menor_salario);

  system("pause");
}