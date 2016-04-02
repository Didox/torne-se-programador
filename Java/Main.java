
package tanque;

import javax.swing.JOptionPane;

public class Main {
    
    public Main() {
    }
   
    public static void main(String[] args) {
        tanque objTanque = new tanque();
        objTanque.IniciarMissao();
        JOptionPane.showMessageDialog( null,objTanque.energia+"" );
        objTanque.x = 20;
        objTanque.y = 20;       
        objTanque.Atirar(20,20, "caminhao");
        JOptionPane.showMessageDialog( null, objTanque.energia+"" );               
    }
    
}
