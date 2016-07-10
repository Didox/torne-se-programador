unit Transfer;

interface
uses
System.Data,
System.IO,
System.Windows.Forms,
System.Data.SqlClient;

type
  Transfers = class
  private
    cn : SqlConnection;
    cm : SqlCommand;
    ds : DataSet;
    da : SqlDataAdapter;
    cnRemote : SqlConnection;
    cmRemote : SqlCommand;
    dsRemote : DataSet;
    daRemote : SqlDataAdapter;
    connectionData : string;
    connectionServerRemote : string;
    procedure updatePasswors( ds : DataSet; objBar : ProgressBar );
    procedure saveLog( mess : string; errAccept : Boolean );
    function mountConnection( server : string; user : string; pass : string; database : string ) : string;
  public
    constructor Create( serverDefault : string; user : string; pass : string; database : string );
    procedure SetConnectionRemote( server : string; user : string; pass : string; database : string );
    function UpdatePassword( objBar : ProgressBar ) : string;
   end;

implementation

constructor Transfers.Create( serverDefault : string; user : string; pass : string; database : string );
begin
  inherited Create;
  connectionData := mountConnection( serverDefault, user, pass, database );
  cn := SqlConnection.Create( ConnectionData );
end;

procedure Transfers.saveLog( mess : string; errAccept : Boolean );
var
  direc : string;
  accept : string;
  vfile  : string;
  strm : StreamWriter;
begin
        accept := 'Accept_';

        if not errAccept then accept := 'Err_';

        direc := Directory.GetCurrentDirectory + '/Logs';
        if Directory.Exists( direc ) = False then
        begin
           Directory.CreateDirectory( direc );
        end;

        vfile := direc + '/' + accept + 'Log_' + DateTime.Now.ToString( 'ddMMyyyy' ) + '.txt';
        strm := StreamWriter.Create( vfile );
        strm.WriteLine( 'Atualização ativada em: ' + DateTime.Now.ToString );
        strm.WriteLine( mess );
        strm.Close;
end;

function Transfers.UpdatePassword( objBar : ProgressBar ) : string;
begin
   try
      try
        cnRemote := SqlConnection.Create( connectionServerRemote );
        cmRemote := SqlCommand.Create( 'P_Get_Tables_Password', cnRemote );
        cmRemote.CommandType := CommandType.StoredProcedure;
        dsRemote := DataSet.Create;

        cmRemote.Connection.Open;
        daRemote := SqlDataAdapter.Create( cmRemote );
        daRemote.Fill( dsRemote );
        updatePasswors( dsRemote, objBar );
        saveLog( 'Atualização concluida com sucesso', True );
        Result := '0';
      except
        on e: Exception do
        begin
          saveLog( e.Message, False );
          Result := e.Message;
        end;
      end;
   finally
      cmRemote.Connection.Close;
   end;
end;

procedure Transfers.updatePasswors( ds : DataSet; objBar : ProgressBar );
var
  i : Integer;
  x : Integer;
begin
  x := 0;
  objBar.Maximum := ( ds.Tables[0].Rows.Count + ds.Tables[1].Rows.Count + ds.Tables[2].Rows.Count );
  objBar.Minimum := x;

  // tabela 1
  for i:=0 to ds.Tables[0].Rows.Count - 1 do
  begin
    objBar.Value := x;
    cm := SqlCommand.Create( 'P_update_ContatosNet', cn );
    cm.CommandType := CommandType.StoredProcedure;
    cm.Parameters.Add( '@CodCadContatosNet', ds.Tables[0].Rows[i]['CodCadContatosNet'].ToString );
    cm.Parameters.Add( '@Senha', ds.Tables[0].Rows[i]['Senha'].ToString );
    cm.Parameters.Add( '@dataAlter', Convert.ToDateTime( ds.Tables[0].Rows[i]['dataAlter'].ToString ).ToString( 'yyyy/MM/dd' ) );
    cm.Connection.Open;
    cm.ExecuteNonQuery;
    cm.Connection.Close;
    x := x + 1;
  end;

  // tabela 2
  i := 0;
  for i:=0 to ds.Tables[1].Rows.Count - 1 do
  begin
    objBar.Value := x;
    cm := SqlCommand.Create( 'P_update_Contatos', cn );
    cm.CommandType := CommandType.StoredProcedure;
    cm.Parameters.Add( '@CodContatos', ds.Tables[1].Rows[i]['CodContatos'].ToString );
    cm.Parameters.Add( '@CodGrupo', ds.Tables[1].Rows[i]['CodGrupo'].ToString );
    cm.Parameters.Add( '@Qtde_Acesso', ds.Tables[1].Rows[i]['Qtde_Acesso'].ToString );
    cm.Connection.Open;
    cm.ExecuteNonQuery;
    cm.Connection.Close;
    x := x + 1;
  end;

  // tabela 3
  i := 0;
  for i:=0 to ds.Tables[2].Rows.Count - 1 do
  begin
    objBar.Value := x;
    cm := SqlCommand.Create( 'P_update_tbExterno', cn );
    cm.CommandType := CommandType.StoredProcedure;
    cm.Parameters.Add( '@CodContatosExterno', ds.Tables[2].Rows[i]['CodContatosExterno'].ToString );
    cm.Parameters.Add( '@CodGrupo', ds.Tables[2].Rows[i]['CodGrupo'].ToString );
    cm.Parameters.Add( '@Qtde_Acesso', ds.Tables[2].Rows[i]['Qtde_Acesso'].ToString );
    cm.Parameters.Add( '@Senha', ds.Tables[2].Rows[i]['Senha'].ToString );
    cm.Parameters.Add( '@dataAlter', Convert.ToDateTime( ds.Tables[2].Rows[i]['dataAlter'] ).ToString( 'yyyy/MM/dd' ) );
    cm.Connection.Open;
    cm.ExecuteNonQuery;
    cm.Connection.Close;
    x := x + 1;
  end;
end;

function Transfers.mountConnection( server : string; user : string; pass : string; database : string ) : string;
begin
    Result := 'User ID=' + user + ';password=' + pass
    + ';Initial Catalog=' + database + ';Data Source=' + server + ''
end;

procedure Transfers.SetConnectionRemote( server : string; user : string; pass : string; database : string );
begin
  connectionServerRemote := mountConnection( server, user, pass, database );
end;

end.
