
package lista;

import javax.swing.JOptionPane;

public class Pilha extends Lista // Erança da classe Lista
{
    public Pilha () 
    {
        info = new String[10];
    }

    //private int MAXSTACK;		
    private int topo;
    private String [] info;
    private String x="", p="", q="";

    public void InicializaPilha(Pilha P)
    {
            P.topo = 0;
    } 

    public boolean PilhaVazia(Pilha P)
    {
            return ( P.topo == 0 ); 
    } 

    public boolean PilhaCheia(Pilha P)
    {
            return ( P.topo == 10 );
    }

    public boolean Empilha(Pilha P, String x)
    {
            if ( PilhaCheia(P) || x == "" ) return false;  
            P.info[P.topo] = x;              
            P.topo++;                        
            return true;                  
    } 
    public String Desempilha( Pilha P )
    {
            if( PilhaVazia(P) ) return "";
            P.topo--;                   
            return P.info[P.topo];			     
    } 

    public String ElementoTopo(Pilha P)
    {
            if ( PilhaVazia(P) ) return ""; 
            return P.info[P.topo-1];		
    }
    public boolean MostraPilha( Pilha P )
    {
            int v = 0;
            while( !PilhaVazia( P ) )
            {
                    P.topo--;
                    JOptionPane.showMessageDialog ( null, P.info[P.topo]+ " \n" );
                    v++;  
            }
            P.topo = v;
            return true;              
    } 

    public Pilha InvertePilha(Pilha P, int pv )
    {
            if( PilhaVazia( P ) ) return null;
            Pilha Q = new Pilha();
            InicializaPilha( Q );			
            while( !PilhaVazia( P ) )
            {
                    x = Desempilha( P );
                    Empilha( Q, x ); 
                    pv++;
            } 
            P = Q; 
            return P;              
    } 
    public boolean ComparaPilha( Pilha P, Pilha Q, int pv )
    {
            while( !PilhaVazia( P ) && !PilhaVazia( Q ) )
            {
                    pv++;
                    p = Desempilha( P );
                    q = Desempilha( Q );        
                    if( p != q )
                    {
                            P.topo += pv; 
                            Q.topo += pv;
                            return false;
                    }
            }

            if( !PilhaVazia( P ) || !PilhaVazia( Q ) )
            {
                    P.topo += pv;
                    Q.topo += pv;
                    return false;
            }
            else
            {
                    P.topo = pv; 
                    Q.topo = pv;
            }

            return true;              
    } 
    public Pilha CopiaPilha( Pilha P, Pilha Q, int pv )
    {
            InicializaPilha( Q );
            if( PilhaVazia( P ) ) return null; 
            while( !PilhaVazia( P ) )
            {
                    pv++;
                    p = Desempilha( P );
                    Empilha( Q, p );       
            }
            P.topo += pv;
            return InvertePilha( Q, pv );
    } 
    public Pilha ConcatenaPilha( Pilha P, Pilha Q, int pv )
    {
            if( PilhaVazia( Q ) ) return null;
            while( !PilhaVazia( Q ) )
            {
                    pv++;
                    p = Desempilha( Q);
                    Empilha( P, p );       
            }
            return P;              
    } 

}
