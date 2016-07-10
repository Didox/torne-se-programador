unit UPrincip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmPrincip = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lblClock: TLabel;
    Label4: TLabel;
    TimerClock: TTimer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure btnOrcamentoClick(Sender: TObject);
    procedure TimerClockTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincip: TfrmPrincip;

implementation

uses UClientes, UOS;

{$R *.dfm}

procedure TfrmPrincip.btnOrcamentoClick(Sender: TObject);
begin
  frmOrcamento.ShowModal;
end;

procedure TfrmPrincip.TimerClockTimer(Sender: TObject);
begin
  lblClock.Caption := timeToStr( time );
end;

procedure TfrmPrincip.FormActivate(Sender: TObject);
begin
  lblClock.Caption := timeToStr( time );
end;

procedure TfrmPrincip.BitBtn1Click(Sender: TObject);
begin
  frmClientes.edtBusc.Text := '0';
  frmClientes.DBGridCliente.Hint := 'Para alterar de um duplo clique no registro';
  frmClientes.ShowModal;
end;

procedure TfrmPrincip.BitBtn2Click(Sender: TObject);
begin
  frmOrcamento.ShowModal;
end;

procedure TfrmPrincip.BitBtn3Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
