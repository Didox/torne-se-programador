//2)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int n1 = 0, n2 = 0;
  float media = 0.0;

  printf("Digite a primeira nota\n");
  scanf("%d", &n1);
  printf("Digite a segunda nota\n");
  scanf("%d", &n2);
  media = (n1+n2) / 2;

  if(media >=7 )
    printf("Aluno aprovado, sua nota foi: %f\n\n", media);
  else if(media >=4 )
    printf("Aluno de exame, sua nota foi: %f\n\n", media);
  else
    printf("Aluno reprovado, sua nota foi: %f\n\n", media);
  system("pause");
}