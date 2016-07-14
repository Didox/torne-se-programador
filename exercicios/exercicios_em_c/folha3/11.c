//11)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float valor_vista = 0, valor_prazo = 0, valor = 0;
  char transacao;
  int i = 0;

  for(i=1; i<=10; i++){
    printf("Digite o código da transação V,P\n");
    scanf(" %c",&transacao);
    printf("Digite o valor\n");
    scanf("%f", &valor);
    if(transacao == 'V')
      valor_vista += valor;
    else if(transacao == 'P')
      valor_prazo += valor;
  }

  printf("Valor total a vista %.2f\n", valor_vista);
  printf("Valor total a prazo %.2f\n", valor_prazo);
  printf("Valor total %.2f\n", (valor_vista + valor_prazo));
  printf("Valor da primeira prestação a prazo é %.2f\n", (valor_prazo / 3));
  system("pause");
}