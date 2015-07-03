
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int cont=15, x=0, i, primos[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}; //15

  printf("Script mostra numeros primos:\n");


  for(i=0;i<cont;i++){
    printf("Digite um numero:\n");
    int nb, dv=0;
    scanf("%d", &nb);

    for (i = 1; i <= nb; i++) {
      if (nb % i == 0) { 
        dv++;
      }
    }

    if(dv == 2){
      primos[x] = nb;
      x++;
    } 
  }

  
  printf("Os numeros primos são: \n");
  for(i=0;i<cont;i++){
    if(primos[i] != 0)
      printf("%d, ", primos[i]);
  }
  printf("\n");

  system("pause");
}