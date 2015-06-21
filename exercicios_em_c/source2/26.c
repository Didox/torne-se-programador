//26)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int idades = 0;
  int qtd = 0;
  int idade = 1;
  while(idade != 0){
    if(idade == 0)
      break;

    printf("Digite uma idade\n");
    scanf("%d", &idade);
    
    idades += idade;
    qtd += 1;
  }

  printf("A média das idades é: %d\n", (idades / qtd)); 
  system("pause");
}