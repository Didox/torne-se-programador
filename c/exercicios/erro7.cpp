#include<stdio.h>
#include<conio.h>

double e, termo, pot = 1, fat = 1;;
int n;
double funcaoe( double x , double erro );
double potencia( double x , int n );

int main()
{        
    e = 1.0;
    n = 1;
    
    double x, erro;
    printf("Digite o valor de x: ");
    scanf("%lf", &x );
    printf("Digite o valor de erro: ");
    scanf("%lf", &erro );  
      
    funcaoe( x , erro );
    printf("Retorno = %.4lf \n", e );
    
    getch();
    return( 0 );
}

double funcaoe( double x , double erro )
{            
    double pot = potencia( x , n-1 ); 
    termo = pot / ( fat = fat * n );
    n += 1;
    e += termo;      
    if( erro > termo )
         return( e ); 
    funcaoe( x , erro  );       
}

double potencia( double x , int n )
{
    if( n == 0 )
       return( 1.0 );  
    else
    {
       if( n == 1.0 )
          return( 1.0 );
       else
          return( x * potencia( x , n-1 ) );
    }                
}
