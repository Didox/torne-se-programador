
#include <stdio.h>
#include <string.h>
int main() 
{
  int qtd_espacos = 1, i, x=0; //10
  char nome_produtos[qtd_espacos][100];
  int codigo_produtos[qtd_espacos];
  float preco_produtos[qtd_espacos];

  for(i=0;i<qtd_espacos;i++){
    printf("Digite o nome do produto \n");
    scanf("%s", nome_produtos[i]);

    printf("Digite o código do produto \n");
    scanf("%d", &codigo_produtos[i]);

    printf("Digite o preço do produto \n");
    scanf("%f", &preco_produtos[i]);
  } 


  char nome_produtos_aumento[qtd_espacos][100];
  int codigo_produtos_aumento[qtd_espacos];
  float preco_produtos_aumento[qtd_espacos];
  int porcentagem_aumento[qtd_espacos];
  for(i=0;i<qtd_espacos;i++){
    float resto = codigo_produtos[i] % 2;
    int porcentagem = 0;

    if(resto < 1){
      porcentagem = 15;
      if(preco_produtos[i] > 1000){
        porcentagem = 20;
        porcentagem_aumento[x] = porcentagem;
        strcpy(nome_produtos_aumento[x], nome_produtos[i]);
        codigo_produtos_aumento[x] = codigo_produtos[i];
        preco_produtos_aumento[x] =  preco_produtos[i] + (preco_produtos[i] * porcentagem / 100);
        x++;
      }
      else{
        porcentagem_aumento[x] = porcentagem;
        strcpy(nome_produtos_aumento[x], nome_produtos[i]);
        codigo_produtos_aumento[x] = codigo_produtos[i];
        preco_produtos_aumento[x] =  preco_produtos[i] + (preco_produtos[i] * porcentagem / 100);
        x++;
      }
    }
    else if(preco_produtos[i] > 1000){
      porcentagem = 10;
      porcentagem_aumento[x] = porcentagem;
      strcpy(nome_produtos_aumento[x], nome_produtos[i]);
      codigo_produtos_aumento[x] = codigo_produtos[i];
      preco_produtos_aumento[x] =  preco_produtos[i] + (preco_produtos[i] * porcentagem / 100);
      x++;
    }

  }

  printf("Os produtos que tiveram aumentos foram:\n");
  for(i=0;i<qtd_espacos;i++){
    if(strncmp(nome_produtos_aumento[i],"", 2) > 0){
      printf("Código: %d - Nome: %s - Porcentagem Aumento: %d%% - Novo preço: %.2f\n", codigo_produtos_aumento[i], nome_produtos_aumento[i], porcentagem_aumento[i], preco_produtos_aumento[i]);
    }
  }


  getchar();
  return 0;
}