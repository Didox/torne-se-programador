class Exemplo4{
	public static void main (String [] args){
		int x=20000;
		while (x<=50000){
			primo (x);
			x++;
		}
	}
	public static void primo (int n){
		int divisor=2;
		while (divisor < n){
			int resto=n%divisor;
			if (resto==0){
				System.out.println (n+" não é primo ");
				return;
			}
			divisor++;
		}
		System.out.println (n+" é primo ");
	}
}