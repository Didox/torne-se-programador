unit UOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ADODB, DB, Mask, Buttons;

type
  TfrmOrcamento = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGridOrcamentos: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    DataSourceOrcamento: TDataSource;
    ADODataSetGrid: TADODataSet;
    ADOCommand: TADOCommand;
    edtPlaca: TEdit;
    maskNOs: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    rbSim: TRadioButton;
    rbNao: TRadioButton;
    rbTodos: TRadioButton;
    btPesq: TBitBtn;
    btDelOrc: TBitBtn;
    btNOrk: TBitBtn;
    btSair: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure btnOSClick(Sender: TObject);
    procedure DBGridOrcamentosDblClick(Sender: TObject);
    procedure DBGridOrcamentosDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure rbTodosClick(Sender: TObject);
    procedure rbNaoClick(Sender: TObject);
    procedure rbSimClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure maskNOsKeyPress(Sender: TObject; var Key: Char);
    procedure edtPlacaKeyPress(Sender: TObject; var Key: Char);
    procedure btPesqClick(Sender: TObject);
    procedure btDelOrcClick(Sender: TObject);
    procedure btNOrkClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetOrcamentos;
  end;

var
  frmOrcamento: TfrmOrcamento;

implementation

uses UNovaOs, UAlterOS;

{$R *.dfm}

procedure TfrmOrcamento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrcamento.GetOrcamentos;
var
  sql : string;
  pago : string;
begin
  pago := '';
  if rbSim.Checked then pago := rbSim.Caption;
  if rbNao.Checked then pago := rbNao.Caption;

  sql := 'SELECT top 100 orcamento.id as [Nº], orcamento.Veiculo as [Veiculo], orcamento.Placa as [Placa], orcamento.Ano as [Ano Veiculo],';
  sql := sql + ' cliente.nome as [Cliente], cliente.cpf as [CPF], cliente.telefone as [Telefone]';
  sql := sql + ' , orcamento.pago as [Está pago], (select sum(valor) from itemOrcamento where orcamento.Id = idOrcamento ) as [Valor Total]';
  sql := sql + ' FROM orcamento INNER JOIN cliente ON orcamento.idCliente = cliente.id';
  sql := sql + ' where orcamento.id is not null ';
  if Trim(maskNOs.Text) <> '' then
    sql := sql + ' and ( orcamento.id = ' + maskNOs.Text + ')';
  if pago <> '' then
    sql := sql + ' and ( orcamento.pago = "' + pago + '" )';
  sql := sql + ' and ( orcamento.placa like "%' + edtPlaca.Text + '%" )';
  sql := sql + ' order by orcamento.id desc';

  ADODataSetGrid.Active := false;
  ADODataSetGrid.CommandText := sql;
  ADODataSetGrid.Active := true;

end;

procedure TfrmOrcamento.FormActivate(Sender: TObject);
begin
     maskNOs.Text := '';
     edtPlaca.Text := '';
     GetOrcamentos;
end;

procedure TfrmOrcamento.btnPesqClick(Sender: TObject);
begin
    GetOrcamentos;
end;

procedure TfrmOrcamento.btnOSClick(Sender: TObject);
begin
  frmNovoOrcamento.ShowModal;
end;

procedure TfrmOrcamento.DBGridOrcamentosDblClick(Sender: TObject);
begin
  frmOrcamentoAlterar.edtId.Text := DBGridOrcamentos.Fields[0].AsString;
  frmOrcamentoAlterar.ShowModal;
end;

procedure TfrmOrcamento.DBGridOrcamentosDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if ADODataSetGrid.Fields[7].AsString = 'Sim' then
    DBGridOrcamentos.Canvas.Brush.Color := clSkyBlue
  else
    DBGridOrcamentos.Canvas.Brush.Color := clRed;
  DBGridOrcamentos.Canvas.FillRect(Rect);
  DBGridOrcamentos.DefaultDrawDataCell(Rect,Field,State);
end;

procedure TfrmOrcamento.rbTodosClick(Sender: TObject);
begin
  rbNao.Checked := false;
  rbSim.Checked := false;
end;

procedure TfrmOrcamento.rbNaoClick(Sender: TObject);
begin
  rbTodos.Checked := false;
  rbSim.Checked := false;
end;

procedure TfrmOrcamento.rbSimClick(Sender: TObject);
begin
  rbNao.Checked := false;
  rbTodos.Checked := false;
end;

procedure TfrmOrcamento.btnExcluirClick(Sender: TObject);
var
 buttonSelected : Integer;
begin
  buttonSelected := MessageDlg('Confirma exclusão do orçamento nº ' + DBGridOrcamentos.Fields[0].AsString,mtConfirmation, mbOKCancel, 0);
  if buttonSelected = mrOK then
  begin
    ADOCommand.CommandText := 'delete * from Orcamento where id= ' + DBGridOrcamentos.Fields[0].AsString + '';
    ADOCommand.Execute;

    ADOCommand.CommandText := 'delete * from itemOrcamento where idOrcamento= ' + DBGridOrcamentos.Fields[0].AsString + '';
    ADOCommand.Execute;

    GetOrcamentos;
  end
end;

procedure TfrmOrcamento.maskNOsKeyPress(Sender: TObject; var Key: Char);
begin
  if key in ['0'..'9',#8]=false then
    key:=#13;
end;

procedure TfrmOrcamento.edtPlacaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['a' .. 'z', '0'..'9',#8] then
    Key:=UpCase( Key )
  else
    key:=#13;

end;

procedure TfrmOrcamento.btPesqClick(Sender: TObject);
begin
    GetOrcamentos;
end;

procedure TfrmOrcamento.btDelOrcClick(Sender: TObject);
var
 buttonSelected : Integer;
begin
  buttonSelected := MessageDlg('Confirma exclusão do orçamento nº ' + DBGridOrcamentos.Fields[0].AsString,mtConfirmation, mbOKCancel, 0);
  if buttonSelected = mrOK then
  begin
    ADOCommand.CommandText := 'delete * from Orcamento where id= ' + DBGridOrcamentos.Fields[0].AsString + '';
    ADOCommand.Execute;

    ADOCommand.CommandText := 'delete * from itemOrcamento where idOrcamento= ' + DBGridOrcamentos.Fields[0].AsString + '';
    ADOCommand.Execute;

    GetOrcamentos;
  end

end;

procedure TfrmOrcamento.btNOrkClick(Sender: TObject);
begin
  frmNovoOrcamento.ShowModal;
end;

procedure TfrmOrcamento.btSairClick(Sender: TObject);
begin
  Close;
end;

end.
