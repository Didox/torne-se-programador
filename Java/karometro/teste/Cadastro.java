import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.UIManager;
import javax.swing.WindowConstants;

public class Cadastro extends JFrame {
	
	// declaração de variáveis
	private JLabel lbnome, lbend, lbtelefone, lbbairro, lbcidade, lbestado, lbcelular;

	private JTextField txtnome, txtend, txttel, txtbairro, txtcidade, txtcelular;

	private JComboBox comboestado;

	private JButton botaogravar, botaocancelar, botaobuscar, botaoapagar,cadastro,gravarcadastro,botaocancelarcad;

	private JPanel painel;

	private Container cxprincipal;

	private JLabel foto;

	private JLabel lblfoto;
	
	private Aluno aluno;
	
	private JButton primeiro,ultimo,anterior,proximo;
	
	private JFileChooser arquivo;
	
	private JButton abreArquivo;

public Cadastro() throws Exception{
		super("Karomêtro da 1º turma de WEB");

		aluno    = new Aluno(); //instancia da aclasse aluno
				
		abreArquivo = new JButton("Escolher Foto...");
		abreArquivo.setBounds(100,295,165,20);
		abreArquivo.setFont( new Font("verdana",1,10) );
		arquivo = new JFileChooser(); // objeto pra abria a janela de procurar imagem
		
		abreArquivo.addActionListener(new ActionListener(){ // abre a janela escolhe a imagem
			public void actionPerformed(ActionEvent gravar){
				 if ( arquivo.showOpenDialog( null ) == 0 ) // se uma imagme for escolhida insere na label de foto abaixo
				 {
				 	 foto.setIcon( new ImageIcon ( arquivo.getSelectedFile().toString() ));
				 }
				 
				
			}
		});
		
		
		primeiro = new JButton("Primeiro");
		primeiro.setBounds(2,325,85,20);
		primeiro.setFont( new Font("verdana",1,10) );
		
		primeiro.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent gravar){
				try
				{
				first(); // chama o metodo first que move o registro pro primeiro
				}
				catch( Exception ex )
				{
					System.out.println(ex.getMessage());
				}
				
			}
		});
		
		anterior = new JButton("Anterior");
		anterior.setBounds(97,325,85,20);
		anterior.setFont( new Font("verdana",1,10) );
		
		anterior.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent gravar){
				try
				{
				movePrevious(); // chama o metodo movePrevious que move o registro pro anterior
				}
				catch( Exception ex )
				{
					System.out.println(ex.getMessage());
				}
			}
		});
		
		proximo  = new JButton("Próximo");
		proximo.setBounds(190,325,85,20);
		proximo.setFont( new Font("verdana",1,10) );
		
		proximo.addActionListener(new ActionListener()  {
			public void actionPerformed(ActionEvent gravar) {
				
				try
				{
				moveNext(); // chama o metodo moveNext que move o registro pro proximo
				}
				catch( Exception ex )
				{
					System.out.println(ex.getMessage());
				}
			}
		});
		
		ultimo   = new JButton("Ultimo");
		ultimo.setBounds(285,325,85,20);
		ultimo.setFont( new Font("verdana",1,10) );
		
		ultimo.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent gravar){
				try
				{
				last(); // chama o metodo last que move o registro pro ultimo
				}
				catch( Exception ex )
				{
					System.out.println(ex.getMessage());
				}
			}
		});
		
		// CRIANDO PAINEL
		painel = new JPanel();
		painel.setLayout(null);

		// CRIANDO CONTAINER
		cxprincipal = new Container();


		// CRIANDO OBJETOS LABEL.
		lbnome = new JLabel("NOME");
		lbnome.setBounds(10,10,40,20);
		
		lbend = new JLabel("ENDEREÇO");
		lbend.setBounds(10,35,80,20);
		
		lbtelefone = new JLabel("TELEFONE");
		lbtelefone.setBounds(10,60,80,20);
		
		lbcelular = new JLabel("CELULAR");
		lbcelular.setBounds(210,60,80,20);
		
		lbbairro = new JLabel("BAIRRO");
		lbbairro.setBounds(10,85,80,20);
		
		lbcidade = new JLabel("CIDADE");
		lbcidade.setBounds(10,110,80,20);
		
		lbestado = new JLabel("ESTADO");
		lbestado.setBounds(10,135,80,20);
		
		foto = new JLabel();



		// CRIANDO OBJETOS TEXT FIELD (CAIXA DE TEXTO)
		txtnome = new JTextField();
		txtnome.setBounds(100,10,270,20);
		
		txtend = new JTextField();
		txtend.setBounds(100,35,270,20);
		
		txttel = new JTextField();
		txttel.setBounds(100,60,100,20);
		
		txtcelular = new JTextField();
		txtcelular.setBounds(270,60,100,20);
		
		txtbairro = new JTextField();
		txtbairro.setBounds(100,85,270,20);
		
		txtcidade = new JTextField();
		txtcidade.setBounds(100,110,270,20);

		// CRIANDO COMBO
		comboestado = new JComboBox();
		comboestado.addItem("ACRE");
		comboestado.addItem("ALAGOAS");
		comboestado.addItem("AMAPA");
		comboestado.addItem("AMAZONAS");
		comboestado.addItem("BAHIA");
		comboestado.addItem("CEARÁ");
		comboestado.addItem("DISTRITO FEDERAL");
		comboestado.addItem("ESPIRITO SANTO");
		comboestado.addItem("FERNANDO DE NORONHA");
		comboestado.addItem("GOIÁS");
		comboestado.addItem("MARANHÃO");
		comboestado.addItem("MATO GROSSO");
		comboestado.addItem("MATO GROSSO DO SUL");
		comboestado.addItem("MINAS GERAIS");
		comboestado.addItem("PARA");
		comboestado.addItem("PARAÍBA");
		comboestado.addItem("PARANA");
		comboestado.addItem("PERNANBUCO");
		comboestado.addItem("PIAUÍ");
		comboestado.addItem("RIO DE JANEIRO");
		comboestado.addItem("RIO GRANDE DO NORTE");
		comboestado.addItem("RIO GRANDE DO SUL");
		comboestado.addItem("RORAIMA");
		comboestado.addItem("RONDONIA");
		comboestado.addItem("SÃO PAULO");
		comboestado.addItem("SANTA CATARINA");
		comboestado.addItem("SERGIPE");
		comboestado.addItem("TOCANTINS");
		comboestado.setFont( new Font("verdana",1,10) );
		comboestado.setBounds(100,135,165,20);

		// CRIANDO BOTÕES
		botaogravar = new JButton("SALVAR");
		botaogravar.setBounds(273,135,96,30);
		botaogravar.setFont( new Font("verdana",1,10) );
		
		cadastro = new JButton("Adicionar");
		cadastro.setBounds(273,247,96,30);
		cadastro.setFont( new Font("verdana",1,10) );	

		cadastro.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent gravar){
				preparaCampos(); // chama o metodo preparaCampos que limpa os campos pra poder gravar um novo aluno
			}		
		});
		
		
		gravarcadastro = new JButton("Gravar");
		gravarcadastro.setBounds(273,247,96,30);
		gravarcadastro.setFont( new Font("verdana",1,10) );	
		gravarcadastro.setVisible(false);

		gravarcadastro.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent gravar){
				try
				{
				adicionaAluno(); // chama o metodo adicionaAluno que insere um novo aluno
				}
				catch( Exception ex )
				{
						System.out.println(ex.getMessage());
				}
			}		
		});
		
		
		botaobuscar = new JButton("BUSCAR");
		botaobuscar.setBounds(273,173,96,30);
		botaobuscar.setFont( new Font("verdana",1,10) );
		
		botaoapagar = new JButton("APAGAR");
		botaoapagar.setBounds(273,210,96,30);
		botaoapagar.setFont( new Font("verdana",1,10) );
		
		botaocancelar = new JButton("Fechar");
		botaocancelar.setBounds(273,285,96,30);
		botaocancelar.setFont( new Font("verdana",1,10) );
		
		botaocancelarcad = new JButton("Cancelar");
		botaocancelarcad.setBounds(273,285,96,30);
		botaocancelarcad.setFont( new Font("verdana",1,10) );
		botaocancelarcad.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent gravar){
				try
				{
					cancelaCad(); // chama o metodo cancelaCad que volta os registros ao normal
				}
				catch( Exception ex )
				{
					System.out.println(ex.getMessage());
				}
				
			}		
		});
		
		
		
		lblfoto = new JLabel("PHOTO");
		lblfoto.setBounds(10,230,80,20);

		
		foto.setBounds(100,160,165,130);
	
						
		// CONFIGURANDO A INTERFACE (ADICIONANDO OBJETOS UM DENTRO DO OUTRO)
		painel.add(lbnome);
		painel.add(txtnome);

		painel.add(lbend);
		painel.add(txtend);

		painel.add(lbtelefone); 
		painel.add(txttel); 
		
		painel.add(lbcelular);
		painel.add(txtcelular);

		painel.add(lbbairro);
		painel.add(txtbairro);

		painel.add(lbcidade);
		painel.add(txtcidade);

		painel.add(lbestado);
		painel.add(comboestado);

		painel.add(lblfoto);
		painel.add(foto);

		painel.add(botaogravar);
		painel.add(botaobuscar);
		painel.add(botaoapagar);
		painel.add(botaocancelar);
		painel.add(cadastro);
		painel.add(gravarcadastro);
		painel.add(botaocancelarcad);
		
		painel.add(ultimo);
		painel.add(primeiro);
		painel.add(anterior);
		painel.add(proximo);
		
		painel.add(abreArquivo);
		
		
		
		cxprincipal.add(painel);

		getContentPane().add(painel);

		// APRESENTANDO A INTERFACE
		setSize(390,380);
		show();
		setDefaultCloseOperation( WindowConstants.EXIT_ON_CLOSE );

		
		// CRIANDO AÇÃO NOS BOTÕES.
		botaogravar.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent gravar){ // atualiza dados do aluno
				
				aluno.setBairro( txtbairro.getText().trim() );
				aluno.setCidade( txtcidade.getText().trim() );
				aluno.setEndereco( txtend.getText().trim() );
				aluno.setEstado( comboestado.getSelectedItem().toString() );
				aluno.setFoto( foto.getIcon().toString() );
				aluno.setNome( txtnome.getText().trim() );
				aluno.setTelefoneCel( txtcelular.getText().trim() );
				aluno.setTelefoneRes( txttel.getText().trim() );
				
				try
				{
				aluno.update();
				exibeDados( aluno );
				}
				catch( Exception ex )
				{
					System.out.println( ex.getMessage() );
				}
				
				JOptionPane.showMessageDialog(null,"ATUALIZADO COM SUCESSO","Karômetro",JOptionPane.INFORMATION_MESSAGE);
			}
		});
		
		botaobuscar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent buscar) {
							
				try
				{
				buscaAluno();
				}
				catch( Exception ex )
				{
					System.out.println( ex.getMessage() );
				}
			
			}
		});
		
				
		botaoapagar.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent apagar){ //chama a funcao deletar registro
				try
				{
					if ( JOptionPane.showConfirmDialog(null,"Deseja realmente excluir o aluno?","Karômetro",JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION )
					{
						delete(); // se a opcao for sim chama o metodo delete()
						JOptionPane.showMessageDialog(null,"REGISTRO EXCLUÍDO COM SUCESSO","Karômetro",JOptionPane.INFORMATION_MESSAGE);
					}
				
				}
				catch(Exception es)
				{
					//
				}
			}
		});
		
		botaocancelar.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent cancelar){
				System.exit(0);
			}
		});
		
		moveNext();
		
	}

	
	
	private void exibeDados( Aluno aluno ) throws Exception // metodo que exibe os dados do aluno na tela
	{
		
		txtnome.setText( aluno.getNome() );
		txtend.setText( aluno.getEndereco() );
		txttel.setText( aluno.getTelefoneRes() );
		txtcelular.setText( aluno.getTelefoneCel() );
		txtbairro.setText( aluno.getBairro() );
		txtcidade.setText( aluno.getCidade() );
		comboestado.setSelectedItem( aluno.getEstado().toUpperCase() );
		foto.setIcon( new ImageIcon( aluno.getFoto() ));
	}

	private void buscaAluno()throws Exception
	{
		String sql = "SELECT * FROM T_Cadastro WHERE id_codigo IS NOT NULL";
		
		String nome = JOptionPane.showInputDialog(null,"Digite O nome do Aluno.\n Deixe em branco caso deseje retornar todos os registros.","Busca de Aluno",1);  
		
		if ( !nome.equals("") )
		{
			sql += " and nome like '%" + nome + "%'";
		}
		
		sql+= " ORDER BY nome";
		
		aluno.buscaAluno( sql );
		try
		{
			moveNext();
		}
		catch( Exception ex)
		{
			JOptionPane.showMessageDialog( this,"Nenhum Aluno com nome \" " + nome + " \" encontrado","Karômetro",JOptionPane.ERROR_MESSAGE);
			aluno.buscaAluno( "SELECT * FROM T_Cadastro ORDER BY nome" );
			moveNext();
		}
		
		}
	
	private void moveNext() throws Exception // chama a funcao movenext na classe aluno pra mover pro proximo registro
	{
		aluno.moveNext();
		exibeDados( aluno );
		
	}
	
	private void movePrevious() throws Exception //  chama a funcao movePrevious na classe aluno pra mover pro proximo anterior
	{
		aluno.movePrevious();
		exibeDados( aluno );
	}
	
	private void first() throws Exception //  chama a funcao first na classe aluno pra mover pro primeiro registro
	{
		aluno.first();
		exibeDados( aluno );
	}
	
	private void last() throws Exception //  chama a funcao last na classe aluno pra mover pro ultimo anterior
	{
		aluno.last();
		exibeDados( aluno );
	}
	
	private void delete()throws Exception//  chama a funcao delete na classe aluno pra deletar o registro //
	{
		aluno.delete();
		exibeDados( aluno );
	}
	
	private void preparaCampos()
	{
		botaoapagar.setEnabled(false);
		botaobuscar.setEnabled(false);
		botaogravar.setEnabled(false);
		primeiro.setEnabled(false);
		ultimo.setEnabled(false);
		proximo.setEnabled(false);
		anterior.setEnabled(false);
		cadastro.setVisible(false);
		gravarcadastro.setVisible(true);
		botaocancelar.setVisible(false);
		botaocancelarcad.setVisible(true);
		
		txtbairro.setText("");
		txtcelular.setText("");
		txtcidade.setText("");
		txtend.setText("");
		txtnome.setText("");
		txttel.setText("");
		comboestado.setSelectedIndex(0);
		foto.setIcon(new ImageIcon(""));
				
		
	}
	
	private void adicionaAluno()throws Exception
	{
		String imagem = foto.getIcon().toString();
		
		Aluno novoAluno = new Aluno( txtnome.getText().trim(), txtend.getText().trim(), txttel.getText().trim(), txtcelular.getText().trim(), txtbairro.getText().trim(), txtcidade.getText().trim(), comboestado.getSelectedItem().toString().trim(),imagem);
		novoAluno.cadastra();
		mostraBotoes();
		JOptionPane.showMessageDialog(this,"Aluno Cadastrado com Sucesso","Karômetro",JOptionPane.INFORMATION_MESSAGE);}
	
	
	private void cancelaCad() throws Exception
	{
		mostraBotoes();
		first();
	}
	
	private void mostraBotoes()
	{
		botaoapagar.setEnabled(true);
		botaobuscar.setEnabled(true);
		botaogravar.setEnabled(true);
		primeiro.setEnabled(true);
		ultimo.setEnabled(true);
		proximo.setEnabled(true);
		anterior.setEnabled(true);
		cadastro.setVisible(true);
		gravarcadastro.setVisible(false);
		botaocancelar.setVisible(true);
		botaocancelarcad.setVisible(false);
		
	}
	public static void main(String args[]) throws Exception {
		
		
		JFrame.setDefaultLookAndFeelDecorated(true); 
 		JDialog.setDefaultLookAndFeelDecorated(true); 
 		try 
 		{ 
 			UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel"); 
 		} 
 		catch (Exception ex) 
 		{ 
 			System.out.println("Failed loading L&F: "); 
 			System.out.println(ex); 
 		} 
		new Cadastro();

	}

}

