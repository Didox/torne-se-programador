
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//LISTA DE EXERCICIO 2

//ESTRUTURA CONDICIONAL
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//1)
#include <stdio.h>
#include <stdlib.h>  
int main() 
{
  int n1 = 0, n2 = 0, n3 = 0, n4 = 0;
  float media = 0.0;

  printf("Digite a primeira nota\n");
  scanf("%d", &n1);
  printf("Digite a segunda nota\n");
  scanf("%d", &n2);
  printf("Digite a terceira nota\n");
  scanf("%d", &n3);
  printf("Digite a quarta nota\n");
  scanf("%d", &n4);

  media = (n1+n2+n3+n4) / 4;

  if(media >= 7 )
    printf("Aluno aprovado, sua nota foi: %f\n\n", media);
  else
    printf("Aluno reprovado, sua nota foi: %f\n\n", media);

  system("pause");
}

//2)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int n1 = 0, n2 = 0;
  float media = 0.0;

  printf("Digite a primeira nota\n");
  scanf("%d", &n1);
  printf("Digite a segunda nota\n");
  scanf("%d", &n2);
  media = (n1+n2) / 2;

  if(media >=7 )
    printf("Aluno aprovado, sua nota foi: %f\n\n", media);
  else if(media >=4 )
    printf("Aluno de exame, sua nota foi: %f\n\n", media);
  else
    printf("Aluno reprovado, sua nota foi: %f\n\n", media);
  system("pause");
}

//3)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int n1 = 0, n2 = 0;

  printf("Digite um numero \n");
  scanf("%d", &n1);
  printf("Digite outro numero \n");
  scanf("%d", &n2);

  
  if(n1 < n2){
    printf("\n%d é o numero menor\n\n",n1);
  }
  else if(n2 < n1){
    printf("\n%d é o numero menor\n\n",n2);
  }
  else{
    printf("\nos numeros são iguais\n");
  }

  system("pause");
}

//4)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int n1 = 0, n2 = 0;

  printf("Digite um numero \n");
  scanf("%d", &n1);
  printf("Digite outro numero \n");
  scanf("%d", &n2);

  
  if(n1 > n2){
    printf("\n%d é o numero maior\n\n",n1);
  }
  else if(n2 > n1){
    printf("\n%d é o numero maior\n\n",n2);
  }
  else{
    printf("\nos numeros são iguais\n");
  }

  system("pause");
}

//5)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int  n1 = 0, n2 = 0, diferenca = 0;

  printf("Digite um numero\n");
  scanf("%d", &n1);
  printf("Digite outro numero\n");
  scanf("%d", &n2);

  if(n1 == 1)
    printf("a média entre os dos numeros é: %d\n", ((n1+n2) / 2));
  else if(n1 == 2){
    diferenca = 0;
    if(n1>=n2)
      diferenca = n1-n2;
    else
      diferenca = n2-n1;
    printf("A diferença do maior pelo menor é: %d\n", diferenca);
  }
  else if(n1 == 3)
    printf("o produto entre os numeros é: %d\n", (n1*n2) );
  else if(n1 == 4){
    if(n2 == 0)
      printf("O segundo numero não pode ser zero\n");
    else
      printf("a divisão do primeiro pelo segundo é: %d\n", (n1/n2));
  }
  else
    printf("opção inválida\n");
  system("pause");
}

//6)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int  n1 = 0, n2 = 0, diferenca = 0;
  
  printf("Digite um numero\n");
  scanf("%d", &n1);
  printf("Digite outro numero\n");
  scanf("%d", &n2);

  switch(n1){
    case 1:
      printf("a média entre os dos numeros é: %d\n", ((n1+n2) / 2));
      break;
    case 2:
      diferenca = 0;
      if(n1>=n2)
        diferenca = n1-n2;
      else
        diferenca = n2-n1;
      printf("A diferença do maior pelo menor é: %d\n", diferenca);
      break;
    case 3:
      printf("o produto entre os numeros é: %d\n", (n1*n2) );
      break;
    default:
      printf("opção inválida");
      break;
  }
  system("pause");
}

//7)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float salario = 0, porcentagem = 0;
  
  printf("Digite seu salario\n");
  scanf("%f", &salario);
  if(salario < 500){
    porcentagem = ((salario * 30) / 100);
    printf("Seu salario com aumento é: %.2f\n", salario);

    printf("Seu salario com aumento é: %.2f\n", (salario + porcentagem));
  }
  else
    printf("Invelizmente você não terá aumento\n");

  system("pause");
}

//8)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float salario = 0, porcentagem = 0;

  printf("Digite seu salario\n");
  scanf("%f", &salario);
  if(salario <= 300){
    porcentagem = (salario * 35) / 100;
    printf("Você teve um aumento de 35%%, seu salario com aumento é: %.2f\n", (salario + porcentagem));
  }
  else{
    porcentagem = (salario * 15) / 100;
    printf("Você teve um aumento de 15%%, seu salário com aumento é: %.2f\n", (salario + porcentagem));
  }
  system("pause");
}

//9)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float saldo = 0, porcentagem = 0;

  printf("Digite seu saldo médio\n");
  scanf("%f", &saldo);

  if(saldo <= 200){
    porcentagem = (saldo * 10) / 100;
    printf("O saldo médio é de: %.2f e o valor do credito é de 10%%: %.2f\n", (saldo + porcentagem), porcentagem);
  }
  else if(saldo <= 300){
    porcentagem = (saldo * 20) / 100;
    printf("O saldo médio é de: %.2f e o valor do credito é de 20%%: %.2f\n", (saldo + porcentagem), porcentagem);
  }
  else if(saldo <= 400){
    porcentagem = (saldo * 25) / 100;
    printf("O saldo médio é de: %.2f e o valor do credito é de 25%%: %.2f\n", (saldo + porcentagem), porcentagem);
  }
  else{
    porcentagem = (saldo * 30) / 100;
    printf("O saldo médio é de: %.2f e o valor do credito é de 30%%: %.2f\n", (saldo + porcentagem), porcentagem);
  }
  system("pause");
}

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

