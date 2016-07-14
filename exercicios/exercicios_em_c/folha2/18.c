//18)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int idade = 0;

  printf("Digite sua idade\n");
  scanf("%d", &idade);
  if(idade >= 18)
    printf("Você atingiu a maioridade\n");
  else
    printf("Você é de menor\n");
  system("pause");
}