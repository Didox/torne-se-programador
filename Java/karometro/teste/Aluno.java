import java.sql.ResultSet;

public class Aluno
{

	//declaração de variáveis
	private int id_codigo;
	private String nome;
	private String endereco;
	private String  telefoneRes;
	private String telefoneCel;
	private String bairro;
	private String cidade;
	private String estado;
	private String foto;
	private Conexao registro;
	
	public Aluno( String nome, String endereco, String telefoneRes, String telefoneCel, String bairro, String cidade, String estado, String foto )throws Exception
	{
		this.nome = nome;
		this.endereco = endereco;
		this.telefoneRes = telefoneRes;
		this.telefoneCel = telefoneCel;
		this.bairro = bairro;
		this.cidade = cidade;
		this.estado = estado;
		this.foto = foto;
		registro = Conexao.getInstance();
	}
	
	public Aluno() throws Exception // construtor vazio realizandom uma instancia da classe conexao
	{
		registro = Conexao.getInstance();
	}
	
	public String getBairro() {
		return bairro;
	}
	
		
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	
	public String getCidade() {
		return cidade;
	}
	
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	
	public String getEndereco() {
		return endereco;
	}
	
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	
	public String getEstado() {
		return estado;
	}
	
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	public String getFoto() {
		
		if ( foto == null )
		{
			foto = "";
		}
		
		return foto;
	}
	
	public void setFoto(String foto) {
		this.foto = foto;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getTelefoneCel() {
		return telefoneCel;
	}
	
	public void setTelefoneCel(String telefoneCel) {
		this.telefoneCel = telefoneCel;
	}
	
	public String getTelefoneRes() {
		return telefoneRes;
	}
	
	public void setTelefoneRes(String telefoneRes) {
		this.telefoneRes = telefoneRes;
	}
	
	public int getId_codigo() {
		return id_codigo;
	}

	public void setId_codigo(int id_codigo) {
		this.id_codigo = id_codigo;
	}
		
	public void moveNext() throws Exception //move o registro pro proximo retorna um resultset e monta o obj como resultset retornado
	{
		montaObj( registro.moveNext() );
	}
	
	public void movePrevious() throws Exception
	{
		montaObj( registro.movePrevious() );
	}
	
	public void first() throws Exception
	{
		montaObj( registro.first() );
	}
	
	public void last() throws Exception
	{
		montaObj( registro.last() );
	}
	
	public void delete() throws Exception
	{
		montaObj( registro.delete( this ) );
	}
	
	public void update() throws Exception
	{
		montaObj( registro.update( this ) );
	}
	
	public void buscaAluno( String sql )throws Exception
	{
		registro.setSql( sql ) ; 
	}
	
	public void cadastra()throws Exception
	{
		System.out.println( this.getBairro() );
		montaObj( registro.cadastra( this ) );
	}
	
	public void montaObj( ResultSet rs ) throws Exception
	{
		setId_codigo( rs.getInt("id_codigo") );
		setNome( rs.getString("nome") );
		setEndereco( rs.getString("endereço") );
		setCidade( rs.getString("cidade") );
		setEstado( rs.getString("estado")  );
		setFoto( rs.getString("photo") );
		setTelefoneCel( rs.getString("celular") );
		setTelefoneRes( rs.getString("telefone") );
		setBairro( rs.getString("bairro") );
		
	}

	
}
