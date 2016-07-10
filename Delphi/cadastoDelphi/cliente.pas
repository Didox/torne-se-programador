unit cliente;

interface

uses system.Data, system.Data.SqlClient, System.Configuration;


type
  TCliente = class(&Object)
  private

  public
    constructor Create;
    var
    id: string;
    nome: string;
    endereco: string;
    cidade: string;
    estado: string;
    cep: string;
    numero: Integer;

    function gravar:string;

  end;

implementation

constructor TCliente.Create;
begin
  inherited Create;
end;


function TCliente.gravar():string;
var
  con : SqlConnection;
  com : SqlCommand;
  sqlP : SqlParameter;
begin
  con := SqlConnection.Create(ConfigurationSettings.AppSettings['conn']);
  com := SqlCommand.Create('P_INCLUIR_CLIENTE',con);
  com.CommandType := CommandType.StoredProcedure;

  //com.Parameters.Add( SqlParameter.Create('@id', SqlDbType.Int) );
  com.Parameters.Add(SqlParameter.Create('@nome', SqlDbType.VarChar) );
  com.Parameters.Add(SqlParameter.Create('@endereco', SqlDbType.VarChar) );
  com.Parameters.Add(SqlParameter.Create('@cidade', SqlDbType.VarChar) );
  com.Parameters.Add(SqlParameter.Create('@estado', SqlDbType.VarChar) );
  com.Parameters.Add(SqlParameter.Create('@cep', SqlDbType.VarChar) );
  com.Parameters.Add(SqlParameter.Create('@numero', SqlDbType.Int) );

 // com.Parameters[0].Value := id;
  com.Parameters[0].Value := nome;
  com.Parameters[1].Value := endereco;
  com.Parameters[2].Value := cidade;
  com.Parameters[3].Value := estado;
  com.Parameters[4].Value := cep;
  com.Parameters[5].Value := Convert.ToChar( numero );

  try
       com.Connection.Open;
       com.ExecuteNonQuery;
       Result := '1';
       con.Close;
  except
  on e : Exception do begin
        Result := 'Erro ao cadastrar cliente';
        exit;
      end;
  end;
end;

end.
