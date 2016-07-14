
package lista;
/* Objetivo servir de apoio para todas a listas  do tipo obj  , tambem ablilita a passagem por 
 referencia de outras listas */

import java.util.Random;
import javax.swing.JOptionPane;

public class ListaGeral{
    
    public ListaGeral() {
    }

    private int x = 0; // atributo de auxilio para exclusao recursiva ( ExcluirOcorenciasListaR )     
    
    /************************************************************************************************/
    
    public boolean GeraListaGeral( Lista L ){ // Gera numeros aleatórios para Lista
        if( L.ListaCheia() ) return false; 
        int tamanho = L.RestaLista();
        for( int i=0; i < tamanho ; i++ ){
            L.L[L.RetornaPosicaoLista()] = (int)Math.abs( Math.random() * L.RetornaTamanhoLista() ); // gera numero aleatório > 0 
            L.AumentaTamanhoLista( 1 );
        }
        return true;
    }
    
    /************************************************************************************************/
    
    public boolean IncluirGeral( int valor, Lista L ){ // inclui valor na posicao livre da lista
        if( L.ListaCheia() ) return false;
            L.L[L.RetornaPosicaoLista()] = valor;
        L.AumentaTamanhoLista(1);
        return true;
    }
    
    /************************************************************************************************/
    public boolean ExcluirPosicaoListaGeral( int Pos, Lista L ) {// exclui da lista com a posição passada
        if( L.ListaVazia() ) return false;
        for( int i=Pos; i<L.RetornaPosicaoLista()-1; i++ )
            L.L[i] = L.L[i+1];
        L.AumentaTamanhoLista(1);
        return true;
    }
    
    /************************************************************************************************/
   
    public boolean ExcluirPosicaoListaGeralR( int Pos, Lista L ){ // exclui da lista com a posição passada recursiva
        if( L.ListaVazia() ) return false;
        if( Pos < L.RetornaPosicaoLista()-1 ){
            L.L[Pos] = L.L[Pos+1];
            return ExcluirPosicaoListaGeralR( Pos+1, L );
        }
        L.AumentaTamanhoLista(1);
        return true;
    }
    
    /************************************************************************************************/
    
    public boolean ExcluirOcorenciasListaGeral( int valor, Lista L ){ // exclui todos os valores da lista = ao parametro
        if( L.ListaVazia() ) return false;
        for( int x=0; x<L.RetornaPosicaoLista(); x++ ){
            if( L.L[x] == valor ){
                for( int i=x; i<L.RetornaPosicaoLista(); i++ )
                    L.L[i] = L.L[i+1];
                L.DiminuiTamanhoLista(1);
                x--;
            }
        }
        return true;
    }
       
    /************************************************************************************************/
    
    public boolean ExcluirOcorenciasListaGeralR( int valor, Lista L ){  // exclui todos os valores da lista = ao parametro recursiva
        if( L.ListaVazia() ) return false;
        if( x < L.RetornaPosicaoLista() ){
            if( L.L[x] == valor ){
                ExcluirPosicaoListaGeralR( x, L ); // com acesso as posições que foi encontrada,
                x--; // é retirada da lista através da posição
            }
            x++;
            ExcluirOcorenciasListaGeralR( valor, L );
        }
        return true;
    }
    
    /************************************************************************************************/
 
    public boolean MostrarListaGeral( Lista L ){// mostra o conteúdo da lista;
        if( L.ListaVazia() ) return false;
        String msg = "";
        for( int i=0; i<L.RetornaPosicaoLista(); i++ )
            msg += L.L[i] + "\n";   
        JOptionPane.showMessageDialog(null,msg);
        return true;
    }
    
    /************************************************************************************************/    
}
