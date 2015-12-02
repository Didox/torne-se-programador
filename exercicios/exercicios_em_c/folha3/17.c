//17)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int idades = 0;
  int idades_mulheres = 0;
  int idades_homens = 0;
  int quantidade = 7;
  int quantidade_mulheres = 0;
  int quantidade_homens = 0, i, idade;
  char sexo;

  for(i=1; i<= quantidade; i++){
    printf("Digite a idade\n");
    scanf("%d", &idade);

    printf("Digite o sexo M/F\n");
    scanf(" %c",&sexo);

    idades += idade;

    if(sexo == 'M'){
      idades_homens += idade;
      quantidade_homens += 1;
    }

    if(sexo == 'F'){
      idades_mulheres += idade;
      quantidade_mulheres += 1;
    }
  }

  printf("A idade média do grupo é: %d\n", (idades/quantidade));
  printf("A idade média das mulheres é: %d\n", (idades_mulheres/quantidade_mulheres));
  printf("A idade média dos homens é: %d\n", (idades_homens/quantidade_homens));
  system("pause");
}