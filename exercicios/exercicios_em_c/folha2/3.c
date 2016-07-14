//3)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int n1 = 0, n2 = 0;

  printf("Digite um numero \n");
  scanf("%d", &n1);
  printf("Digite outro numero \n");
  scanf("%d", &n2);

  
  if(n1 < n2){
    printf("\n%d é o numero menor\n\n",n1);
  }
  else if(n2 < n1){
    printf("\n%d é o numero menor\n\n",n2);
  }
  else{
    printf("\nos numeros são iguais\n");
  }

  system("pause");
}