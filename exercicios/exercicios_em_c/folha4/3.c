//3)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int qtd_espacos = 2;
  int codigo_list[qtd_espacos], estoque_list[qtd_espacos];
  int i, codigo, quantidade, codigo_cli;
  int existe;

  printf("Adicionando estoque de produtos:\n");

  for(i=0;i<qtd_espacos;i++){
    printf("Codigo do produto\n");
    scanf("%d", &codigo);

    printf("Quantidade em estoque\n");
    scanf("%d", &quantidade);

    codigo_list[i] = codigo;
    estoque_list[i] = quantidade;
  }

  
  while(1 == 1){
    printf("Digite o código do cliente ou zero para sair\n");
    scanf("%d", &codigo_cli);
    if(codigo_cli <= 0) break;

    printf("Digite o código do produto\n");
    scanf("%d", &codigo);

    existe = 0;
    int index_produto = 0;
    int qtd = (int)(sizeof(codigo_list)/sizeof(codigo_list[0]));
    for(i=0;i<qtd;i++){
      if(codigo_list[i] == codigo){
        existe = 1;
        index_produto = i;
      }
    }

    if(existe == 0){
      printf("Código do produto não existe\n");
      continue;
    }

    printf("Digite a quantidade que deseja\n");
    scanf("%d", &quantidade);

    if(quantidade > estoque_list[index_produto])
      printf("Não temos estoque suficiente desta mercadoria\n");
    else{
      printf("Pedito atendido. obrigado e volte sempre\n");
      int v = estoque_list[index_produto];
      estoque_list[index_produto] = v - quantidade;
    }
  }

  for(i=0;i<qtd_espacos;i++){
    printf("Codigo do produto: %d, ficou com o estoque de %d\n", codigo_list[i], estoque_list[i]);
  }
  system("pause");
}