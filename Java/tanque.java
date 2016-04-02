
package tanque;

public class tanque {
    
    public tanque() { // construtor da classe
    }
    
    
     public static int x; //inicialisa atrubuto x
     public  static int y;//inicialisa atrubuto y
     public  static int energia;//inicialisa atrubuto energia
     public  static int municao;//inicialisa atrubuto municao

     public void IniciarMissao(){ //inicialisa operacao IniciarMissao
      // inicialisa o tanque
      x = 0;
      y = 0;
      energia = 100;
      municao = 50;  
     }

     public void Mover( int dx, int dy ){ //inicialisa operacao Mover
      x += dx; // incrementa coordenada digitada com a existente
      y += dy; // incrementa coordenada digitada com a existente
     }

     public void Atirar( int codX, int codY, String from ){ //inicialisa operacao IniciarAtirar
      // Baixa a municao e verifica se as coordenadas sao iguais se forem baixa a energia
      municao += - 10;
      if( codX  == x && codY == y )
       energia += -10;
     }

     public void BaixarEnergia( int delta ){ //inicialisa operacao BaixarEnergia
      energia += - delta;  // dimunui a nergia pelo tanto instanciado
     }
}