//17)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int senha = 0;
  
  printf("Digite sua senha\n");
  scanf("%d", &senha);
  if(senha == 4531)
    printf("Acesso concedido\n");
  else
    printf("Senha inválida\n");
  system("pause");
}