
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int i, index=6; //6
  char nomes[index][100];
  float notas_1[index];
  float notas_2[index];

  for(i=0;i<index;i++){
    printf("Digite o nome do %dº aluno:\n", (i + 1));
    scanf("%s", nomes[i]);

    printf("Digite a 1º nota do %s:\n", nomes[i]);
    scanf("%f", &notas_1[i]);

    printf("Digite a 2º nota do %s:\n", nomes[i]);
    scanf("%f", &notas_2[i]);
  }

  printf("Relatório de notas:\n");
  printf("Aluno    1º nota    2º Nota    Média    Situação:\n");
  float soma = 0;
  int aprovados = 0;
  int exame = 0;
  int reprovados = 0;
  for(i=0;i<index;i++){
    float media = (notas_1[i] + notas_2[i]) / 2;
    soma += media;
    char situacao[100] = "Aprovado";
    if(media < 5){
      strcpy(situacao, "Reprovado");
      reprovados++;
    }
    else if(media < 7){
      strcpy(situacao, "Exame");
      exame++;
    }
    else aprovados++;
    printf("%s   %.1f       %.1f        %.1f      %s\n", nomes[i], notas_1[i], notas_2[i], media, situacao);
  }

  printf("A média da classe: %.1f\n", (soma / index));
  printf("A quantidade de aprovados: %d\n", aprovados);
  printf("A quantidade de exame: %d\n", exame);
  printf("A quantidade de reprovados: %d\n", reprovados);

  system("pause");
}