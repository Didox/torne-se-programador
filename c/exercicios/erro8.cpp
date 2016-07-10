#include<stdio.h>
#include<conio.h>

double e, termo;
int n;
double funcaoe( double x , double erro, char t );

int main()
{        
    e = 1.0;
    n = 1;
    
    double x, erro;
    printf("Digite o valor de x: ");
    scanf("%lf", &x );
    printf("Digite o valor de erro: ");
    scanf("%lf", &erro );  
      
    funcaoe( x , erro, 't' );
    printf("Retorno = %.4lf \n", e );
    
    getch();
    return( 0 );
}

double funcaoe( double x , double erro, char t )
{
    n += 1;         
    if( n <= 1 )
      termo = 1 / 1 ;
    else
    {     
      if( t == 'p' )
         termo = ( x * funcaoe( x , n-1, 'p' ) );  
      if( t == 'f' )
         termo = ( n * funcaoe( x , n -1, 'f' ) );
      if( t == 't' )                    
         termo = ( ( funcaoe( x , n-1 , 'p' ) ) / ( funcaoe( x , n-1 , 'f' ) ) );         
    }    
    e += termo;      
    if( erro > termo )
         return( e ); 
    funcaoe( x , erro , 't' );       
}

