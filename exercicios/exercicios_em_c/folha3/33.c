//33)

#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  while(1 == 1) {
    printf("Menu de opções\n");
    printf("1 - Média aritimética\n");
    printf("2 - Média ponderada\n");
    printf("3 - Sair\n");

    int c, n1, n2, n3, p1, p2, p3;
    scanf("%d", &c);
    
    switch(c){
      case 1:
        printf("Digite a nota 1\n");
        scanf("%d", &n1);

        printf("Digite a nota 1\n");
        scanf("%d", &n2);

        printf("A média aritimética das notas é: %d\n", ((n1+n2)/2));
        break;
      case 2:

        printf("Digite a nota 1\n");
        scanf("%d", &n1);

        printf("Digite o peso 1\n");
        scanf("%d", &p1);

        printf("Digite a nota 2\n");
        scanf("%d", &n2);

        printf("Digite o peso 2\n");
        scanf("%d", &p2);

        printf("Digite a nota 3\n");
        scanf("%d", &n3);

        printf("Digite o peso 3\n");
        scanf("%d", &p3);

        float media = (n1 * p1 + n2 * p2 + n2 * p3) / (p1 + p2 + p3);

        printf("A média ponderada das notas é: %.0f\n", media);
        break;
      case 3:
        return 0;
        break;
      default:
        printf("opção inválida\n");
        break;
    }

  }

  system("pause");
}