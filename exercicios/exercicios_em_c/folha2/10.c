//10)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float custo_de_fabrica = 0, porcentagem_distribuidor = 0, impostos = 0;
  
  printf("Digite o custo de fabrica de um carro\n");
  scanf("%f", &custo_de_fabrica);
  if(custo_de_fabrica <= 12000){
    porcentagem_distribuidor = (custo_de_fabrica * 5) / 100;
    impostos = 0;
    printf("O custo para o consumidor é de: %.2f\n", (custo_de_fabrica + porcentagem_distribuidor + impostos));
  }
  else if(custo_de_fabrica <= 25000){
    porcentagem_distribuidor = (custo_de_fabrica * 10) / 100;
    impostos = (custo_de_fabrica * 15) / 100;
    printf("O custo para o consumidor é de: %.2f\n", (custo_de_fabrica + porcentagem_distribuidor + impostos));
  }
  else{
    porcentagem_distribuidor = (custo_de_fabrica * 15) / 100;
    impostos = (custo_de_fabrica * 20) / 100;
    printf("O custo para o consumidor é de: %.2f\n", (custo_de_fabrica + porcentagem_distribuidor + impostos));
  }
  system("pause");
}