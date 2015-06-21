//32)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  float numeros_inferior_35 = 0;
  float quantidade_positivos = 0;
  float total_positivos = 0;
  float todos_numeros = 0;
  float numeros_entre_50_100 = 0;
  float numeros_entre_10_20 = 0;
  int numero, i;

  for(i=1; i<= 3; i++){
    printf("Digite um numero\n");
    scanf("%d", &numero);

    if(numero < 35)
      numeros_inferior_35 += 1;

    if(numero >= 0){
      quantidade_positivos += 1;
      total_positivos += numero;
    }
    
    if(numero >= 50 && numero <= 100)
      numeros_entre_50_100 += 1;

    if(numero < 50){
      if(numero >= 10 && numero <= 20)
        numeros_entre_10_20 += 1;
    }
    todos_numeros += 1;
  }

  printf("Quantidade de numeros inveriores a 35 é: %.0f\n", numeros_inferior_35);
  printf("Media de numeros positivos é: %.2f\n", (total_positivos / quantidade_positivos));
  float porcentagem = numeros_entre_50_100 / todos_numeros * 100;
  printf("Porcentagem de numeros entre 50 a 100 é: %.0f%%\n", porcentagem);
  porcentagem = numeros_entre_10_20 / todos_numeros * 100;
  printf("Porcentagem de numeros entre 10 a 20 e menor que 50 é: %.0f%%\n", porcentagem);

  system("pause");
}
