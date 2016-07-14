package pilha;
import javax.swing.*;
public class Pilha {
    
    public Pilha() {
    }
    
    private int topo = 0;
    private String x = "";
    private int maxteck = 10;
    private String info[] = new String[maxteck];    
    
    public boolean InicializaPilha( Pilha P ){
        P.topo = 0;
        return true;
    }
    
    public boolean PilhaCheia( Pilha P ){
        return( P.topo == maxteck );
    }
    
    public boolean PilhaVazia( Pilha P ){
        return( P.topo == 0 );
    }
    
    public boolean Empilha( Pilha P, String x ){
        if( PilhaCheia( P ) ) return false;
        P.info[ P.topo ] = x;
        P.topo++;
        return true;
    }
    
    public String Desemplilha( Pilha P, String x ){
        if( PilhaVazia( P ) ) return "";
        P.topo--;
        x = P.info[ P.topo ];
        return x;
    }
    
    public String ElementoTopo( Pilha P, String x ){
        if( PilhaVazia( P ) ) return "";
        x = P.info[ P.topo-- ];
        return x;
    }
    
    public boolean MostraPilha( Pilha P ){
        int v=0;
        if( PilhaVazia( P ) ){
            P.topo = v;
            return false;
        }
        while( !PilhaVazia( P ) ){
            String x ="";
            x = Desemplilha( P , x );
            JOptionPane.showMessageDialog( null, x );
            v++;
        }
        return true;
    }
    
    //public boolean InvertePilha(  )
}
