//36)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float alturas_mais_50 = 0;
  float qtd_alturas_mais_50 = 0, altura;
  int idade;
  
  while(1 == 1){
    printf("Digite a idade\n");
    scanf("%d", &idade);

    if(idade <= 0)
      break;

    printf("Digite a altura\n");
    scanf("%f", &altura);

    if(idade > 50){
      alturas_mais_50 += altura;
      qtd_alturas_mais_50 += 1;
    }
  }

  if(qtd_alturas_mais_50 > 0)
    printf("Média das alturas de pessoas com mais de 50 anos: %.2f\n", (alturas_mais_50/qtd_alturas_mais_50));
  else
    printf("Nenhuma pessoa com mais de 50 anos\n");

  system("pause");
}