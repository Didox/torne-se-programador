unit UNovaOs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ADODB, ComCtrls, Buttons;

type
  TfrmNovoOrcamento = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edtCliente: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtTelefone: TEdit;
    Label3: TLabel;
    edtCpf: TEdit;
    Label4: TLabel;
    edtVeiculo: TEdit;
    Label5: TLabel;
    maskAno: TMaskEdit;
    Label6: TLabel;
    edtPlaca: TEdit;
    Label7: TLabel;
    maskKm: TMaskEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edtId: TEdit;
    GroupBox4: TGroupBox;
    memoObs: TMemo;
    ADOCommand: TADOCommand;
    dtDateEntrada: TDateTimePicker;
    dtDateSaida: TDateTimePicker;
    btGravar: TBitBtn;
    btSair: TBitBtn;
    btPesq: TBitBtn;
    procedure brnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure maskKmKeyPress(Sender: TObject; var Key: Char);
    procedure edtPlacaKeyPress(Sender: TObject; var Key: Char);
    procedure edtVeiculoKeyPress(Sender: TObject; var Key: Char);
    procedure btSairClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btPesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovoOrcamento: TfrmNovoOrcamento;

implementation

uses UClientes, UFormMain, UOS, UAlterOS;

{$R *.dfm}

procedure TfrmNovoOrcamento.brnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNovoOrcamento.btnGravarClick(Sender: TObject);
var
  sql : string;
  valido : boolean;
begin
  valido := true;

  if trim( edtCliente.Text ) = '' then
  begin
     MessageDlg('Selecione o Cliente.',mtinformation, [mbOK], 0);
     valido := false;
  end;

  if trim( edtVeiculo.Text ) = '' then
  begin
     MessageDlg('Digite o Veículo.',mtinformation, [mbOK], 0);
     valido := false;
     edtVeiculo.SetFocus;
  end;

  if trim( maskAno.Text ) = '' then
  begin
     MessageDlg('Digite o Ano.',mtinformation, [mbOK], 0);
     valido := false;
     maskAno.SetFocus;
  end;

  if trim( edtPlaca.Text ) = '' then
  begin
     MessageDlg('Digite a Placa.',mtinformation, [mbOK], 0);
     valido := false;
     edtPlaca.SetFocus;
  end;

  if trim( maskKm.Text ) = '' then
  begin
     MessageDlg('Digite a Kilometragem.',mtinformation, [mbOK], 0);
     valido := false;
     maskKm.SetFocus;
  end;

  if valido then
  begin
    sql := 'insert into orcamento( idcliente, veiculo, ano, km, placa, dataInicio, dataFim, pago, obs )values(';
    sql := sql + '' + edtId.Text + ', "' + edtVeiculo.Text + '", ' + maskAno.Text + ',';
    sql := sql + '"' + maskKm.Text + '", "' + edtPlaca.Text + '", "' + DateToStr( dtDateEntrada.Date ) + '", "' + DateToStr( dtDateSaida.Date )  + '", "Não", "' + memoObs.Text + '" )';

    ADOCommand.CommandText := sql;
    ADOCommand.Execute;

    edtCliente.Text := '';
    memoObs.Text := '';
    edtCpf.Text := '';
    edtTelefone.Text := '';
    edtVeiculo.Text := '';
    maskAno.Text := '';
    edtPlaca.Text := '';
    maskKm.Text := '';
    dtDateEntrada.Date := date;
    dtDateSaida.Date := date;

    frmOrcamento.ADODataSetGrid.Active := false;
    frmOrcamento.ADODataSetGrid.CommandText := 'select top 1 id from orcamento order by id desc';
    frmOrcamento.ADODataSetGrid.Active := true;

    try
      if not frmOrcamento.ADODataSetGrid.Eof then
      begin
          frmOrcamentoAlterar.edtId.Text := frmOrcamento.ADODataSetGrid.Fields[0].AsString;
          frmOrcamentoAlterar.ShowModal;
          Close;
      end;
    finally
    end;
  end;
