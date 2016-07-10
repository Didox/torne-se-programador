
unit Default;

interface

uses
  System.Collections, System.ComponentModel,
  System.Data, System.Drawing, System.Web, System.Web.SessionState,
  System.Web.UI, System.Web.UI.WebControls, System.Web.UI.HtmlControls, cliente;

type
  TWebForm2 = class(System.Web.UI.Page)
  {$REGION 'Designer Managed Code'}
  strict private
    procedure InitializeComponent;
    procedure Button1_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    procedure Page_Load(sender: System.Object; e: System.EventArgs);
  strict protected
    Button1: System.Web.UI.WebControls.Button;
    procedure OnInit(e: EventArgs); override;
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

implementation

{$REGION 'Designer Managed Code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWebForm2.InitializeComponent;
begin
  Include(Self.Button1.Click, Self.Button1_Click);
  Include(Self.Load, Self.Page_Load);
end;
{$ENDREGION}

procedure TWebForm2.Page_Load(sender: System.Object; e: System.EventArgs);
begin
end;

procedure TWebForm2.OnInit(e: EventArgs);
begin
  //
  // Required for Designer support
  //
  InitializeComponent;
  inherited OnInit(e);
end;

procedure TWebForm2.Button1_Click(sender: System.Object; e: System.EventArgs);
var
  objCliente : TCliente;
  retorno : string;
begin
  objCliente := TCliente.Create;

  objCliente.nome := 'danilo';
  objCliente.endereco := 'geste';
  objCliente.cidade := 'teste';
  objCliente.estado := 'SP';
  objCliente.cep := '915454545';
  objCliente.numero := 20;

  retorno := objCliente.gravar;

  if retorno = '1' then begin
    RegisterStartupScript('ok','<script> alert("cadastro concluido");</script>');
  end else begin
    RegisterStartupScript('ok','<script> alert("'+retorno+'");</script>');
  end;

end;

end.

