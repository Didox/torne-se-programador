//13)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int idade_mais_90_quilos = 0, i = 0, idade = 0;
  int idades = 0;
  int todas_pessoas = 0;
  float peso = 0;

  for(i=1; i<=7; i++){
    printf("Digite a idade\n");
    scanf("%d", &idade);
    printf("Digite a peso\n");
    scanf("%f", &peso);

    if(peso > 90)
      idade_mais_90_quilos += 1;
    
    idades += idade;
    todas_pessoas = i;
  }

  printf("Pessoas com mais de 90 quilos: %d\n", idade_mais_90_quilos);
  printf("Média de idade das pessoas: %d\n", (idades / todas_pessoas));
  system("pause");
}