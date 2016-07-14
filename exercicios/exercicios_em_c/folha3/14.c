//14)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float idade_superior_50_peso_inferior_60 = 0;
  float qtd_inferior_peso_1_50 = 0;
  float idades_inferior_peso_1_50 = 0;
  float todas_pessoas = 0;
  float qtd_olhos_azuis = 0;
  float qtd_ruivos_nao_olhos_azuis = 0;
  int idade, peso, altura, i;
  char olhos, cabelos;

  for(i=1; i<=20; i++){
    printf("Digite a idade\n");
    scanf("%d", &idade);
    printf("Digite a peso\n");
    scanf("%d", &peso);
    printf("Digite a altura\n");
    scanf("%d", &altura);
    printf("Digite a cor dos olhos\n");
    scanf(" %c",&olhos);
    printf("Digite a cor dos cabelos\n");
    scanf(" %c",&cabelos);

    if(idade > 50 && peso < 60)
      idade_superior_50_peso_inferior_60 += 1;
    
    if(altura < 1.50){
      qtd_inferior_peso_1_50 += 1;
      idades_inferior_peso_1_50 += idade;
    }

    if(olhos == 'A')
      qtd_olhos_azuis += 1;

    if(cabelos == 'R' && olhos != 'A')
      qtd_ruivos_nao_olhos_azuis += 1;

    todas_pessoas = i;
  }

  printf("Pessoas superior a 50 anos e inferior a 60 quilos: %.0f\n", idade_superior_50_peso_inferior_60);
  if(qtd_inferior_peso_1_50 < 1)
    qtd_inferior_peso_1_50 = 1;
  printf("A media de pessoas inferiores a 1.5: %.2f\n", (idades_inferior_peso_1_50 / qtd_inferior_peso_1_50));
  float porcentagem = qtd_olhos_azuis / todas_pessoas * 100;
  printf("A porcentagem de pessoas com olhos azuis são: %.0f%%\n", porcentagem);
  printf("A quantidade de pessoas ruivos que não possuem olhos azuis: %.0f\n", qtd_ruivos_nao_olhos_azuis);

  system("pause");
}