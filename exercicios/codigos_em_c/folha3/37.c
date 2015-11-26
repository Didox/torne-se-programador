//37)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  while(1 == 1){
    printf("Menu de opções\n");
    printf("1 - Adição\n");
    printf("2 - Subitração\n");
    printf("3 - Multiplicação\n");
    printf("4 - Divisão\n");
    printf("5 - Sair\n");

    int c, n1, n2;
    scanf("%d", &c);
    
    switch(c){
      case 1:
        printf("Digite um numero\n");
        scanf("%d", &n1);

        printf("Digite um numero\n");
        scanf("%d", &n2);

        printf("A Adição dos numeros é: %d\n", (n1+n2));
        break;
      case 2:
        printf("Digite um numero\n");
        scanf("%d", &n1);

        printf("Digite um numero\n");
        scanf("%d", &n2);

        printf("A Subitração dos numeros é: %d\n", (n1-n2));
        break;
      case 3:
        printf("Digite um numero\n");
        scanf("%d", &n1);

        printf("Digite um numero\n");
        scanf("%d", &n2);

        printf("A Multiplicação dos numeros é: %d\n", (n1*n2));
        break;
      case 4:
        printf("Digite um numero\n");
        scanf("%d", &n1);

        printf("Digite um numero\n");
        scanf("%d", &n2);

        printf("A Divisão dos numeros é: %d\n", (n1/n2));
        break;
      case 5:
        return 0;
        break;
      default:
        printf("opção inválida\n");
        break;
    }
  }
  system("pause");
}