//11)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float salario = 0, porcentagem = 0;
  
  printf("Digite seu salario\n");
  scanf("%f", &salario);
  if(salario <= 300){
    porcentagem = (salario * 15) / 100;
    printf("Você teve um aumento de 15%%, seu salario com aumento é: %.2f\n", (salario + porcentagem));
  }
  else if(salario <= 600){
    porcentagem = (salario * 10) / 100;
    printf("Você teve um aumento de 10%%, seu salario com aumento é: %.2f\n", (salario + porcentagem));
  }
  else if(salario <= 900){
    porcentagem = (salario * 5) / 100;
    printf("Você teve um aumento de 5%%, seu salario com aumento é: %.2f\n", (salario + porcentagem));
  }
  else
    printf("Você teve um aumento de 0%%, seu salário com aumento é: %.2f\n", salario);
  system("pause");
}

//12)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float salario = 0, porcentagem = 0, gratificacao = 0;
  
  printf("Digite seu salario\n");
  scanf("%f", &salario);
  if(salario <= 350){
    porcentagem = (salario * 7) / 100;
    gratificacao = 100;
    printf("Você teve uma gratificação de %.2f, seu salario menos imposto é de: %.2f\n", gratificacao, ((salario - porcentagem) + gratificacao));
  }
  else if(salario <= 600){
    porcentagem = (salario * 7) / 100;
    gratificacao = 75;
    printf("Você teve uma gratificação de %.2f, seu salario menos imposto é de: %.2f\n", gratificacao, ((salario - porcentagem) + gratificacao));
  }
  else if(salario <= 900){
    porcentagem = (salario * 7) / 100;
    gratificacao = 50;
    printf("Você teve uma gratificação de %.2f, seu salario menos imposto é de: %.2f\n", gratificacao, ((salario - porcentagem) + gratificacao));
  }
  else{
    porcentagem = (salario * 7) / 100;
    gratificacao = 35;
    printf("Você teve uma gratificação de %.2f, seu salario menos imposto é de: %.2f\n", gratificacao, ((salario - porcentagem) + gratificacao));
  }
  system("pause");
}

//13)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float preco = 0, porcentagem = 0, novo_preco = 0;
  
  
  printf("Digite o preço do produto\n");
  scanf("%f", &preco);
  if(preco <= 50){
    porcentagem = (preco * 5) / 100;
    novo_preco = preco + porcentagem;
  }
  else if(preco <= 100){
    porcentagem = (preco * 10) / 100;
    novo_preco = preco + porcentagem;
  }
  else{
    porcentagem = (preco * 15) / 100;
    novo_preco = preco + porcentagem;
  }

  if(novo_preco <= 80)
    printf("O preco do produto %.2f, classificação: barato\n", novo_preco);
  else if(novo_preco <= 120)
    printf("O preco do produto %.2f, classificação: normal\n", novo_preco);
  else if(novo_preco <= 200)
    printf("O preco do produto %.2f, classificação: caro\n", novo_preco);
  else if(novo_preco > 200)
    printf("O preco do produto %.2f, classificação: muito caro\n", novo_preco);
  system("pause");
}


//14)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float salario = 0, porcentagem = 0, novo_salario = 0;
  
  printf("Digite seu salario\n");
  scanf("%f", &salario);
  if(salario <= 300){
    porcentagem = (salario * 50) / 100;
    novo_salario = salario + porcentagem;
  }
  else if(salario <= 500){
    porcentagem = (salario * 40) / 100;
    novo_salario = salario + porcentagem;
  }
  else if(salario <= 700){
    porcentagem = (salario * 30) / 100;
    novo_salario = salario + porcentagem;
  }
  else if(salario <= 800){
    porcentagem = (salario * 20) / 100;
    novo_salario = salario + porcentagem;
  }
  else if(salario <= 1000){
    porcentagem = (salario * 10) / 100;
    novo_salario = salario + porcentagem;
  }
  else{
    porcentagem = (salario * 5) / 100;
    novo_salario = salario + porcentagem;
  }

  printf("Seu novo salário com aumento é: %.2f\n", novo_salario);
  system("pause");
}

//15)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int tipo = 0;
  float porcentagem = 0, valor = 0;
  
  printf("Digite o tipo de investimento\n");
  printf("(1) - Poupança\n");
  printf("(2) - Fundos de renda fixa\n");
  scanf("%d", &tipo);
  printf("Digite o valor\n");
  scanf("%f", &valor);
  if(tipo == 1){
    porcentagem = (valor * 3) / 100;
    valor = valor + porcentagem;
    printf("Seu valor corrigido é: %.2f\n", valor);
  }
  else if(tipo == 2){
    porcentagem = (valor * 4) / 100;
    valor = valor + porcentagem;
    printf("Seu valor corrigido é: %.2f\n", valor);
  }
  else
    printf("Opção inválida seu valor é: %.2f\n", valor);
  system("pause");
}

//16)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float preco = 0, porcentagem = 0, novo_preco = 0;
  
  printf("Digite o preço\n");
  scanf("%f", &preco);
  if(preco <= 30)
    printf("Preço: %.2f, sem desconto, preço novo: %.2f\n", preco, preco);
  else if(preco <= 100){
    porcentagem = (preco * 10) / 100;
    novo_preco = preco - porcentagem;
    printf("Preço: %.2f, desconto: %.2f, preço novo: %.2f\n", preco, porcentagem, novo_preco);
  }
  else if(preco > 100){
    porcentagem = (preco * 15) / 100;
    novo_preco = preco - porcentagem;
    printf("Preço: %.2f, desconto: %.2f, preço novo: %.2f\n", preco, porcentagem, novo_preco);
  }
  system("pause");
}

//17)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int senha = 0;
  
  printf("Digite sua senha\n");
  scanf("%d", &senha);
  if(senha == 4531)
    printf("Acesso concedido\n");
  else
    printf("Senha inválida\n");
  system("pause");
}

//18)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int idade = 0;

  printf("Digite sua idade\n");
  scanf("%d", &idade);
  if(idade >= 18)
    printf("Você atingiu a maioridade\n");
  else
    printf("Você é de menor\n");
  system("pause");
}

//19)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float altura = 0, peso = 0;
  char sexo;

  printf("Digite sua altura\n");
  scanf("%f", &altura);
  printf("Digite seu sexo M/F\n");
  scanf(" %c",&sexo);  

  if(sexo == 'M'){
    peso = (72.7*altura) - 58;
    printf("Seu peso ideal é: %.2f\n", peso);
  }
  else if(sexo == 'F'){
    peso = (62.1*altura) - 44.7;
    printf("Seu peso ideal é: %.2f\n", peso);
  }
  else
    printf("digite masculino ou feminino para calcular peso\n");
  system("pause");
}

