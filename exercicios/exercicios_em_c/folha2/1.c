#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int n1 = 0, n2 = 0, n3 = 0, n4 = 0;
  float media = 0.0;

  printf("Digite a primeira nota\n");
  scanf("%d", &n1);
  printf("Digite a segunda nota\n");
  scanf("%d", &n2);
  printf("Digite a terceira nota\n");
  scanf("%d", &n3);
  printf("Digite a quarta nota\n");
  scanf("%d", &n4);

  media = (n1+n2+n3+n4) / 4;

  if(media >= 7 )
    printf("Aluno aprovado, sua nota foi: %f\n\n", media);
  else
    printf("Aluno reprovado, sua nota foi: %f\n\n", media);
  
  system("pause");
}