unit UClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB, Buttons;

type
  TfrmClientes = class(TForm)
    GroupBox1: TGroupBox;
    DBGridCliente: TDBGrid;
    edtNomeCpf: TEdit;
    Label1: TLabel;
    DataSourceCliente: TDataSource;
    ADODataSetGrid: TADODataSet;
    ADOCommand: TADOCommand;
    edtBusc: TEdit;
    btExcluir: TBitBtn;
    btSair: TBitBtn;
    btNClie: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtNomeCpfChange(Sender: TObject);
    procedure DBGridClienteDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGridClienteDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure btExcluirClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btNClieClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetClientes;
  end;

var
  frmClientes: TfrmClientes;

implementation

uses UFormMain, USalvarCliente, UAlterarCliente, UNovaOs, UAlterOS;

{$R *.dfm}

procedure TfrmClientes.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmClientes.FormActivate(Sender: TObject);
begin
  edtNomeCpf.Text := '';
  GetClientes;
  edtNomeCpf.SetFocus;
end;

procedure TfrmClientes.GetClientes;
begin
  ADODataSetGrid.Active := false;
  ADODataSetGrid.CommandText := 'select top 100 id as [Código], cpf as [CPF], nome as [Nome] from cliente where cpf like "%' + edtNomeCpf.Text + '%" or nome like "%' + edtNomeCpf.Text + '%" order by id desc';
  ADODataSetGrid.Active := true;
end;

procedure TfrmClientes.edtNomeCpfChange(Sender: TObject);
begin
    GetClientes;
end;

procedure TfrmClientes.DBGridClienteDblClick(Sender: TObject);
var
  sql : string;
begin
  sql := 'select id,nome, cpf, telefone, endereco, cidade, estado, numero, email from cliente where id= ' + DBGridCliente.Fields[0].AsString + '';
  ADODataSetGrid.Active := false;
  ADODataSetGrid.CommandText := sql;
  ADODataSetGrid.Active := true;

  try
    if not ADODataSetGrid.Eof then
    begin
      if edtBusc.Text = '2' then
      begin
        frmOrcamentoAlterar.edtIdCliente.Text := ADODataSetGrid.Fields[0].AsString;
        frmOrcamentoAlterar.edtCliente.Text := ADODataSetGrid.Fields[1].AsString;
        frmOrcamentoAlterar.edtCpf.Text := ADODataSetGrid.Fields[2].AsString;;
        frmOrcamentoAlterar.edtTelefone.Text := ADODataSetGrid.Fields[3].AsString;
        Close;
      end
      else if edtBusc.Text = '1' then
      begin
        frmNovoOrcamento.edtId.Text := ADODataSetGrid.Fields[0].AsString;
        frmNovoOrcamento.edtCliente.Text := ADODataSetGrid.Fields[1].AsString;
        frmNovoOrcamento.edtCpf.Text := ADODataSetGrid.Fields[2].AsString;;
        frmNovoOrcamento.edtTelefone.Text := ADODataSetGrid.Fields[3].AsString;
        Close;
      end
      else if edtBusc.Text = '0' then
      begin
        frmAlterarCliente.edtId.Text := ADODataSetGrid.Fields[0].AsString;
        frmAlterarCliente.edtNome.Text := ADODataSetGrid.Fields[1].AsString;
        frmAlterarCliente.maskCpf.Text := ADODataSetGrid.Fields[2].AsString;;
        frmAlterarCliente.maskTelefone.Text := ADODataSetGrid.Fields[3].AsString;
        frmAlterarCliente.edtEndereco.Text := ADODataSetGrid.Fields[4].AsString;
        frmAlterarCliente.edtCidade.Text := ADODataSetGrid.Fields[5].AsString;
        frmAlterarCliente.cboEstado.Text := ADODataSetGrid.Fields[6].AsString;
        frmAlterarCliente.maskNumero.Text := ADODataSetGrid.Fields[7].AsString;
        frmAlterarCliente.edtEmail.Text := ADODataSetGrid.Fields[8].AsString;
        frmAlterarCliente.ShowModal;
      end;
    end;
  finally
  end;

end;

procedure TfrmClientes.Button1Click(Sender: TObject);
var
 buttonSelected : Integer;

begin
  buttonSelected := MessageDlg('Confirma Exclusão',mtConfirmation, mbOKCancel, 0);

  if buttonSelected = mrOK then
  begin
    ADOCommand.CommandText := 'delete * from cliente where id= ' + DBGridCliente.Fields[0].AsString + '';
    ADOCommand.Execute;
    GetClientes;
  end
end;

procedure TfrmClientes.DBGridClienteDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  DBGridCliente.Canvas.Brush.Color := clSkyBlue;
  DBGridCliente.Canvas.FillRect(Rect);
  DBGridCliente.DefaultDrawDataCell(Rect,Field,State);
end;

procedure TfrmClientes.btExcluirClick(Sender: TObject);
var
 buttonSelected : Integer;

begin
  buttonSelected := MessageDlg('Confirma exclusão do cliente',mtConfirmation, mbOKCancel, 0);

  if buttonSelected = mrOK then
  begin
    ADOCommand.CommandText := 'delete * from cliente where id= ' + DBGridCliente.Fields[0].AsString + '';
    ADOCommand.Execute;
    GetClientes;
  end

end;

procedure TfrmClientes.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmClientes.btNClieClick(Sender: TObject);
begin
  frmIncluirCliente.ShowModal;
end;

end.
