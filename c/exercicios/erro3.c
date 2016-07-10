#include<stdio.h>
#include<conio.h>

double eatu, termo;
int n;
double funcaoe( double x , double erro );
double potencia( double x , int n );
double fatorial( int n );

int main()
{        
    eatu = 1.0;
    n = 1;
    double x, erro;
    printf("Digite o valor de x: ");
    scanf("%lf", &x );
    printf("Digite o valor de erro: ");
    scanf("%lf", &erro );

    funcaoe( x , erro );
    getch();
    return( 0 );
}

double funcaoe( double x , double erro )
{        
    n += 1;
    termo = potencia( x , n-1 ) / fatorial( n - 1 );        
    printf("termo %lf \n", termo );
    getch();
    eatu += termo;      
    if( erro > termo )
    {
         printf("Retorno = %.4lf \n", eatu );
         return( eatu ); 
    }    
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



double fatorial( int n )
{
    if( n == 0 )
        return 1;
    else
        return( n * fatorial( n -1 ) );
}