//20)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int idade = 0;
  
  printf("Digite a idade do nadador\n");
  scanf("%d", &idade);
  if(idade >= 5 && idade <= 7)
    printf("Infantil\n");
  else if(idade >= 8 && idade <= 10)
    printf("Juvenil\n");
  else if(idade >= 11 && idade <= 15)
    printf("Adolescente\n");
  else if(idade >= 16 && idade <= 30)
    printf("Adulto\n");
  else if(idade > 30)
    printf("Sênior\n");
  system("pause");
}

//21)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float preco = 0;
  int origem = 0;
  
  printf("Digite o preço do produto\n");
  scanf("%f", &preco);
  printf("Digite o código de origem\n");
  scanf("%d", &origem);

  if(origem == 1)
    printf("Preço do produto é: %.2f, procedência: Sul\n", preco);
  else if(origem == 2)
    printf("Preço do produto é: %.2f, procedência: Norte\n", preco);
  else if(origem == 3)
    printf("Preço do produto é: %.2f, procedência: Leste\n", preco);
  else if(origem == 4)
    printf("Preço do produto é: %.2f, procedência: Oeste\n", preco);
  else if(origem == 5 || origem == 6)
    printf("Preço do produto é: %.2f, procedência: Nordeste\n", preco);
  else if(origem == 7 || origem == 8 || origem == 9)
    printf("Preço do produto é: %.2f, procedência: Sudeste\n", preco);
  else if(origem >= 10 && origem <= 20)
    printf("Preço do produto é: %.2f, procedência: Centro-oeste\n", preco);
  else if(origem >= 21 && origem <= 30)
    printf("Preço do produto é: %.2f, procedência: Noroeste\n", preco);
  system("pause");
}
//22)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int idade = 0;
  float peso = 0;

  
  printf("Digite sua idade\n");
  scanf("%d", &idade);
  printf("Digite seu peso\n");
  scanf("%f", &peso);

  if(idade < 20){
    if(peso <= 60)
      printf("Você se encontra no risco 9\n");
    else if(peso >= 60 && peso <= 90)
      printf("Você se encontra no risco 8\n");
    else if(peso > 90)
      printf("Você se encontra no risco 7\n");
  }
  else if(idade >= 20 && idade <= 50){
    if(peso <= 60)
      printf("Você se encontra no risco 6\n");
    else if(peso >= 60 && peso <= 90)
      printf("Você se encontra no risco 5\n");
    else if(peso > 90)
      printf("Você se encontra no risco 4\n");
  }
  else if(idade > 50){
    if(peso <= 60)
      printf("Você se encontra no risco 3\n");
    else if(peso >= 60 && peso <= 90)
      printf("Você se encontra no risco 2\n");
    else if(peso > 90)
      printf("Você se encontra no risco 1\n");
  }
  system("pause");
}

//23)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float preco = 0, preco_total = 0, desconto = 0;
  int codigo = 0, quantidade = 0;
  
  printf("Digite o código do produto\n");
  scanf("%d", &codigo);
  printf("Digite a quantidade\n");
  scanf("%d", &quantidade);

  if(codigo >= 1 && codigo <= 10)
    preco = 10;
  else if(codigo >= 11 && codigo <= 20)
    preco = 15;
  else if(codigo >= 21 && codigo <= 30)
    preco = 20;
  else if(codigo >= 31 && codigo <= 40)
    preco = 30;
  else
    printf("Código do produto inválido\n");

  if(preco > 0){
    preco_total = preco * quantidade;

    if(preco_total >= 250)
      desconto = (preco_total*5) / 100;
    else if(preco_total >= 250 && preco_total <= 500)
      desconto = (preco_total*10) / 100;
    else if(preco_total > 500)
      desconto = (preco_total*15) / 100;

    printf("O preço unitário do produto é: %.2f\n", preco);
    printf("O preço total é: %.2f\n", preco_total);
    printf("Desconto de: %.2f\n", desconto);
    printf("O preço final com desconto é: %.2f\n", (preco_total - desconto));
  }
  system("pause");
}

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

//25)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float extras = 0, faltas = 0, h = 0;
  
  printf("Digite a quantidade de horas extras\n");
  scanf("%f", &extras);
  printf("Digite a quantidade de horas faltas\n");
  scanf("%f", &faltas);

  h = extras - 2/3 * faltas;

  if(h > 2400)
    printf("Sua gratificação é de R$ 500,00\n");
  else if(h >= 1800 && h < 2400)
    printf("Sua gratificação é de R$ 400,00\n");
  else if(h >= 600 && h < 1200)
    printf("Sua gratificação é de R$ 200,00\n");
  else if(h < 600)
    printf("Sua gratificação é de R$ 100,00\n");
  system("pause");
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//LISTA DE EXERCICIO 3

//ESTRUTURA DE REPETIÇÃO
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//9)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int numero = 0, i = 0;
  printf("Digite um numero\n");
  scanf("%d",&numero);

  printf("Taboada é:\n");
  for(i=1; i<=10; i++){
    printf("%d X %d = %d\n", numero, i, (numero * i));
  }
  system("pause");
}

//10)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int i = 0, x = 0;

  for(i=1; i<=10; i++){
    printf("Taboada do %d é:\n", i);
    for(x=1; x<=10; x++){
      printf("%d X %d = %d\n", i, x, (i*x));
    }
  }
  system("pause");
}

