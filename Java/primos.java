
import javax.swing.*;
public class primos
{
	public static boolean ehPrimo( int x )
	{
		// primo só é quando vc divide ele por ele mesmo e da o resto da zero e por 1
		boolean retorno = true;
		for( int i=x-1; i>=2; i-- )
		{
			//int resul = x % i ;
			//JOptionPane.showMessageDialog(null,resul+"");
			if( x % i != 0 )
				retorno =true;
			else
			{
				retorno = false;
				i = 2;
			}	
		}				
		return retorno;
	}
	
	public static void main( String[] args )
	{
		//int pri = JOptionPane.showInputDialog("Digite a quantidade");
		if( ehPrimo( Integer.parseInt( JOptionPane.showInputDialog("Digite a quantidade") ) ) )
			JOptionPane.showMessageDialog(null,"primo");
			//System.out.println("primo");
		else
			JOptionPane.showMessageDialog(null,"Nao primo");
			//System.out.println("primo");
			
	}
}
