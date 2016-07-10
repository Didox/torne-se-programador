#include<stdio.h>
#include<conio.h>

double e, termo;
int n;
double funcaoe( double x , double erro );
double potfat( double x, int n, char t );

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
    n += 1;         
    termo = potfat( x, n, 't' );  
    e += termo;      
    if( erro > termo )
         return( e ); 
    funcaoe( x , erro  );       
}

double potfat( double x, int n, char t )
{     
    if( n == 0 )
        return 1 / 1;
    else
    {
        if( n == 1 )
           return 1 / 1 ;
        else
        {     
           if( t == 'p' )
              return( x * potfat( x , n-1, 'p' ) );  
           if( t == 'f' )
              return( n * potfat( x , n -1, 'f' ) );
           if( t == 't' )                    
              return( ( potfat( x , n-1 , 'p' ) ) / ( potfat( x , n-1 , 'f' ) ) );         
        }
    }
}
