
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int i, index=8; //8
  char nomes[index][100];
  int locacoes[index];

  for(i=0;i<index;i++){
    printf("Digite o nome do %dº cliente:\n", (i + 1));
    scanf("%s", nomes[i]);

    int locacao = 1999;
    while(locacao >= 1999){
      printf("Digite a quantidade de locações do %s:\n", nomes[i]);
      scanf("%d", &locacao);

      if(locacao >= 1999){
        printf("A quantidade de locações do %s precisa ser menor do que 1999\n", nomes[i]);
      }
    }

    locacoes[i] = locacao;
  }

  for(i=0;i<index;i++){
    printf("cliente: %s - %d locações gratis\n", nomes[i], (locacoes[i] / 10));
  }

  system("pause");
}