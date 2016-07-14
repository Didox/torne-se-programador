//1)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int vetor[6], pares[3], impares[3];
  int i;

  for(i=0;i<6;i++){
    vetor[i] = (i+1);
  }

  int qtd_pares = 0, x = 0, qtd_impares = 0, j = 0;
  int qtd = (int)(sizeof(vetor)/sizeof(vetor[0]));

  for(i=0;i<qtd;i++){
    int valor = vetor[i];
    float sobra = valor % 2;
    if(sobra <= 0){
      qtd_pares += 1;
      pares[x] = valor;
      x++;
    }
    else{
      qtd_impares += 1;
      impares[j] = valor;
      j++;
    }
  }

  printf("Quantidade de numeros pares é: %d\n", qtd_pares);
  printf("Os numeros pares são: ");
  qtd = (int)(sizeof(pares)/sizeof(pares[0]));
  for(i=0;i<qtd;i++){
    printf("%d, ", pares[i]);
  }
  printf("\n");

  printf("Quantidade de numeros impares é: %d\n", qtd_impares);
  printf("Os numeros impares são: ");
  qtd = (int)(sizeof(impares)/sizeof(impares[0]));
  for(i=0;i<qtd;i++){
    printf("%d, ", impares[i]);
  }
  printf("\n");
  system("pause");
}