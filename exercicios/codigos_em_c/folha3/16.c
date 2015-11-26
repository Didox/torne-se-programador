//16)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float idades = 0;
  float peso_superior_90_altura_inferior_1_50 = 0;
  float qtd_pessoas_10_30_anos_e_mais_1_90_altura = 0;
  float todas_pessoas = 0;
  int idade, i;
  float peso,altura; 

  for(i=1; i<= 10; i++){
    printf("Digite a idade\n");
    scanf("%d", &idade);

    printf("Digite um peso\n");
    scanf("%f", &peso);

    printf("Digite uma altura\n");
    scanf("%f", &altura);

    if(peso > 90 && altura < 1.50)
      peso_superior_90_altura_inferior_1_50 += 1;

    if(altura > 1.90){
      if(idade >= 10 && idade <= 30)
        qtd_pessoas_10_30_anos_e_mais_1_90_altura += 1;
    }

    idades += idade;
    todas_pessoas = i;
  }
  printf("A média de idades é: %.2f\n", (idades/10));
  printf("Quantidade de pessoas com altura superior a 90 e peso inverior a 1.50: %.0f\n", peso_superior_90_altura_inferior_1_50);
  float porcentagem = qtd_pessoas_10_30_anos_e_mais_1_90_altura / todas_pessoas * 100;
  printf("Porcentagem de pessoas que medem mais de 1,90 e com idade entre 10 e 30: %.0f%%\n", porcentagem);

  system("pause");
}