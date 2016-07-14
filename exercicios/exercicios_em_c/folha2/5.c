//5)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int  n1 = 0, n2 = 0, diferenca = 0;

  printf("Digite um numero\n");
  scanf("%d", &n1);
  printf("Digite outro numero\n");
  scanf("%d", &n2);

  if(n1 == 1)
    printf("a média entre os dos numeros é: %d\n", ((n1+n2) / 2));
  else if(n1 == 2){
    diferenca = 0;
    if(n1>=n2)
      diferenca = n1-n2;
    else
      diferenca = n2-n1;
    printf("A diferença do maior pelo menor é: %d\n", diferenca);
  }
  else if(n1 == 3)
    printf("o produto entre os numeros é: %d\n", (n1*n2) );
  else if(n1 == 4){
    if(n2 == 0)
      printf("O segundo numero não pode ser zero\n");
    else
      printf("a divisão do primeiro pelo segundo é: %d\n", (n1/n2));
  }
  else
    printf("opção inválida\n");
  system("pause");
}