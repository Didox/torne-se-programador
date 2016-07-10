#include<stdio.h>
#include<conio.h>

double e, termo, pot = 0, fat = 1;;
int n;
int main()
{        
    e = 1.0;
    n = 1;
    
    double x, erro;
    printf("Digite o valor de x: ");
    scanf("%lf", &x );
    printf("Digite o valor de erro: ");
    scanf("%lf", &erro );  
    
    do
    {
       if( pot != 0 )
          pot = pot * x;
       else
          pot = 1;
       termo = ( pot ) / ( fat = fat * n );
       n += 1;
       e += termo;      
    }
    while(  erro < termo );
    
    printf("Retorno = %.4lf \n", e );
    getch();
    return( 0 );
}
