//12)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float idade_mais_50_anos = 0;
  int i = 0, idade = 0, altura = 0;
  float quantidade_10_20_anos = 0;
  float altura_10_20_anos = 0;
  float quantidade_inverior_40_quilos = 0;
  float media_inverior_40_quilos, peso = 0;
  float todas_pessoas = 0;

  for(i=1; i<=10; i++){
    printf("Digite a idade\n");
    scanf("%d", &idade);
    printf("Digite a altura\n");
    scanf("%d", &altura);
    printf("Digite a peso\n");
    scanf("%f", &peso);

    if(idade > 50)
      idade_mais_50_anos += 1;
    else if(idade >= 10 && idade <= 20){
      quantidade_10_20_anos += 1;
      altura_10_20_anos += altura;
    }
    
    if(peso < 40)
      quantidade_inverior_40_quilos += 1;

    todas_pessoas = i;
  }

  printf("Pessoas com mais de 50 anos: %.0f\n", idade_mais_50_anos);

  float media_10_20_anos  = altura_10_20_anos / quantidade_10_20_anos;
  printf("A média das alturas das pessoas entre 10 a 20 anos: %.2f\n", media_10_20_anos);

  float porcentagem = quantidade_inverior_40_quilos / todas_pessoas * 100;
  printf("A porcentagem de pessoas com peso inferior a 40 quilos é: %.2f%%\n", porcentagem);

  system("pause");
}