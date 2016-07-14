package lista;

import java.util.Random;
import javax.swing.JOptionPane;

public class Lista extends ListaGeral { // extendo a minha classe para acessar os médodos da ListaGeral
    
    /**********************************  Construtor **********************************************/
    
    public Lista(){ // construtor que acrecenta o tamanho da lista
        L = new int[TAMANHO];  // istanciando a lista
        posicao = 0; // inicia a posicao;
        tam = RestaLista();
    }
    
    /********************************  Declaração dos atributos ***********************************/
    
    private int posicao; // posicao atual da lista
    private int TAMANHO = 10; // tamanho da lista
    public int[] L; // lista de string
    private int x = 0; // atributo de auxilio para exclusao recursiva ( ExcluirOcorenciasListaR )
    private int y = 0; // atributo de auxilio para exclusao recursiva ( GeraListaR )
    private int tam; // atributo de auxilio para Gerar recursiva
    
    /********************************** Criação dos Métodos ****************************************/
    
    public boolean ListaVazia(){
        return( posicao == 0 );
    }
    
    /************************************************************************************************/
    
    public boolean ListaCheia(){
        return( posicao == TAMANHO );
    }
    
    /************************************************************************************************/

    public void LimparLista(){
        posicao = 0;
    }
     
    /************************************************************************************************/
    
    public int RetornaTamanhoLista(){ // retorna o tamanho da lista
        return TAMANHO;
    }    
     
    /************************************************************************************************/
    
    public int RetornaPosicaoLista(){ // retorna o posicao da lista
        return posicao;
    }
     
    /************************************************************************************************/
    
    public void AumentaTamanhoLista( int Quanto ){ // Aumenta o tamanho da lista
        posicao += Quanto;
    }
     
    /************************************************************************************************/
    
    
    public void DiminuiTamanhoLista( int Quanto ){ // Diminui o tamanho da lista
        posicao -= Quanto;
    }
     
    /************************************************************************************************/
    
    public int RestaLista(){ // Diminui o tamanho da lista
        tam = TAMANHO  - posicao;
        return( tam );
    }
     
    
    /************************************************************************************************/
    
    public boolean GeraLista(){ // Gera numeros aleatórios para Lista
        if( ListaCheia() ) return false;
        tam = RestaLista();
        for( int i=0; i<tam; i++ ){
            L[posicao] = (int)Math.abs( Math.random() * TAMANHO ); // gera numero aleatório > 0 
            posicao++;
        }
        tam = 0;
        return true;
    }
    
    /************************************************************************************************/
         
    public boolean GeraListaR(){ // Gera numeros aleatórios para Lista
        if( ListaCheia() ) return false;        
        if( y < tam ){
            L[posicao] = (int)Math.abs( Math.random() * TAMANHO ) ; // gera numero aleatório > 0 < TAMANHO
            posicao++;
            y++;
            return GeraListaR();
        }
        y = 0;
        tam = 0;
        return true;
    }
    
    /************************************************************************************************/
    
    public boolean Incluir( int valor ){ // inclui valor na posicao livre da lista
        if( ListaCheia() ) return false;
            L[posicao] = valor;
        posicao++;
        return true;
    }
    
    /************************************************************************************************/
    public boolean ExcluirPosicaoLista( int Pos ) {// exclui da lista com a posição passada
        if( ListaVazia() ) return false;
        for( int i=Pos; i<posicao-1; i++ )
            L[i] = L[i+1];
        posicao--;
        return true;
    }
    
    /************************************************************************************************/
   
    public boolean ExcluirPosicaoListaR( int Pos ){ // exclui da lista com a posição passada recursiva
        if( ListaVazia() ) return false;
        if( Pos < posicao-1 ){
            L[Pos] = L[Pos+1];
            return ExcluirPosicaoListaR( Pos+1 );
        }
        posicao--;
        return true;
    }
    
    /************************************************************************************************/
    
    public boolean ExcluirOcorenciasLista( int valor ){ // exclui todos os valores da lista = ao parametro
        if( ListaVazia() ) return false;
        for( int x=0; x<posicao; x++ ){
            if( L[x] == valor ){
                for( int i=x; i<posicao; i++ )
                    L[i] = L[i+1];
                posicao--;
                x--;
            }
        }
        return true;
    }
       
    /************************************************************************************************/
    
    public boolean ExcluirOcorenciasListaR( int valor ){  // exclui todos os valores da lista = ao parametro recursiva
        if( ListaVazia() ) return false;
        if( x < posicao ){
            if( L[x] == valor ){
                ExcluirPosicaoListaR( x ); // com acesso as posições que foi encontrada,
                x--; // é retirada da lista através da posição
            }
            x++;
            ExcluirOcorenciasListaR( valor );
        }
        x = 0;
        return true;
    }
    
    /************************************************************************************************/
 
    public boolean MostrarLista(){// mostra o conteúdo da lista;
        if( ListaVazia() ) return false;
        String msg = "";
        for( int i=0; i<posicao; i++ )
            msg += L[i] + "\n";   
        JOptionPane.showMessageDialog(null,msg);
        return true;
    }
    
    /************************************************************************************************/
}
 