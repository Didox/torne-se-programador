//19)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int idades = 0;
  int idade = 1;
  int quantidade = 0;
  while(idade != 0){
    quantidade += 1;
    printf("Digite a idade\n");
    scanf("%d", &idade);
    idades += idade;
  }

  printf("A idade média é: %d\n", (idades/quantidade));
  system("pause");
}