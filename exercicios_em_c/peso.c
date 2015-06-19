#include <stdio.h>    
    
int main()    
{    
    float peso=0.0,altura=0.0,resultado=0.0;  //inicializar variáveis  
    char sexo;    
    printf("Digite sua altura:");    
    scanf("%f",&altura);    
    printf("Digite seu peso:");    
    scanf("%f",&peso);    
    printf("Digite seu sexo [F] ou [M]:");    
    scanf(" %c",&sexo);  
    
    if(sexo == 'M')    
        resultado = ((72.7*altura) - 58);    
    else if(sexo == 'F')    
        resultado = ((62.1*altura) - 44.7);    
    printf("O seu peso ideal eh:%f\n", resultado);    
}   