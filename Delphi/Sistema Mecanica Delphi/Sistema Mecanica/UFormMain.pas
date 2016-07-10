unit UFormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls, Buttons;

type
  TfrmMain = class(TForm)
    ADOConn: TADOConnection;
    procedure edtCommandChange(Sender: TObject);
  private
    { Private declarations }
    procedure GetCliente;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.GetCliente;
begin
end;

procedure TfrmMain.edtCommandChange(Sender: TObject);
begin
  GetCliente;
end;

end.