//11)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float valor_vista = 0, valor_prazo = 0, valor = 0;
  char transacao;
  int i = 0;

  for(i=1; i<=10; i++){
    printf("Digite o código da transação V,P\n");
    scanf(" %c",&transacao);
    printf("Digite o valor\n");
    scanf("%f", &valor);
    if(transacao == 'V')
      valor_vista += valor;
    else if(transacao == 'P')
      valor_prazo += valor;
  }

  printf("Valor total a vista %.2f\n", valor_vista);
  printf("Valor total a prazo %.2f\n", valor_prazo);
  printf("Valor total %.2f\n", (valor_vista + valor_prazo));
  printf("Valor da primeira prestação a prazo é %.2f\n", (valor_prazo / 3));
  system("pause");
}

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
//13)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int idade_mais_90_quilos = 0, i = 0, idade = 0;
  int idades = 0;
  int todas_pessoas = 0;
  float peso = 0;

  for(i=1; i<=7; i++){
    printf("Digite a idade\n");
    scanf("%d", &idade);
    printf("Digite a peso\n");
    scanf("%f", &peso);

    if(peso > 90)
      idade_mais_90_quilos += 1;
    
    idades += idade;
    todas_pessoas = i;
  }

  printf("Pessoas com mais de 90 quilos: %d\n", idade_mais_90_quilos);
  printf("Média de idade das pessoas: %d\n", (idades / todas_pessoas));
  system("pause");
}

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

//15)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int quantidade_30_90 = 0, i, numero;
  for(i=1; i<= 10; i++){
    printf("Digite um numero\n");
    scanf("%d", &numero);
    if(numero >= 30 && numero <= 90)
      quantidade_30_90 += 1;
  }
  printf("A quantidade de numeros entre 30 e 90 é: %d\n", quantidade_30_90);
  system("pause");
}

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

//17)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int idades = 0;
  int idades_mulheres = 0;
  int idades_homens = 0;
  int quantidade = 7;
  int quantidade_mulheres = 0;
  int quantidade_homens = 0, i, idade;
  char sexo;

  for(i=1; i<= quantidade; i++){
    printf("Digite a idade\n");
    scanf("%d", &idade);

    printf("Digite o sexo M/F\n");
    scanf(" %c",&sexo);

    idades += idade;

    if(sexo == 'M'){
      idades_homens += idade;
      quantidade_homens += 1;
    }

    if(sexo == 'F'){
      idades_mulheres += idade;
      quantidade_mulheres += 1;
    }
  }

  printf("A idade média do grupo é: %d\n", (idades/quantidade));
  printf("A idade média das mulheres é: %d\n", (idades_mulheres/quantidade_mulheres));
  printf("A idade média dos homens é: %d\n", (idades_homens/quantidade_homens));
  system("pause");
}

//19)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int idades = 0;
  int idade = 1;
  int quantidade = 0;
  while(idade != 0){
    quantidade += 1;
    printf("Digite a idade\n");
    scanf("%d", &idade);
    idades += idade;
  }

  printf("A idade média é: %d\n", (idades/quantidade));
  system("pause");
}

//20)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int maior = 0;
  int menor = 0;
  int numero = 1;
  while(numero != 0){
    if(menor == 0)
      menor = numero;

    printf("Digite um numero\n");
    scanf("%d", &numero);
    
    if(numero < 0)
      printf("Somente numeros positivos\n");
    else if(numero > 0){
      if(numero > maior)
        maior = numero;

      if(numero < menor)
        menor = numero;
    }
  }

  printf("O maior numero é: %d\n", maior);
  printf("O menor numero é: %d\n", menor);
  system("pause");
}

//21)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int numero;
  printf("Digite um numero: \n"); 
  scanf("%d", &numero);
  int fatorial = 1, i;

  for(i=1; i<= numero; i++){
    fatorial = fatorial * i;
  }

  printf("O fatorial de %d e: %d\n", numero, fatorial); 
  system("pause");
}
//22)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  int qtd_pessoas_1_10 = 0;
  int pesos_pessoas_1_10 = 0;

  int qtd_pessoas_11_20 = 0;
  int pesos_pessoas_11_20 = 0;

  int qtd_pessoas_21_30 = 0;
  int pesos_pessoas_21_30 = 0;

  int qtd_pessoas_acima_30 = 0;
  int pesos_pessoas_acima_30 = 0;
  int idade, i;
  float peso;

  for(i=1; i<= 15; i++){
    printf("Digite a idade\n");
    scanf("%d", &idade);

    printf("Digite um peso\n");
    scanf("%f", &peso);

    if(idade >=1 && idade<=10){
      qtd_pessoas_1_10 += 1;
      pesos_pessoas_1_10 += peso;
    }
    else if(idade >=11 && idade<=20){
      qtd_pessoas_11_20 += 1;
      pesos_pessoas_11_20 += peso;
    }
    else if(idade >=21 && idade<=30){
      qtd_pessoas_21_30 += 1;
      pesos_pessoas_21_30 += peso;
    }
    else if(idade > 30){
      qtd_pessoas_acima_30 += 1;
      pesos_pessoas_acima_30 += peso;
    }
  }

  printf("Média pessoas de 1 a 10: %d\n", (pesos_pessoas_1_10 / qtd_pessoas_1_10)); 
  printf("Média pessoas de 11 a 20: %d\n", (pesos_pessoas_11_20 / qtd_pessoas_11_20)); 
  printf("Média pessoas de 21 a 30: %d\n", (pesos_pessoas_21_30 / qtd_pessoas_21_30)); 
  printf("Média pessoas acima de 30: %d\n", (pesos_pessoas_acima_30 / qtd_pessoas_acima_30)); 
  system("pause");
}
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

//25)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int maior_nota = 0;
  int menor_nota = 0;
  int reprovados = 0;
  float total_alunos = 10;
  float reprovado_por_faltas = 0;
  int i, matricula, aulas, n1, n2, n3;
  char status;

  for(i=1; i<= total_alunos; i++){
    printf("Digite o numero da matricula\n");
    scanf("%d", &matricula);

    printf("Digite nota 1\n");
    scanf("%d", &n1);
    printf("Digite nota 2\n");
    scanf("%d", &n2);
    printf("Digite nota 3\n");
    scanf("%d", &n3);

    printf("Digite o numero de aulas frequentadas\n");
    scanf("%d", &aulas);

    float media = (n1+n2+n3) / 3;
    status = 'A';

    if(aulas < 40){
      status = 'R';
      reprovados += 1;
      reprovado_por_faltas += 1;
    }
    else{
      if(media < 6){
        status = 'A';
        reprovados += 1;
      }
    }

    if(reprovado_por_faltas == 0){
      printf("\n\nAluno da matricula %d, sua média é: %.0f e você está: ", matricula, media);
      if(status == 'A')
        printf("Aprovado\n\n");
      else
        printf("Reprovado\n\n"); 
    }
    else
      printf("\n\nAluno da matricula %d reprovado por faltas\n\n", matricula); 

    if(maior_nota < n1)
      maior_nota = n1;

    if(maior_nota < n2)
      maior_nota = n2;

    if(maior_nota < n3)
      maior_nota = n3;


    if(menor_nota == 0)
      menor_nota = n1;
    
    if(menor_nota > n1)
      menor_nota = n1;

    if(menor_nota > n2)
      menor_nota = n2;

    if(menor_nota > n3)
      menor_nota = n3;
  }

  printf("A maior nota da turma é %d, e a menor é %d\n", maior_nota, menor_nota); 
  printf("O total de alunos reprovados é de: %d\n", reprovados); 
  float porcentagem = reprovado_por_faltas / total_alunos * 100;
  printf("Porcentagem alunos reprovados por faltas: %.0f%%\n", porcentagem); 

  system("pause");
}