end;

procedure TfrmNovoOrcamento.FormActivate(Sender: TObject);
begin
  edtCliente.Text := '';
  memoObs.Text := '';
  edtCpf.Text := '';
  edtTelefone.Text := '';
  edtVeiculo.Text := '';
  maskAno.Text := '';
  edtPlaca.Text := '';
  maskKm.Text := '';
  dtDateEntrada.Date := date;
  dtDateSaida.Date := date;
end;

procedure TfrmNovoOrcamento.maskKmKeyPress(Sender: TObject; var Key: Char);
begin
  if key in ['0'..'9',#8]=false then
    key:=#13;
end;

procedure TfrmNovoOrcamento.edtPlacaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key in ['a' .. 'z', '0'..'9',#8] then
    Key:=UpCase( Key )
  else
    key:=#13;
end;

procedure TfrmNovoOrcamento.edtVeiculoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key:=UpCase( Key )
end;

procedure TfrmNovoOrcamento.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNovoOrcamento.btGravarClick(Sender: TObject);
var
  sql : string;
  valido : boolean;
begin
  valido := true;

  if trim( edtCliente.Text ) = '' then
  begin
     MessageDlg('Selecione o Cliente.',mtinformation, [mbOK], 0);
     valido := false;
  end;

  if trim( edtVeiculo.Text ) = '' then
  begin
     MessageDlg('Digite o Veículo.',mtinformation, [mbOK], 0);
     valido := false;
     edtVeiculo.SetFocus;
  end;

  if trim( maskAno.Text ) = '' then
  begin
     MessageDlg('Digite o Ano.',mtinformation, [mbOK], 0);
     valido := false;
     maskAno.SetFocus;
  end;

  if trim( edtPlaca.Text ) = '' then
  begin
     MessageDlg('Digite a Placa.',mtinformation, [mbOK], 0);
     valido := false;
     edtPlaca.SetFocus;
  end;

  if trim( maskKm.Text ) = '' then
  begin
     MessageDlg('Digite a Kilometragem.',mtinformation, [mbOK], 0);
     valido := false;
     maskKm.SetFocus;
  end;

  if valido then
  begin
    sql := 'insert into orcamento( idcliente, veiculo, ano, km, placa, dataInicio, dataFim, pago, obs )values(';
    sql := sql + '' + edtId.Text + ', "' + edtVeiculo.Text + '", ' + maskAno.Text + ',';
    sql := sql + '"' + maskKm.Text + '", "' + edtPlaca.Text + '", "' + DateToStr( dtDateEntrada.Date ) + '", "' + DateToStr( dtDateSaida.Date )  + '", "Não", "' + memoObs.Text + '" )';

    ADOCommand.CommandText := sql;
    ADOCommand.Execute;

    edtCliente.Text := '';
    memoObs.Text := '';
    edtCpf.Text := '';
    edtTelefone.Text := '';
    edtVeiculo.Text := '';
    maskAno.Text := '';
    edtPlaca.Text := '';
    maskKm.Text := '';
    dtDateEntrada.Date := date;
    dtDateSaida.Date := date;

    frmOrcamento.ADODataSetGrid.Active := false;
    frmOrcamento.ADODataSetGrid.CommandText := 'select top 1 id from orcamento order by id desc';
    frmOrcamento.ADODataSetGrid.Active := true;

    try
      if not frmOrcamento.ADODataSetGrid.Eof then
      begin
          frmOrcamentoAlterar.edtId.Text := frmOrcamento.ADODataSetGrid.Fields[0].AsString;
          frmOrcamentoAlterar.ShowModal;
          Close;
      end;
    finally
    end;
  end;

end;

procedure TfrmNovoOrcamento.btPesqClick(Sender: TObject);
begin
  frmClientes.edtBusc.Text := '1';
  frmClientes.DBGridCliente.Hint:= 'De um duplo clique no registro para selecionar o cliente';
  frmClientes.ShowModal;
end;

end.
