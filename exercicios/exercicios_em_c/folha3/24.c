//24)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float mulheres_sim = 0;
  float total_sim = 0;
  float total_nao = 0;
  float total_homem = 0;
  float total_homem_nao = 0;
  char resposta, sexo, i;

  for(i=1; i<= 10; i++){
    printf("Digite sexo M/F\n");
    scanf(" %c",&sexo);

    printf("Digite a resposta S/N\n");
    scanf(" %c",&resposta);

    if(resposta == 'S'){
      total_sim += 1;
      if(sexo == 'F')
        mulheres_sim += 1;
    }
    else if(resposta == 'N'){
      total_nao += 1;
      if(sexo == 'M')
        total_homem_nao += 1;
    }

    if(sexo == 'M')
      total_homem += 1;
  }


  printf("Pessoas que falaram sim: %.0f\n", total_sim); 
  printf("Pessoas que falaram não: %.0f\n", total_nao); 
  printf("Mulheres que falaram sim: %.0f\n", mulheres_sim); 
  float porcentagem = total_homem_nao / total_homem * 100;
  printf("Porcentagem de homens não entre todos os homens: %.0f%%\n", porcentagem);  
  system("pause");
}