//26)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int idades = 0;
  int qtd = 0;
  int idade = 1;
  while(idade != 0){
    if(idade == 0)
      break;

    printf("Digite uma idade\n");
    scanf("%d", &idade);
    
    idades += idade;
    qtd += 1;
  }

  printf("A média das idades é: %d\n", (idades / qtd)); 
  system("pause");
}

//27)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float canal_4 = 0;
  float pessoas_4 = 0;
  float canal_5 = 0;
  float pessoas_5 = 0;
  float canal_7 = 0;
  float pessoas_7 = 0;
  float canal_12 = 0;
  float pessoas_12 = 0;
  int canal = 1, pessoas;
  char ligada;
  while(canal != 0){
    
    printf("Sua TV estava ligada S/N\n");
    scanf(" %c",&ligada);

    if(ligada == 'S'){
      printf("Digite o canal\n");
      scanf("%d", &canal);

      if(canal == 0)
        break;

      printf("Digite a quantidade de pessoas\n");
      scanf("%d", &pessoas);

      if(canal == 4){
        canal_4 += 1;
        pessoas_4 += pessoas;
      }
      else if(canal == 5){
        canal_5 += 1;
        pessoas_5 += pessoas;
      }
      else if(canal == 7){
        canal_7 += 1;
        pessoas_7 += pessoas;
      }
      else if(canal == 12){
        canal_12 += 1;
        pessoas_12 += pessoas;
      }
    }

  }

  float total_canal_4 = (canal_4 * pessoas_4);
  float total_canal_5 = (canal_5 * pessoas_5);
  float total_canal_7 = (canal_7 * pessoas_7);
  float total_canal_12 = (canal_12 * pessoas_12);
  float total_canal_assistidos = total_canal_4 + total_canal_5  + total_canal_7  + total_canal_12;

  if(total_canal_4 > 0){
    float porcentagem = total_canal_4 / total_canal_assistidos * 100;
    printf("Porcentagem de audiencia do canal 4 é: %.0f%%\n", porcentagem);
  }

  if(total_canal_5 > 0){
    float porcentagem = total_canal_5 / total_canal_assistidos * 100;
    printf("Porcentagem de audiencia do canal 5 é: %.0f%%\n", porcentagem);
  }

  if(total_canal_7 > 0){
    float porcentagem = total_canal_7 / total_canal_assistidos * 100;
    printf("Porcentagem de audiencia do canal 7 é: %.0f%%\n", porcentagem);
  }

  if(total_canal_12 > 0){
    float porcentagem = total_canal_12 / total_canal_assistidos * 100;
    printf("Porcentagem de audiencia do canal 12 é: %.0f%%\n", porcentagem);
  }
  system("pause");
}

//28)

#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float total_salarios = 0;
  float qtd_total_salarios = 0;
  float total_filhos = 0;
  float qtd_total_filhos = 0;
  float maior_salario = 0;
  float total_pessoas = 0;
  float total_pessoas_salarios_ate_150 = 0;
  float salario = 0;
  int qtd_filhos = 0;

  while(1 == 1){
    printf("Digite seu salario\n");
    scanf("%f", &salario);

    if(salario < 0)
      break;

    total_pessoas += 1;

    if(salario <= 150)
      total_pessoas_salarios_ate_150 += 1;

    if(maior_salario < salario)
      maior_salario = salario;

    printf("Digite o numero de filhos\n");
    scanf("%d", &qtd_filhos);

    total_salarios += salario;
    qtd_total_salarios += 1;

    total_filhos += qtd_filhos;
    qtd_total_filhos += 1;

  }

  printf("A média dos salarios é: %.0f\n", (total_salarios / qtd_total_salarios));
  printf("A média dos filhos são: %.0f\n", (total_filhos / qtd_total_filhos));
  printf("O maior salário é: %.0f\n", maior_salario);
  float porcentagem = total_pessoas_salarios_ate_150 / total_pessoas * 100;
  printf("Porcentagem pessoas com salarios até 150 é: %.0f%%\n", porcentagem);
  system("pause");
}


//29)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  float qtd_total = 0;
  float total_salarios = 0;
  float maior_idade = 0;
  float menor_idade = 0;
  float qtd_mulhres_salario_200 = 0;
  float menor_salario = 0;
  float idade_menor_salario = 0;
  char sexo_menor_salario, sexo;
  int idade;
  float salario;

  while(1 == 1){

    printf("Digite sua idade\n");
    scanf("%d", &idade);

    if(idade < 0)
      break;

    printf("Digite seu sexo M/F\n");
    scanf(" %c",&sexo);
    printf("Digite seu salario\n");
    scanf("%f", &salario);

    if(menor_salario == 0){
      menor_salario = salario;
      idade_menor_salario = idade;
      sexo_menor_salario = sexo;
    }

    if(salario < menor_salario){
      menor_salario = salario;
      idade_menor_salario = idade;
      sexo_menor_salario = sexo;
    }

    if(menor_idade == 0)
      menor_idade = idade;

    if(idade < menor_idade)
      menor_idade = idade;

    if(idade > maior_idade)
      maior_idade = idade;

    if(sexo == 'F' && salario >= 200)
      qtd_mulhres_salario_200 += 1;

    qtd_total += 1;
    total_salarios += salario;
  }

  printf("A média dos salarios é: %.0f\n", (total_salarios / qtd_total));
  printf("A maior idade é: %.0f e a menor idade é: %.0f\n", maior_idade, menor_idade);
  printf("A quantidade de mulheres com salarios até 200: %.0f\n", qtd_mulhres_salario_200);
  printf("O menor salario é: %.2f, o sexo do menor salario é: %c, a idade do menor salario é: %.2f\n", menor_salario, sexo_menor_salario, idade_menor_salario);

  system("pause");
}


