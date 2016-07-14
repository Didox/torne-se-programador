//24)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float preco = 0;
  int categoria = 0;
  char situacao;
  
  printf("Digite o preço\n");
  scanf("%f", &preco);
  printf("Digite a categoria 1,2,3\n");
  scanf("%d", &categoria);
  printf("Digite a situação R,N\n");
  scanf(" %c",&situacao);

  if(categoria == 1 || categoria == 2 || categoria == 3)
    if(situacao == 'R' || situacao == 'N' ){
      float aumento = 0;
      if(preco <= 25){
        switch(categoria){
        case 1:
          aumento = (preco * 5) / 100;
          break;
        case 2:
          aumento = (preco * 8) / 100;
          break;
        case 3:
          aumento = (preco * 10) / 100;
          break;
        }
      }
      else if(preco > 25){
        switch(categoria){
          case 1:
            aumento = (preco * 12) / 100;
            break;
          case 2:
            aumento = (preco * 15) / 100;
            break;
          case 3:
            aumento = (preco * 18) / 100;
            break;
        }
      }
      
      float imposto = 0;
      if(categoria == 2 && situacao == 'R')
        imposto = (preco * 5) / 100;
      else
        imposto = (preco * 8) / 100;

      float novo_preco = preco + aumento - imposto;
      if(novo_preco <= 50)
        printf("Barato\n");
      else if(novo_preco >= 50 && novo_preco <= 120)
        printf("Normal\n");
      else if(novo_preco > 120)
        printf("Caro\n");
    }
    else
      printf("Situação inválida\n");
  else
    printf("Categoria inválida\n");
  system("pause");
}