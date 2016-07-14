//5)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int qtd_espacos = 15, qtd_espacos_p = 10, i, tipo, matricula, x=0, y=0, j;
  int logica[qtd_espacos], programacao[qtd_espacos_p];

  for(i=0;i<qtd_espacos;i++){
    printf("Digite o a sua matricula do aluno %d\n", (i + 1));
    scanf("%d", &matricula);
    printf("Digite o seu curso (1 - logica, 2 - programação) %d\n", i);
    scanf("%d", &tipo);

    if(tipo == 1){
      logica[x] = matricula;
      x++;
    }
    else if(tipo == 2){
      if(j < qtd_espacos_p){
        programacao[j] = matricula;
        j++;
      }
      else{
        printf("Sala lotada para programação\n");
      }
    }
    else{
      printf("Tipo inválido\n");
    }
  }

  printf("Matriculas alunos logica \n");
  for(i=0;i<qtd_espacos;i++){
    int v = logica[i];
    if(v != 0)
      printf("%d, ", v);
  }
  printf("\n");

  printf("Matriculas alunos programação \n");
  for(i=0;i<qtd_espacos_p;i++){
    int v = programacao[i];
    if(v != 0)
      printf("%d, ", v);
  }
  printf("\n");
  system("pause");
}