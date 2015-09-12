class Exec{
	public static void main(String[]args){
		System.out.println("Digite o primeiro valor");
		int p1 = Integer.parseInt(System.console().readLine());
		System.out.println("Digite o segundo valor");
		double p2 = Double.parseDouble(System.console().readLine());

		Saturno s = new Saturno(p1,p2);
		System.out.println(s.aneis);
		System.out.println(s.diametrokm);
		System.out.println(s.dia);
	}
}