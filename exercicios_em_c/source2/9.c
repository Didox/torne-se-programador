//9)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int numero = 0, i = 0;
  printf("Digite um numero\n");
  scanf("%d",&numero);

  printf("Taboada é:\n");
  for(i=1; i<=10; i++){
    printf("%d X %d = %d\n", numero, i, (numero * i));
  }
  system("pause");
}