//15)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int quantidade_30_90 = 0, i, numero;
  for(i=1; i<= 10; i++){
    printf("Digite um numero\n");
    scanf("%d", &numero);
    if(numero >= 30 && numero <= 90)
      quantidade_30_90 += 1;
  }
  printf("A quantidade de numeros entre 30 e 90 é: %d\n", quantidade_30_90);
  system("pause");
}