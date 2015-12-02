
//23)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float idades_otimo = 0;
  float qtd_otimo = 0;

  float qtd_regular = 0;
  float qtd_bom = 0;
  float total = 15;
  int idade, opiniao, i;

  for(i=1; i<= total; i++){
    printf("Digite a idade\n");
    scanf("%d", &idade);

    printf("Digite sua opinião (ótimo - 3, bom - 2, regular - 1)\n");
    scanf("%d", &opiniao);

    if(opiniao == 3){
      qtd_otimo += 1;
      idades_otimo += idade;
    }
    else if(opiniao == 1)
      qtd_regular += 1;
    else if(opiniao == 2)
      qtd_bom += 1;
  }

  printf("Média de idade das pessoas que respondeu ótimo: %.2f\n", (idades_otimo / qtd_otimo)); 
  printf("Quantidade de pessoas que respondeu regular: %.0f\n", qtd_regular); 
  float porcentagem = qtd_bom / total * 100;
  printf("Porcentagem que respondeu bom: %.0f%%\n", porcentagem);  
  system("pause");
}