//arquivo Calculadora.java

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Calculadora extends JFrame implements ActionListener {

	private JTextField lblDisplay =3D new JTextField("0");
	private JPanel painelBotoes =3D new JPanel();
	private JButton btnZero =3D new JButton("0");
	private JButton btnUm =3D new JButton("1");
	private JButton btnDois =3D new JButton("2");
	private JButton btnTres =3D new JButton("3");
	private JButton btnQuatro =3D new JButton("4");
	private JButton btnCinco =3D new JButton("5");
	private JButton btnSeis =3D new JButton("6");
	private JButton btnSete =3D new JButton("7");
	private JButton btnOito =3D new JButton("8");
	private JButton btnNove =3D new JButton("9");
	private JButton btnMais =3D new JButton("+");
	private JButton btnMenos =3D new JButton("-");
	private JButton btnMultiplicacao =3D new JButton("*");
	private JButton btnDivisao =3D new JButton("/");
	private JButton btnIgual =3D new JButton("=3D");
	private int operando1 =3D 0;
	private int operando2 =3D 0;
	private char operacao =3D ' ';

    //construtor da classe Calculadora
	public Calculadora() {
	Container c =3D getContentPane();

    //organiza o frame em 2 linhas por 1 coluna
    GridLayout g1 =3D new GridLayout(2,1);
	c.setLayout(g1);
	lblDisplay.setHorizontalAlignment(SwingConstants.RIGHT);
	lblDisplay.setEditable(false);

    //adiciona o label e o painel ao frame
    c.add(lblDisplay);
	c.add(painelBotoes);

    //organiza o painel em 4 linhas por 2 colunas
    GridLayout g2 =3D new GridLayout(4,2);
	painelBotoes.setLayout(g2);

    //adiciona os bot=F5es ao painel
    painelBotoes.add(btnZero);
	painelBotoes.add(btnUm);
	painelBotoes.add(btnDois);
    painelBotoes.add(btnTres);
    painelBotoes.add(btnQuatro);
    painelBotoes.add(btnCinco);
    painelBotoes.add(btnSeis);
    painelBotoes.add(btnSete);
    painelBotoes.add(btnOito);
    painelBotoes.add(btnNove);
	painelBotoes.add(btnMais);
	painelBotoes.add(btnMenos);
	painelBotoes.add(btnMultiplicacao);
	painelBotoes.add(btnDivisao);
	painelBotoes.add(btnIgual);

    //configura o tratamento de eventos dos bot=F5es
    btnZero.addActionListener(this);
	btnUm.addActionListener(this);
	btnDois.addActionListener(this);
	btnTres.addActionListener(this);
	btnQuatro.addActionListener(this);
	btnCinco.addActionListener(this);
	btnSeis.addActionListener(this);
	btnSete.addActionListener(this);
	btnOito.addActionListener(this);
	btnNove.addActionListener(this);
	btnMais.addActionListener(this);
	btnMenos.addActionListener(this);
	btnMultiplicacao.addActionListener(this);
	btnDivisao.addActionListener(this);
	btnIgual.addActionListener(this);

    //configura=E7=F5es gerais do frame
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	setSize(250,250);
	setVisible(true);
	}
	public void actionPerformed(ActionEvent e) {
		//identifica qual bot=E3o foi pressionado e realiza o tratamento do =
evento
        if (e.getSource() =3D=3D btnZero) {
		String x =3D lblDisplay.getText();
		int i =3D Integer.parseInt(x);
		if(i!=3D0) {
			lblDisplay.setText( x + "0" );
			}
			} else if (e.getSource() =3D=3D btnUm) {
				String x =3D lblDisplay.getText();
				int i =3D Integer.parseInt(x);
				if(i!=3D0) {
					lblDisplay.setText( x + "1" );
					} else {
					lblDisplay.setText( "1" );
					}
					}
					else if (e.getSource() =3D=3D btnDois) {
				String x =3D lblDisplay.getText();
				int i =3D Integer.parseInt(x);
				if(i!=3D0) {
					lblDisplay.setText( x + "2" );
					} else {
					lblDisplay.setText( "2" );
					}
					}
					else if (e.getSource() =3D=3D btnTres) {
				String x =3D lblDisplay.getText();
				int i =3D Integer.parseInt(x);
				if(i!=3D0) {
					lblDisplay.setText( x + "3" );
					} else {
					lblDisplay.setText( "3" );
					}
					}
					else if (e.getSource() =3D=3D btnQuatro) {
				String x =3D lblDisplay.getText();
				int i =3D Integer.parseInt(x);
				if(i!=3D0) {
					lblDisplay.setText( x + "4" );
					} else {
					lblDisplay.setText( "4" );
					}
					}
					else if (e.getSource() =3D=3D btnCinco) {
				String x =3D lblDisplay.getText();
				int i =3D Integer.parseInt(x);
				if(i!=3D0) {
					lblDisplay.setText( x + "5" );
					} else {
					lblDisplay.setText( "5" );
					}
					}
					else if (e.getSource() =3D=3D btnSeis) {
				String x =3D lblDisplay.getText();
				int i =3D Integer.parseInt(x);
				if(i!=3D0) {
					lblDisplay.setText( x + "6" );
					} else {
					lblDisplay.setText( "6" );
					}
					}
					else if (e.getSource() =3D=3D btnSete) {
				String x =3D lblDisplay.getText();
				int i =3D Integer.parseInt(x);
				if(i!=3D0) {
					lblDisplay.setText( x + "7" );
					} else {
					lblDisplay.setText( "7" );
					}
					}
					else if (e.getSource() =3D=3D btnOito) {
				String x =3D lblDisplay.getText();
				int i =3D Integer.parseInt(x);
				if(i!=3D0) {
					lblDisplay.setText( x + "8" );
					} else {
					lblDisplay.setText( "8" );
					}
					}
					else if (e.getSource() =3D=3D btnNove) {
				String x =3D lblDisplay.getText();
				int i =3D Integer.parseInt(x);
				if(i!=3D0) {
					lblDisplay.setText( x + "9" );
					} else {
					lblDisplay.setText( "9" );
					}
					}
					else if (e.getSource() =3D=3D btnMais) {
						String x =3D lblDisplay.getText();
						operando1 =3D Integer.parseInt(x);
						operacao =3D '+';
						lblDisplay.setText("0");
						}
						else if (e.getSource() =3D=3D btnMenos) {
						String x =3D lblDisplay.getText();
						operando1 =3D Integer.parseInt(x);
						operacao =3D '-';
						lblDisplay.setText("0");
						}
						else if (e.getSource() =3D=3D btnMultiplicacao) {
						String x =3D lblDisplay.getText();
						operando1 =3D Integer.parseInt(x);
						operacao =3D '*';
						lblDisplay.setText("0");
						}
						else if (e.getSource() =3D=3D btnDivisao) {
						String x =3D lblDisplay.getText();
						operando1 =3D Integer.parseInt(x);
						operacao =3D '/';
						lblDisplay.setText("0");
						}
							else if (e.getSource() =3D=3D btnIgual) {
							String x =3D lblDisplay.getText();
							operando2 =3D Integer.parseInt(x);
							if (operacao =3D=3D '+') {
								int resultado =3D operando1 + operando2;
								lblDisplay.setText("" + resultado);
								JOptionPane.showMessageDialog(null,"Opera=E7=E3o 
conclu=EDda!");
								System.exit(0);
							}
							if (operacao =3D=3D '-') {
								int resultado =3D operando1 - operando2;
								lblDisplay.setText("" + resultado);
								JOptionPane.showMessageDialog(null,"Opera=E7=E3o 
conclu=EDda!");
								System.exit(0);
							}
							if (operacao =3D=3D '+') {
								int resultado =3D operando1 + operando2;
								lblDisplay.setText("" + resultado);
								JOptionPane.showMessageDialog(null,"Opera=E7=E3o 
conclu=EDda!");
								System.exit(0);
							}
 							if (operacao =3D=3D '/') {
								int resultado =3D operando1 / operando2;
								lblDisplay.setText("" + resultado);
								JOptionPane.showMessageDialog(null,"Opera=E7=E3o 
conclu=EDda!");
								System.exit(0);
							}
							if (operacao =3D=3D '*') {
								int resultado =3D operando1 * operando2;
								lblDisplay.setText("" + resultado);
								JOptionPane.showMessageDialog(null,"Opera=E7=E3o 
conclu=EDda!");
								System.exit(0);
							}
                 }
		}
}
//fim do arquivo Calculadora.java
