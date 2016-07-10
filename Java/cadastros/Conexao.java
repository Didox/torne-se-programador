import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class Conexao
{
	private  Connection conexao;
	private  ResultSet rs;
	private   Statement ponte_conexao;
	static Conexao instancia ;
			
	private Conexao() throws Exception
	{
		doConnection();
		setSql("SELECT * FROM T_Cadastro ORDER BY nome");
	}
	
	public static Conexao getInstance()throws Exception
	{
		if ( instancia == null )
		{
			instancia = new Conexao();
		}
		
		return instancia;
	}
	
	private void doConnection() throws Exception //faz a conexão com o banco
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        conexao = DriverManager.getConnection("jdbc:odbc:karometro");
        ponte_conexao = conexao.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
    }
	
	public void setSql( String sql ) throws Exception //metodo pra realizar instruções sql
	{
		if ( sql != null )
		{
			rs = ponte_conexao.executeQuery( sql );
		}
		
	}
	 	
	public ResultSet moveNext() throws Exception //move o resultset pro proximo
	{
		if ( !rs.next() )
		{
			rs.previous();
		}
		return rs;
	}
	
	public ResultSet movePrevious() throws Exception //move o resultset pro anterior
	{
		if ( !rs.previous() )
		{
			rs.next();
		}
		return rs;
	}
	
	public ResultSet first() throws Exception //move o resultset pro primeiro
	{
		rs.first();
		return rs;
	}
	
	public ResultSet last() throws Exception //move o resultset pro ultimo
	{
		rs.last();
		return rs;
	}
	
	public ResultSet delete( Aluno alunoOri )throws Exception //deleta o registro
	{
		ponte_conexao.executeUpdate( "DELETE FROM T_Cadastro WHERE id_codigo = " + alunoOri.getId_codigo() );
		setSql("SELECT * FROM T_Cadastro ORDER BY nome");
		rs.first();
		return rs;
	}
	
	public ResultSet update ( Aluno alunoOri )throws Exception //atualiza o registro
	{
		String sql = "UPDATE T_Cadastro set nome = '" + alunoOri.getNome() + "', endereço = '" + alunoOri.getEndereco() + "',";
		sql += "telefone = '" + alunoOri.getTelefoneRes() + "',celular = '" + alunoOri.getTelefoneCel() + "', bairro = '" + alunoOri.getBairro() + "',";
		sql += "cidade = '" + alunoOri.getCidade() + "', estado = '" + alunoOri.getEstado() + "',photo = '" + alunoOri.getFoto() + "'";
		sql += " WHERE id_codigo = " + alunoOri.getId_codigo();
		
		ponte_conexao.executeUpdate( sql );
		setSql("SELECT * FROM T_Cadastro ORDER BY nome");
		rs.first();
		return rs;
	}
	
	public ResultSet cadastra( Aluno alunoOri )throws Exception // insere um novo aluno
	{
		String sql = "INSERT INTO T_Cadastro ( nome,endereço,telefone,celular,bairro,cidade,estado,photo ) VALUES ";
		sql += "('" + alunoOri.getNome() + "','" + alunoOri.getEndereco() + "','" + alunoOri.getTelefoneRes() + "'";
		sql += ",'" + alunoOri.getTelefoneCel() + "','" + alunoOri.getBairro() + "','" + alunoOri.getCidade() + "'";
		sql += ",'" + alunoOri.getEstado() + "','" + alunoOri.getFoto() + "')";
		ponte_conexao.executeUpdate( sql );
		setSql("SELECT * FROM T_Cadastro ORDER BY nome");
		rs.first();
		return rs;
	}
}
