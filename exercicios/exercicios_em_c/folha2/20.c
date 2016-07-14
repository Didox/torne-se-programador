//20)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int idade = 0;
  
  printf("Digite a idade do nadador\n");
  scanf("%d", &idade);
  if(idade >= 5 && idade <= 7)
    printf("Infantil\n");
  else if(idade >= 8 && idade <= 10)
    printf("Juvenil\n");
  else if(idade >= 11 && idade <= 15)
    printf("Adolescente\n");
  else if(idade >= 16 && idade <= 30)
    printf("Adulto\n");
  else if(idade > 30)
    printf("Sênior\n");
  system("pause");
}