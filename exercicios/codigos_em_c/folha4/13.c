
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int i, index=8; //8
  char nomes[index][100];
  float notas[index];

  for(i=0;i<index;i++){
    printf("Digite o nome do %dº aluno:\n", (i + 1));
    scanf("%s", nomes[i]);

    printf("Digite a nota do %s:\n", nomes[i]);
    scanf("%f", &notas[i]);
  }

  printf("Relatório de notas:\n");
  printf("Aluno  Nota\n");
  float soma = 0;
  for(i=0;i<index;i++){
    soma += notas[i];
    printf("%s %.1f\n", nomes[i], notas[i]);
  }

  printf("A média da classe é %.1f:\n", (soma / index));

  system("pause");
}