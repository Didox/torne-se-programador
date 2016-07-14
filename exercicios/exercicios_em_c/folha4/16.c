
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int i, index=5, x=0; //5
  char nome[100];
  float preco;
  int precos_inferior_50 = 0;
  char nome_produtos_entre_50_100[index][100];
  int quantidade_produtos_superior_100 = 0;
  float procos_produtos_superior_100 = 0;

  for(i=0;i<index;i++){
    printf("Digite o nome do produto:\n");
    scanf("%s", nome);

    printf("Digite o preço do produto:\n");
    scanf("%f", &preco);

    if(preco < 50) precos_inferior_50++;

    if(preco >=50 && preco <= 100){
      strcpy(nome_produtos_entre_50_100[x], nome);
      x++;
    }

    if(preco > 100){
      quantidade_produtos_superior_100++;
      procos_produtos_superior_100 += preco;
    }
  }

  printf("Quantidade de produtos com preço menor que R$ 50 é: %d\n", precos_inferior_50);
  printf("Nome dos produtos entre R$ 50  a R$ 100 é: \n");
  for(i=0;i<index;i++){
    if(strncmp(nome_produtos_entre_50_100[i],"", 2) > 0){
      printf("  %s\n", nome_produtos_entre_50_100[i]);
    }
  }
  printf("Média dos preços maior que R$ 100 é: %.1f\n", (procos_produtos_superior_100 / quantidade_produtos_superior_100));

  system("pause");
}