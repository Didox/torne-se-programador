//34)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  int candidato1 = 0;
  int candidato2 = 0;
  int candidato3 = 0;
  int candidato4 = 0;
  float nulos = 0;
  float brancos = 0;
  float total_votos = 0;
  int c;
  
  while(1 == 1){
    printf("Digite o código de seu candidato\n");
    scanf("%d", &c);
    
    switch(c){
      case 1:
        candidato1 += 1;
      case 2:
        candidato2 += 1;
      case 3:
        candidato3 += 1;
      case 4:
        candidato4 += 1;
      case 5:
        nulos += 1;
      case 6:
        brancos += 1;
      case 0:
        break;
      default:
        printf("opção inválida\n");
    }

    total_votos += 1;
  }

  printf("O total de votos para o candidato 1: %d\n", candidato1);
  printf("O total de votos para o candidato 2: %d\n", candidato2);
  printf("O total de votos para o candidato 3: %d\n", candidato3);
  printf("O total de votos para o candidato 4: %d\n", candidato4);
  printf("O total de votos nulos: %.0f\n", nulos);
  printf("O total de votos brancos: %.0f\n", brancos);

  float porcentagem = nulos / total_votos * 100;
  printf("Porcentagem de votos nulos: %.0f%%\n", porcentagem);

  porcentagem = brancos / total_votos * 100;
  printf("Porcentagem de votos brancos: %.0f%%\n", porcentagem);

  system("pause");
}
