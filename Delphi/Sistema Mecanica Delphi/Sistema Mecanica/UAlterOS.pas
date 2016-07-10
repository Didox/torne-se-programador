unit UAlterOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, ADODB, DB, RpDefine, RpBase,
  RpSystem, RpRenderText, RpRenderHTML, RpRender, RpRenderPDF,
  RpRenderCanvas, RpRenderPrinter, ComCtrls, Buttons;

type
  TfrmOrcamentoAlterar = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCliente: TEdit;
    edtTelefone: TEdit;
    edtCpf: TEdit;
    edtId: TEdit;
    ADOCommand: TADOCommand;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtVeiculo: TEdit;
    maskAno: TMaskEdit;
    edtPlaca: TEdit;
    maskKm: TMaskEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox4: TGroupBox;
    memoObs: TMemo;
    GroupBox5: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    edtServico: TEdit;
    Label13: TLabel;
    DataSourceOrcamento: TDataSource;
    ADODataSetGrid: TADODataSet;
    ADOCommandItem: TADOCommand;
    Label14: TLabel;
    edtIdCliente: TEdit;
    rdlPago: TRadioButton;
    rdlPago2: TRadioButton;
    Label12: TLabel;
    rvRel: TRvSystem;
    RvRenderPDF1: TRvRenderPDF;
    RvRenderHTML1: TRvRenderHTML;
    RvRenderText1: TRvRenderText;
    ADODataSetRel: TADODataSet;
    ADODataSetRelItens: TADODataSet;
    DBGridItens: TDBGrid;
    edtValor: TEdit;
    edtValorItem: TEdit;
    dtDateEntrada: TDateTimePicker;
    dtDateSaida: TDateTimePicker;
    btPesq: TBitBtn;
    btSair: TBitBtn;
    btGravar: TBitBtn;
    btImprimir: TBitBtn;
    btSalvSer: TBitBtn;
    btDelSer: TBitBtn;
    procedure brnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure rdlPagoClick(Sender: TObject);
    procedure rdlPago2Click(Sender: TObject);
    procedure rvRelPrint(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtPlacaExit(Sender: TObject);
    procedure edtValorItemKeyPress(Sender: TObject; var Key: Char);
    procedure maskKmKeyPress(Sender: TObject; var Key: Char);
    procedure edtPlacaKeyPress(Sender: TObject; var Key: Char);
    procedure rvRelPrintHeader(Sender: TObject);
    procedure edtVeiculoKeyPress(Sender: TObject; var Key: Char);
    procedure edtServicoKeyPress(Sender: TObject; var Key: Char);
    procedure btPesqClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btSalvSerClick(Sender: TObject);
    procedure btDelSerClick(Sender: TObject);
    procedure DBGridItensDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetItens;
  end;

var
  frmOrcamentoAlterar: TfrmOrcamentoAlterar;

implementation

uses UOS, UAlterarCliente, UNovaOs, UClientes;

{$R *.dfm}

procedure TfrmOrcamentoAlterar.brnSairClick(Sender: TObject);
begin
  frmOrcamento.GetOrcamentos;
  Close;
end;

procedure TfrmOrcamentoAlterar.FormActivate(Sender: TObject);
var
  sql : string;
begin
  sql := 'SELECT orcamento.id as [Nº], orcamento.Veiculo as [Veiculo], orcamento.Placa as [Placa], orcamento.Ano as [Ano Veiculo],';
  sql := sql + ' cliente.nome as [Cliente], cliente.cpf as [CPF], cliente.telefone as [Telefone]';
  sql := sql + ' , (select sum(valor) from itemOrcamento where orcamento.Id = idOrcamento ) as [Valor Total]';
  sql := sql + ' , orcamento.km as [km], orcamento.dataInicio, orcamento.dataFim, orcamento.obs, cliente.id as [Código Cliente], orcamento.Pago as [Pago] ';
  sql := sql + ' FROM orcamento INNER JOIN cliente ON orcamento.idCliente = cliente.id';
  sql := sql + ' where orcamento.id = ' + edtId.Text;

  frmOrcamento.ADODataSetGrid.Active := false;
  frmOrcamento.ADODataSetGrid.CommandText := sql;
  frmOrcamento.ADODataSetGrid.Active := true;

  try
    if not frmOrcamento.ADODataSetGrid.Eof then
    begin
        edtId.Text := frmOrcamento.ADODataSetGrid.Fields[0].AsString;
        edtVeiculo.Text := frmOrcamento.ADODataSetGrid.Fields[1].AsString;
        edtPlaca.Text := frmOrcamento.ADODataSetGrid.Fields[2].AsString;;
        maskAno.Text := frmOrcamento.ADODataSetGrid.Fields[3].AsString;
        edtCliente.Text := frmOrcamento.ADODataSetGrid.Fields[4].AsString;
        edtCpf.Text := frmOrcamento.ADODataSetGrid.Fields[5].AsString;
        edtTelefone.Text := frmOrcamento.ADODataSetGrid.Fields[6].AsString;

        if trim( frmOrcamento.ADODataSetGrid.Fields[7].AsString ) <> '' then
          edtValor.Text := frmOrcamento.ADODataSetGrid.Fields[7].AsString;
          
        maskKm.Text := trim( frmOrcamento.ADODataSetGrid.Fields[8].AsString );
        dtDateEntrada.Date := StrToDate( frmOrcamento.ADODataSetGrid.Fields[9].AsString );
        dtDateSaida.Date := StrToDate( frmOrcamento.ADODataSetGrid.Fields[10].AsString );
        memoObs.Text := frmOrcamento.ADODataSetGrid.Fields[11].AsString;
        edtIdCliente.Text := frmOrcamento.ADODataSetGrid.Fields[12].AsString;

        if Trim(frmOrcamento.ADODataSetGrid.Fields[13].AsString) = 'Sim' then
        begin
          rdlPago.Checked := true;
          rdlPago2.Checked := false;
        end
        else
        begin
          rdlPago.Checked := false;
          rdlPago2.Checked := true;
        end
    end;
  finally
  end;

  GetItens;
end;

procedure TfrmOrcamentoAlterar.GetItens;
var
  sql : string;
begin
  sql := 'SELECT id as [Código do Item], descricao as [Descrição], Valor, IdOrcamento as [Nº Orçamento] ';
  sql := sql + ',(select sum(valor) from itemOrcamento where idOrcamento = orc.idOrcamento ) as [Valor Total] ';
  sql := sql + ' from itemOrcamento orc where orc.IdOrcamento = ' + edtId.Text;

  ADODataSetGrid.Active := false;
  ADODataSetGrid.CommandText := sql;
  ADODataSetGrid.Active := true;

   if not frmOrcamento.ADODataSetGrid.Eof then
   begin
     if trim( ADODataSetGrid.Fields[4].AsString ) <> '' then
        edtValor.Text := FormatCurr('0.00', strToCurr(ADODataSetGrid.Fields[4].AsString) );
   end
end;

procedure TfrmOrcamentoAlterar.btnSalvarClick(Sender: TObject);
var
  sql : string;
  active : boolean;
begin
  active := true;
  
  if trim(edtServico.Text) = '' then
  begin
    MessageDlg('Digite o Serviço.',mtinformation, [mbOK], 0);
    edtServico.SetFocus;
    active := false;
  end;

  if (trim(edtValorItem.Text) = '') or (trim(edtValorItem.Text) = '0.00') then
  begin
    MessageDlg('Digite o Valor',mtinformation, [mbOK], 0);
    edtValorItem.SetFocus;
    active := false;
  end;

  if active then
  begin
    sql := 'insert into itemOrcamento( descricao, idOrcamento, valor )values(';
    sql := sql + '"' + edtServico.Text + '", ' + edtId.Text + ',';
    sql := sql + '' + edtValorItem.Text + ' )';

    ADOCommand.CommandText := sql;
    ADOCommand.Execute;

    edtServico.Text := '';
    edtValorItem.Text := '0.00';

    GetItens;
  end;
end;

procedure TfrmOrcamentoAlterar.btnDeletarClick(Sender: TObject);
var
 buttonSelected : Integer;

begin
  buttonSelected := MessageDlg('Confirma exclusão do item',mtConfirmation, mbOKCancel, 0);

  if buttonSelected = mrOK then
  begin
    ADOCommand.CommandText := 'delete * from itemOrcamento where id= ' + DBGridItens.Fields[0].AsString + '';
    ADOCommand.Execute;
    GetItens;
  end

end;

procedure TfrmOrcamentoAlterar.btnGravarClick(Sender: TObject);
var
  sql : string;
  pago : string;
  valido : boolean;
begin
  if rdlPago.Checked then pago := rdlPago.Caption;
  if rdlPago2.Checked then pago := rdlPago2.Caption;
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
    sql := 'update orcamento set idcliente=' + edtIdCliente.Text + ', veiculo="' + edtVeiculo.Text + '"';
    sql := sql + ', ano=' + maskAno.Text + ', km=' + trim( maskKm.Text ) + ', placa="' + edtPlaca.Text + '"';
    sql := sql + ', dataInicio="' + DateToStr( dtDateEntrada.Date ) + '", dataFim="' + DateToStr( dtDateSaida.Date ) + '"';
    sql := sql + ', pago="' + pago + '", obs="' + memoObs.Text + '"';
    sql := sql + ' where id=' + edtId.Text;

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
    rdlPago2.Checked := false;

    frmOrcamento.GetOrcamentos;
    Close;
  end;
end;

procedure TfrmOrcamentoAlterar.rdlPagoClick(Sender: TObject);
begin
  rdlPago2.Checked := false;
end;

procedure TfrmOrcamentoAlterar.rdlPago2Click(Sender: TObject);
begin
  rdlPago.Checked := false;
end;

procedure TfrmOrcamentoAlterar.rvRelPrint(Sender: TObject);
var sql : string;
begin
  sql := 'SELECT cliente.nome as [Cliente], cliente.cpf as [CPF], cliente.telefone as [Telefone] ,';
  sql := sql + ' orcamento.Veiculo as [Veiculo], orcamento.Ano as [Ano Veiculo] , orcamento.Placa as [Placa], ';
  sql := sql + ' orcamento.km as [km] ,';
  sql := sql + ' orcamento.dataInicio, orcamento.dataFim, orcamento.Pago, ';
  sql := sql + ' orcamento.obs, (select sum(valor) from itemOrcamento where idOrcamento = orcamento.id ) as [Valor Total] ';
  sql := sql + ' FROM orcamento INNER JOIN cliente ON orcamento.idCliente = cliente.id';
  sql := sql + ' where orcamento.id = ' + edtId.Text;

  ADODataSetRel.Active := false;
  ADODataSetRel.CommandText := sql;
  ADODataSetRel.Active := true;

  try
    if not ADODataSetRel.Eof then
    begin
      rvRel.BaseReport.Println( '       ==========================================================================================' );
      rvRel.BaseReport.Println( '          Cliente:  ' + ADODataSetRel.Fields[0].AsString );
      rvRel.BaseReport.Println( '          CPF:      ' + ADODataSetRel.Fields[1].AsString );
      rvRel.BaseReport.Println( '          Telefone: ' + ADODataSetRel.Fields[2].AsString );
      rvRel.BaseReport.Println( '       ==========================================================================================' );
      rvRel.BaseReport.Println( '          Veículo:  ' + ADODataSetRel.Fields[3].AsString + '  Ano:  ' + ADODataSetRel.Fields[4].AsString );
      rvRel.BaseReport.Println( '          Placa:    ' + ADODataSetRel.Fields[5].AsString );
      rvRel.BaseReport.Println( '          Km:       ' + ADODataSetRel.Fields[6].AsString );
      rvRel.BaseReport.Println( '       ==========================================================================================' );
      rvRel.BaseReport.Println( '          Data Entrada:   ' + ADODataSetRel.Fields[7].AsString );
      rvRel.BaseReport.Println( '          Data Entrega:   ' + ADODataSetRel.Fields[8].AsString );
      rvRel.BaseReport.Println( '          Orçamento Pago: ' + ADODataSetRel.Fields[9].AsString );
      rvRel.BaseReport.Println( '       ==========================================================================================' );
      rvRel.BaseReport.Println( '          Itens: ');

      sql := 'SELECT descricao, valor from itemOrcamento where idOrcamento = ' + edtId.Text;

      ADODataSetRelItens.Active := false;
      ADODataSetRelItens.CommandText := sql;
      ADODataSetRelItens.Active := true;

      while not ADODataSetRelItens.Eof do
      begin
         rvRel.BaseReport.Println( '       ------------------------------------------------------------------------------------------' );
         rvRel.BaseReport.Println( '          Descrição:   ' + ADODataSetRelItens.Fields[0].AsString );
         rvRel.BaseReport.Println( '          Valor: R$ ' + FormatCurr('0.00', strToCurr(ADODataSetRelItens.Fields[1].AsString) ) );
         ADODataSetRelItens.Next;
      end;

      rvRel.BaseReport.Println( '       ------------------------------------------------------------------------------------------' );

      if trim( ADODataSetRel.Fields[11].AsString ) <> '' then
      begin
        rvRel.BaseReport.Println( '         ');
        rvRel.BaseReport.Println( '          Valor Total:    R$ ' + FormatCurr('0.00', strToCurr(ADODataSetRel.Fields[11].AsString) )  );
      end;

      rvRel.BaseReport.Println( '       ==========================================================================================' );
      rvRel.BaseReport.Println( '          Observação: ');
      rvRel.BaseReport.Println( '          ' + ADODataSetRel.Fields[10].AsString );
      rvRel.BaseReport.Println( '       ==========================================================================================' );



    end;
  finally
  end;
end;

procedure TfrmOrcamentoAlterar.btnImprimirClick(Sender: TObject);
begin
  rvRel.Execute;
end;

procedure TfrmOrcamentoAlterar.edtPlacaExit(Sender: TObject);
begin
  edtPlaca.Text := UpperCase( edtPlaca.Text );
end;

procedure TfrmOrcamentoAlterar.edtValorItemKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key in ['0'..'9','.',#8]=false then
  key:=#13;
end;

procedure TfrmOrcamentoAlterar.maskKmKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key in ['0'..'9',#8]=false then
    key:=#13;
end;

procedure TfrmOrcamentoAlterar.edtPlacaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key in ['a' .. 'z', '0'..'9',#8] then
    Key:=UpCase( Key )
  else
    key:=#13;
end;

procedure TfrmOrcamentoAlterar.rvRelPrintHeader(Sender: TObject);
begin
   rvRel.BaseReport.Println( ' ' );
   rvRel.BaseReport.Println( ' ' );
   rvRel.BaseReport.Println( ' ' );
   rvRel.BaseReport.Println( ' ' );
   rvRel.BaseReport.Println( '                                                ::: DATA EMISSÃO DO ORÇAMENTO ' + dateToStr(date) + ' :::' );
   rvRel.BaseReport.Println( ' ' );
end;

procedure TfrmOrcamentoAlterar.edtVeiculoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key:=UpCase( Key )
end;

procedure TfrmOrcamentoAlterar.edtServicoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key:=UpCase( Key )
end;

procedure TfrmOrcamentoAlterar.btPesqClick(Sender: TObject);
begin
  frmClientes.edtBusc.Text := '2';
  frmClientes.DBGridCliente.Hint:= 'De um duplo clique no registro para selecionar o cliente';
  frmClientes.ShowModal;
end;

procedure TfrmOrcamentoAlterar.btGravarClick(Sender: TObject);
var
  sql : string;
  pago : string;
  valido : boolean;
begin
  if rdlPago.Checked then pago := rdlPago.Caption;
  if rdlPago2.Checked then pago := rdlPago2.Caption;
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
    sql := 'update orcamento set idcliente=' + edtIdCliente.Text + ', veiculo="' + edtVeiculo.Text + '"';
    sql := sql + ', ano=' + maskAno.Text + ', km=' + trim( maskKm.Text ) + ', placa="' + edtPlaca.Text + '"';
    sql := sql + ', dataInicio="' + DateToStr( dtDateEntrada.Date ) + '", dataFim="' + DateToStr( dtDateSaida.Date ) + '"';
    sql := sql + ', pago="' + pago + '", obs="' + memoObs.Text + '"';
    sql := sql + ' where id=' + edtId.Text;

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
    rdlPago2.Checked := false;

    frmOrcamento.GetOrcamentos;
    Close;
  end;
end;

procedure TfrmOrcamentoAlterar.btSairClick(Sender: TObject);
begin
  frmOrcamento.GetOrcamentos;
  Close;
end;

procedure TfrmOrcamentoAlterar.btImprimirClick(Sender: TObject);
begin
  rvRel.Execute;
end;

procedure TfrmOrcamentoAlterar.btSalvSerClick(Sender: TObject);
var
  sql : string;
  active : boolean;
begin
  active := true;
  
  if trim(edtServico.Text) = '' then
  begin
    MessageDlg('Digite o Serviço.',mtinformation, [mbOK], 0);
    edtServico.SetFocus;
    active := false;
  end;

  if (trim(edtValorItem.Text) = '') or (trim(edtValorItem.Text) = '0.00') then
  begin
    MessageDlg('Digite o Valor',mtinformation, [mbOK], 0);
    edtValorItem.SetFocus;
    active := false;
  end;

  if active then
  begin
    sql := 'insert into itemOrcamento( descricao, idOrcamento, valor )values(';
    sql := sql + '"' + edtServico.Text + '", ' + edtId.Text + ',';
    sql := sql + '' + edtValorItem.Text + ' )';

    ADOCommand.CommandText := sql;
    ADOCommand.Execute;

    edtServico.Text := '';
    edtValorItem.Text := '0.00';

    GetItens;
  end;

end;

procedure TfrmOrcamentoAlterar.btDelSerClick(Sender: TObject);
var
 buttonSelected : Integer;

begin
  buttonSelected := MessageDlg('Confirma exclusão do item',mtConfirmation, mbOKCancel, 0);

  if buttonSelected = mrOK then
  begin
    ADOCommand.CommandText := 'delete * from itemOrcamento where id= ' + DBGridItens.Fields[0].AsString + '';
    ADOCommand.Execute;
    GetItens;
  end

end;

procedure TfrmOrcamentoAlterar.DBGridItensDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  DBGridItens.Canvas.Brush.Color := clSkyBlue;
  DBGridItens.Canvas.FillRect(Rect);
  DBGridItens.DefaultDrawDataCell(Rect,Field,State);
end;

end.