//30)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  float total_precos = 0;
  float total_precos_reajuste = 0, preco;
  int quantidade = 0, codigo;
  while(1 == 1){
    printf("Digite código do produto\n");
    scanf("%d", &codigo);
    if(codigo < 0)
      break;

    printf("Digite o preco do produto\n");
    scanf("%f", &preco);
    float novo_preco = (preco + ((preco * 20) / 100));

    printf("Codigo do produto: %d, preço: %.2f, prejo reajustado: %.2f\n", codigo, preco, novo_preco);
    total_precos += preco;
    total_precos_reajuste += novo_preco;
    quantidade += 1;
  }

  float media_precos = total_precos / quantidade;
  float media_precos_reajuste = total_precos_reajuste / quantidade;

  printf("A média de preço é: %.0f\n", media_precos);
  printf("A média de preço reajustado é: %.0f\n", media_precos_reajuste);
  system("pause");
}

//31)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int quantidade = 0;
  float total_preco_compra = 0;
  float total_preco_venda = 0;
  char letra;
  float preco_compra, preco_venda;

  while(1 == 1){
    printf("Digite uma letra\n");
    scanf(" %c",&letra);
    if(letra == 'F')
      break;

    printf("Digite o preco de compra\n");
    scanf("%f", &preco_compra);

    printf("Digite o preco de venda\n");
    scanf("%f", &preco_venda);

    total_preco_compra += preco_compra;
    total_preco_venda += preco_venda;
  }

  printf("O total do preco de compra é: %.2f\n", total_preco_compra);
  printf("O total do preco de venda é: %.2f\n", total_preco_venda);

  system("pause");
}

//32)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  float numeros_inferior_35 = 0;
  float quantidade_positivos = 0;
  float total_positivos = 0;
  float todos_numeros = 0;
  float numeros_entre_50_100 = 0;
  float numeros_entre_10_20 = 0;
  int numero, i;

  for(i=1; i<= 3; i++){
    printf("Digite um numero\n");
    scanf("%d", &numero);

    if(numero < 35)
      numeros_inferior_35 += 1;

    if(numero >= 0){
      quantidade_positivos += 1;
      total_positivos += numero;
    }
    
    if(numero >= 50 && numero <= 100)
      numeros_entre_50_100 += 1;

    if(numero < 50){
      if(numero >= 10 && numero <= 20)
        numeros_entre_10_20 += 1;
    }
    todos_numeros += 1;
  }

  printf("Quantidade de numeros inveriores a 35 é: %.0f\n", numeros_inferior_35);
  printf("Media de numeros positivos é: %.2f\n", (total_positivos / quantidade_positivos));
  float porcentagem = numeros_entre_50_100 / todos_numeros * 100;
  printf("Porcentagem de numeros entre 50 a 100 é: %.0f%%\n", porcentagem);
  porcentagem = numeros_entre_10_20 / todos_numeros * 100;
  printf("Porcentagem de numeros entre 10 a 20 e menor que 50 é: %.0f%%\n", porcentagem);

  system("pause");
}

//33)

#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  while(1 == 1) {
    printf("Menu de opções\n");
    printf("1 - Média aritimética\n");
    printf("2 - Média ponderada\n");
    printf("3 - Sair\n");

    int c, n1, n2, n3, p1, p2, p3;
    scanf("%d", &c);
    
    switch(c){
      case 1:
        printf("Digite a nota 1\n");
        scanf("%d", &n1);

        printf("Digite a nota 1\n");
        scanf("%d", &n2);

        printf("A média aritimética das notas é: %d\n", ((n1+n2)/2));
        break;
      case 2:

        printf("Digite a nota 1\n");
        scanf("%d", &n1);

        printf("Digite o peso 1\n");
        scanf("%d", &p1);

        printf("Digite a nota 2\n");
        scanf("%d", &n2);

        printf("Digite o peso 2\n");
        scanf("%d", &p2);

        printf("Digite a nota 3\n");
        scanf("%d", &n3);

        printf("Digite o peso 3\n");
        scanf("%d", &p3);

        float media = (n1 * p1 + n2 * p2 + n2 * p3) / (p1 + p2 + p3);

        printf("A média ponderada das notas é: %.0f\n", media);
        break;
      case 3:
        return 0;
        break;
      default:
        printf("opção inválida\n");
        break;
    }

  }

  system("pause");
}

//34)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  int candidato1 = 0;
  int candidato2 = 0;
  int candidato3 = 0;
  int candidato4 = 0;
  float nulos = 0;
  float brancos = 0;
  float total_votos = 0;
  int c;
  
  while(1 == 1){
    printf("Digite o código de seu candidato\n");
    scanf("%d", &c);
    
    switch(c){
      case 1:
        candidato1 += 1;
      case 2:
        candidato2 += 1;
      case 3:
        candidato3 += 1;
      case 4:
        candidato4 += 1;
      case 5:
        nulos += 1;
      case 6:
        brancos += 1;
      case 0:
        break;
      default:
        printf("opção inválida\n");
    }

    total_votos += 1;
  }

  printf("O total de votos para o candidato 1: %d\n", candidato1);
  printf("O total de votos para o candidato 2: %d\n", candidato2);
  printf("O total de votos para o candidato 3: %d\n", candidato3);
  printf("O total de votos para o candidato 4: %d\n", candidato4);
  printf("O total de votos nulos: %.0f\n", nulos);
  printf("O total de votos brancos: %.0f\n", brancos);

  float porcentagem = nulos / total_votos * 100;
  printf("Porcentagem de votos nulos: %.0f%%\n", porcentagem);

  porcentagem = brancos / total_votos * 100;
  printf("Porcentagem de votos brancos: %.0f%%\n", porcentagem);

  system("pause");
}

