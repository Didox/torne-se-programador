import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.File;
import java.io.PrintWriter;
import java.io.FileWriter;
import java.io.FileReader;
import java.io.BufferedReader; 
public class Tela extends JFrame
{
    
    private JPanel pnTela;
    
    private JLabel lblNome;    
    private JTextField txtNome;
    
    private JLabel lblEnder;
    private JTextField txtEnder;
    
    private JLabel lblTel;
    private JTextField txtTel;
    
    private JLabel lblEmail;
    private JTextField txtEmail;
    
    private JButton lblInsere;
    
    private JButton lblPesquisa;
    
    private JTextArea lblTxtArea;
    
    private JScrollPane lblScrBar;
        
    public Tela()
    {
           super();
           inicilizaComponente();
           this.setVisible(true);
           
    }

    public void inicilizaComponente()
    {
        pnTela = (JPanel)this.getContentPane();
        pnTela.setLayout(null);
        
       lblNome = new JLabel("Nome: ");
       txtNome= new JTextField();
       
       lblEnder = new JLabel("Endereço: ");
       txtEnder= new JTextField();
       
       lblTel = new JLabel("Telefone: ");
       txtTel= new JTextField();
       
       lblEmail = new JLabel("E-mail: ");
       txtEmail= new JTextField();
       
       lblInsere= new JButton("Inserir na Agenda");
       
       lblPesquisa = new JButton("Pesquisar na Agenda");
       
       lblTxtArea = new JTextArea(2,2);
       
       lblScrBar  = new JScrollPane(lblTxtArea);
    
       lblInsere.addActionListener(new ActionListener(){
           
           public void actionPerformed(ActionEvent e){
            //aqui insere a ação no botão            
            //cria o arquivo no diretório
            try{
                
                FileWriter writer = new FileWriter(new 
File("c:\\agenda.txt"),true);
                 PrintWriter saida = new PrintWriter(writer); 
                 saida.println(txtNome.getText());
                 saida.println(txtEnder.getText());
                 saida.println(txtTel.getText());
                 saida.println(txtEmail.getText());
                 
saida.println("==========================================================");
                 JOptionPane.showMessageDialog(null, "Dados Inseridos 
com Sucesso!", "::::Agenda::::", 0);
                 saida.close();
                 writer.close();
                                txtNome.setText("");
                                txtEnder.setText("");
                                txtTel.setText("");
                                txtEmail.setText("");
    
                }
             catch(Exception erro){
                
                 JOptionPane.showMessageDialog(null, ":::Agenda:::", 
"Erro ao Abrir o Arquivo", 2);
                
                }
            }
        });
        
        lblPesquisa.addActionListener(new ActionListener(){
           
           public void actionPerformed(ActionEvent f){
           String RetornoPesq = null;
            do{
                RetornoPesq = 
JOptionPane.showInputDialog(null,"Pesquisar Nome na Agenda");
               if(RetornoPesq == null)
               {
                break;
               }
            }
            while(RetornoPesq.length()<1);

            if(RetornoPesq == null){
              return;
            }
            
             //aqui insere a ação no botão            
            //cria o arquivo no diretório
            try{
                FileReader reader = new FileReader("c:\\agenda.txt");
                BufferedReader leitor = new BufferedReader(reader);

                String linha = "";                
                while( leitor.ready() )
                {                   
                    linha = leitor.readLine();

                    if(linha.indexOf(RetornoPesq)==0)
                            {
                                    for (int x = 0; x <= 2; x++)
                                        {
                                            linha += "\n" + 
leitor.readLine();
                                        }
                                    break;                
                            }
                }
                lblTxtArea.setText(linha);          

                    
                }
             catch(Exception erro){
                
                 JOptionPane.showMessageDialog(null, ":::Agenda:::", 
"Erro ao Ler o Arquivo", 2);
                
                }
            }
        });
           
       addComponente(lblNome,50,50,60,20);
       addComponente(txtNome,110,50,100,20);
       
       addComponente(lblEnder,50,100,60,20);
       addComponente(txtEnder,110,100,100,20);
       
       addComponente(lblTel,50,150,60,20);
       addComponente(txtTel,110,150,100,20);
       
       addComponente(lblEmail,50,200,60,20);
       addComponente(txtEmail,110,200,100,20);
       
       addComponente(lblInsere,220,200,150,20);
       
       addComponente(lblPesquisa,380,200,180,20);
       
       addComponente(lblScrBar,10,250,570,160);
    
        
        this.setLocation(200,200);
        this.setSize(600,500);
        this.setTitle("::::Agenda::::");
        this.setResizable(false);
              
        
    }
    
    private void addComponente(Container c, int left, int top, int 
width, int height)
    {
        c.setBounds(left,top,width,height);
        pnTela.add(c);
    }
    
    public static void main (String [] args)
    {
        new Tela();
    }
    
}
        