//9)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float saldo = 0, porcentagem = 0;

  printf("Digite seu saldo médio\n");
  scanf("%f", &saldo);

  if(saldo <= 200){
    porcentagem = (saldo * 10) / 100;
    printf("O saldo médio é de: %.2f e o valor do credito é de 10%%: %.2f\n", (saldo + porcentagem), porcentagem);
  }
  else if(saldo <= 300){
    porcentagem = (saldo * 20) / 100;
    printf("O saldo médio é de: %.2f e o valor do credito é de 20%%: %.2f\n", (saldo + porcentagem), porcentagem);
  }
  else if(saldo <= 400){
    porcentagem = (saldo * 25) / 100;
    printf("O saldo médio é de: %.2f e o valor do credito é de 25%%: %.2f\n", (saldo + porcentagem), porcentagem);
  }
  else{
    porcentagem = (saldo * 30) / 100;
    printf("O saldo médio é de: %.2f e o valor do credito é de 30%%: %.2f\n", (saldo + porcentagem), porcentagem);
  }
  system("pause");
}