//35)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  int total_negativo = 0;
  int total_positivo = 0, n;
  while(1 == 1){
    printf("Digite um numero\n");
    scanf("%d", &n);

    if(n == 0)
      break;

    if(n >= 0)
      total_positivo += n;
    else
      total_negativo += n;
  }

  printf("Total de positivos: %d\n", total_positivo);
  printf("Total de negativos: %d\n", total_negativo);
  printf("Total negativo + positivo: %d\n", (total_positivo + total_negativo));

  system("pause");
}

//36)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float alturas_mais_50 = 0;
  float qtd_alturas_mais_50 = 0, altura;
  int idade;
  
  while(1 == 1){
    printf("Digite a idade\n");
    scanf("%d", &idade);

    if(idade <= 0)
      break;

    printf("Digite a altura\n");
    scanf("%f", &altura);

    if(idade > 50){
      alturas_mais_50 += altura;
      qtd_alturas_mais_50 += 1;
    }
  }

  if(qtd_alturas_mais_50 > 0)
    printf("Média das alturas de pessoas com mais de 50 anos: %.2f\n", (alturas_mais_50/qtd_alturas_mais_50));
  else
    printf("Nenhuma pessoa com mais de 50 anos\n");

  system("pause");
}

//37)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  
  while(1 == 1){
    printf("Menu de opções\n");
    printf("1 - Adição\n");
    printf("2 - Subitração\n");
    printf("3 - Multiplicação\n");
    printf("4 - Divisão\n");
    printf("5 - Sair\n");

    int c, n1, n2;
    scanf("%d", &c);
    
    switch(c){
      case 1:
        printf("Digite um numero\n");
        scanf("%d", &n1);

        printf("Digite um numero\n");
        scanf("%d", &n2);

        printf("A Adição dos numeros é: %d\n", (n1+n2));
        break;
      case 2:
        printf("Digite um numero\n");
        scanf("%d", &n1);

        printf("Digite um numero\n");
        scanf("%d", &n2);

        printf("A Subitração dos numeros é: %d\n", (n1-n2));
        break;
      case 3:
        printf("Digite um numero\n");
        scanf("%d", &n1);

        printf("Digite um numero\n");
        scanf("%d", &n2);

        printf("A Multiplicação dos numeros é: %d\n", (n1*n2));
        break;
      case 4:
        printf("Digite um numero\n");
        scanf("%d", &n1);

        printf("Digite um numero\n");
        scanf("%d", &n2);

        printf("A Divisão dos numeros é: %d\n", (n1/n2));
        break;
      case 5:
        return 0;
        break;
      default:
        printf("opção inválida\n");
        break;
    }
  }
  system("pause");
}

//39)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  float total_juros = 0;
  float total_investimentos = 0, valor;
  int codigo, tipo_conta;
  while(1 == 1){
    printf("Código do cliente\n");
    scanf("%d", &codigo);

    if(codigo <= 0)
      break;

    printf("Tipo de conta\n");
    scanf("%d", &tipo_conta);
    printf("Valor investimento\n");
    scanf("%f", &valor);
    
    switch(tipo_conta){
      case 1:
        printf("Rendimento de poupança, mensal de 1,5%%\n");
        total_juros += (valor * 1.5) / 100;
        total_investimentos += valor + total_juros;
        break;
      case 2:
        printf("Rendimento de poupança plus, mensal de 2%%\n");
        total_juros += (valor * 2) / 100;
        total_investimentos += valor + total_juros;
        break;
      case 3:
        printf("Rendimento de fundo de renda fixa, mensal de 4%%\n");
        total_juros += (valor * 4) / 100;
        total_investimentos += valor + total_juros;
        break;
    }
  }

  printf("Total de investimentos: %.2f\n", total_investimentos);
  printf("Total de juros: %.2f\n", total_juros);
  system("pause");
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//LISTA DE EXERCICIO 4

//VETORES
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//1)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int vetor[6], pares[3], impares[3];
  int i;

  for(i=0;i<6;i++){
    vetor[i] = (i+1);
  }

  int qtd_pares = 0, x = 0, qtd_impares = 0, j = 0;
  int qtd = (int)(sizeof(vetor)/sizeof(vetor[0]));

  for(i=0;i<qtd;i++){
    int valor = vetor[i];
    float sobra = valor % 2;
    if(sobra <= 0){
      qtd_pares += 1;
      pares[x] = valor;
      x++;
    }
    else{
      qtd_impares += 1;
      impares[j] = valor;
      j++;
    }
  }

  printf("Quantidade de numeros pares é: %d\n", qtd_pares);
  printf("Os numeros pares são: ");
  qtd = (int)(sizeof(pares)/sizeof(pares[0]));
  for(i=0;i<qtd;i++){
    printf("%d, ", pares[i]);
  }
  printf("\n");

  printf("Quantidade de numeros impares é: %d\n", qtd_impares);
  printf("Os numeros impares são: ");
  qtd = (int)(sizeof(impares)/sizeof(impares[0]));
  for(i=0;i<qtd;i++){
    printf("%d, ", impares[i]);
  }
  printf("\n");
  system("pause");
}

//2)

#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int vetor[7], multiplos_2[3], multiplos_3[2], multiplos_2_3[5];
  int i;

  for(i=0;i<7;i++){
    vetor[i] = (i+1);
  }

  int qtd = (int)(sizeof(vetor)/sizeof(vetor[0]));
  int x = 0, j = 0;

  for(i=0;i<qtd;i++){
    int valor = vetor[i];

    float sobra = valor % 2;
    if(sobra <= 0){
      multiplos_2[x] = valor;
      x++;
    }

    sobra = valor % 3;
    if(sobra <= 0){
      multiplos_3[j] = valor;
      j++;
    }
  }

  printf("Os multilos de 2 são: ");
  qtd = (int)(sizeof(multiplos_2)/sizeof(multiplos_2[0]));
  for(i=0;i<qtd;i++){
    printf("%d, ", multiplos_2[i]);
  }
  printf("\n");

  printf("Os multiplos de 3 são: ");
  qtd = (int)(sizeof(multiplos_3)/sizeof(multiplos_3[0]));
  for(i=0;i<qtd;i++){
    printf("%d, ", multiplos_3[i]);
  }
  printf("\n");

  printf("Os multiplos de 2 e 3 são: ");
  qtd = (int)(sizeof(multiplos_2)/sizeof(multiplos_2[0]));
  for(i=0;i<qtd;i++){
    printf("%d, ", multiplos_2[i]);
  }
  qtd = (int)(sizeof(multiplos_3)/sizeof(multiplos_3[0]));
  for(i=0;i<qtd;i++){
    printf("%d, ", multiplos_3[i]);
  }
  printf("\n");
  system("pause");
}

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

