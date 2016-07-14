//8)
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int qtd_espacos = 7, i, x=0; //7
  char nome_alunos[qtd_espacos][100];
  float media_alunos[qtd_espacos];

  for(i=0;i<qtd_espacos;i++){
    printf("Digite o nome do aluno \n");
    scanf("%s", nome_alunos[i]);

    printf("Digite a média do aluno \n");
    scanf("%f", &media_alunos[i]);
  } 

  char aluno_com_maior_media[100];
  float maior_media = 0;
  char nome_alunos_reprovados[qtd_espacos][100];

  for(i=0;i<qtd_espacos;i++){
    if(maior_media < media_alunos[i]){
      maior_media = media_alunos[i];
      strcpy(aluno_com_maior_media, nome_alunos[i]);
    }

    if(media_alunos[i] < 7){
      strcpy(nome_alunos_reprovados[x], nome_alunos[i]);
      x++;
    }
  }

  printf("O aluno com maior media é: %s - media: %.2f\n", aluno_com_maior_media, maior_media);
  printf("Alunos reprovados que precisam tirar 5.0 no exame:\n");
  for(i=0;i<qtd_espacos;i++){
    if(strncmp(nome_alunos_reprovados[i],"", 2) > 0){
      printf(" %s \n", nome_alunos_reprovados[i]);
    }
  }
  system("pause");
}