//25)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int maior_nota = 0;
  int menor_nota = 0;
  int reprovados = 0;
  float total_alunos = 10;
  float reprovado_por_faltas = 0;
  int i, matricula, aulas, n1, n2, n3;
  char status;

  for(i=1; i<= total_alunos; i++){
    printf("Digite o numero da matricula\n");
    scanf("%d", &matricula);

    printf("Digite nota 1\n");
    scanf("%d", &n1);
    printf("Digite nota 2\n");
    scanf("%d", &n2);
    printf("Digite nota 3\n");
    scanf("%d", &n3);

    printf("Digite o numero de aulas frequentadas\n");
    scanf("%d", &aulas);

    float media = (n1+n2+n3) / 3;
    status = 'A';

    if(aulas < 40){
      status = 'R';
      reprovados += 1;
      reprovado_por_faltas += 1;
    }
    else{
      if(media < 6){
        status = 'A';
        reprovados += 1;
      }
    }

    if(reprovado_por_faltas == 0){
      printf("\n\nAluno da matricula %d, sua média é: %.0f e você está: ", matricula, media);
      if(status == 'A')
        printf("Aprovado\n\n");
      else
        printf("Reprovado\n\n"); 
    }
    else
      printf("\n\nAluno da matricula %d reprovado por faltas\n\n", matricula); 

    if(maior_nota < n1)
      maior_nota = n1;

    if(maior_nota < n2)
      maior_nota = n2;

    if(maior_nota < n3)
      maior_nota = n3;


    if(menor_nota == 0)
      menor_nota = n1;
    
    if(menor_nota > n1)
      menor_nota = n1;

    if(menor_nota > n2)
      menor_nota = n2;

    if(menor_nota > n3)
      menor_nota = n3;
  }

  printf("A maior nota da turma é %d, e a menor é %d\n", maior_nota, menor_nota); 
  printf("O total de alunos reprovados é de: %d\n", reprovados); 
  float porcentagem = reprovado_por_faltas / total_alunos * 100;
  printf("Porcentagem alunos reprovados por faltas: %.0f%%\n", porcentagem); 

  system("pause");
}