//4)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int qtd_espacos = 15, i;
  int vetor[] = {12, 30, 43, 2, 3, 5, 22, 4, 79, 30, 4, 56, 10, 30, 46};

  for(i=0;i<qtd_espacos;i++){
    int v = vetor[i];
    if(v == 30)
      printf("Elemento igual a 30 na posição %d\n", i);
  }
  system("pause");
}

//5)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int qtd_espacos = 15, qtd_espacos_p = 10, i, tipo, matricula, x=0, y=0, j;
  int logica[qtd_espacos], programacao[qtd_espacos_p];

  for(i=0;i<qtd_espacos;i++){
    printf("Digite o a sua matricula do aluno %d\n", (i + 1));
    scanf("%d", &matricula);
    printf("Digite o seu curso (1 - logica, 2 - programação) %d\n", i);
    scanf("%d", &tipo);

    if(tipo == 1){
      logica[x] = matricula;
      x++;
    }
    else if(tipo == 2){
      if(j < qtd_espacos_p){
        programacao[j] = matricula;
        j++;
      }
      else{
        printf("Sala lotada para programação\n");
      }
    }
    else{
      printf("Tipo inválido\n");
    }
  }

  printf("Matriculas alunos logica \n");
  for(i=0;i<qtd_espacos;i++){
    int v = logica[i];
    if(v != 0)
      printf("%d, ", v);
  }
  printf("\n");

  printf("Matriculas alunos programação \n");
  for(i=0;i<qtd_espacos_p;i++){
    int v = programacao[i];
    if(v != 0)
      printf("%d, ", v);
  }
  printf("\n");
  system("pause");
}

//6)

#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int qtd_espacos = 10, i;
  float total_vendas[qtd_espacos];
  float total_vendas_porcentagem[qtd_espacos];
  float percentual_vendedores[qtd_espacos];
  char nome_vendedores[qtd_espacos][100];

  for(i=0;i<qtd_espacos;i++){
    printf("Digite o total de vendas do vendedor %d\n", (i + 1));
    scanf("%f", &total_vendas[i]);

    printf("Digite o percentual de vendas do vendedor %d\n", (i + 1));
    scanf("%f", &percentual_vendedores[i]);

    printf("Digite o nome do vendedor %d\n", (i + 1));
    scanf("%s", nome_vendedores[i]);

    float valor = total_vendas[i] + (total_vendas[i] * percentual_vendedores[i] / 100);
    total_vendas_porcentagem[i] = valor;
  } 

  printf("Vendedores e valor que irá receber: ");
  for(i=0;i<qtd_espacos;i++){
    printf("\n  %s - R$ %.2f", nome_vendedores[i], total_vendas_porcentagem[i]);
  }
  printf("\n");

  float total_vendas_vendedor = 0;
  for(i=0;i<qtd_espacos;i++){
    total_vendas_vendedor += total_vendas[i];
  }
  printf("Total de vendas de todos os vendedores: R$ %.2f\n", total_vendas_vendedor);

  char maior_valor_nome[100], menor_valor_nome[100];
  float maior_valor = 0, menor_valor = -1;

  for(i=0;i<qtd_espacos;i++){
    if(menor_valor == -1){
      menor_valor = total_vendas_porcentagem[i];
      strcpy(menor_valor_nome, nome_vendedores[i]);
    }
    if(menor_valor > total_vendas_porcentagem[i]){
      menor_valor = total_vendas_porcentagem[i];
      strcpy(menor_valor_nome, nome_vendedores[i]);
    } 

    if(maior_valor < total_vendas_porcentagem[i]){
      maior_valor = total_vendas_porcentagem[i];
      strcpy(maior_valor_nome, nome_vendedores[i]);
    }
  }
  printf("O vendedor com maior valor: %s - R$ %.2f\n", maior_valor_nome, maior_valor);
  printf("O vendedor com menor valor:  %s - R$ %.2f\n", menor_valor_nome, menor_valor);
  system("pause");
}

//7)
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int qtd_espacos = 10, i;
  float numeros[qtd_espacos];
  int qtd_negativos = 0;
  float soma_positivos = 0;

  for(i=0;i<qtd_espacos;i++){
    printf("Digite um numero real R$ \n");
    scanf("%f", &numeros[i]);
  } 

  for(i=0;i<qtd_espacos;i++){
    if(numeros[i] < 0) qtd_negativos++;
    else soma_positivos += numeros[i];
  }

  printf("A quantidade de numeros negativos é: %d\n", qtd_negativos);
  printf("A soma dos positivos é: %.2f\n", soma_positivos);
  system("pause");
}

//8)
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int qtd_espacos = 7, i, x=0; //7
  char nome_alunos[qtd_espacos][100];
  float media_alunos[qtd_espacos];

  for(i=0;i<qtd_espacos;i++){
    printf("Digite o nome do aluno \n");
    scanf("%s", nome_alunos[i]);

    printf("Digite a média do aluno \n");
    scanf("%f", &media_alunos[i]);
  } 

  char aluno_com_maior_media[100];
  float maior_media = 0;
  char nome_alunos_reprovados[qtd_espacos][100];

  for(i=0;i<qtd_espacos;i++){
    if(maior_media < media_alunos[i]){
      maior_media = media_alunos[i];
      strcpy(aluno_com_maior_media, nome_alunos[i]);
    }

    if(media_alunos[i] < 7){
      strcpy(nome_alunos_reprovados[x], nome_alunos[i]);
      x++;
    }
  }

  printf("O aluno com maior media é: %s - media: %.2f\n", aluno_com_maior_media, maior_media);
  printf("Alunos reprovados que precisam tirar 5.0 no exame:\n");
  for(i=0;i<qtd_espacos;i++){
    if(strncmp(nome_alunos_reprovados[i],"", 2) > 0){
      printf(" %s \n", nome_alunos_reprovados[i]);
    }
  }
  system("pause");
}

//9)
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int qtd_espacos = 10, i, x=0; //10
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
  system("pause");
}

//10)












































