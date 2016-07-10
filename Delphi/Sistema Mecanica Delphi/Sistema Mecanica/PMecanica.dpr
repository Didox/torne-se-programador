program PMecanica;

uses
  Forms,
  UFormMain in 'UFormMain.pas' {frmMain},
  UPrincip in 'UPrincip.pas' {frmPrincip},
  UClientes in 'UClientes.pas' {frmClientes},
  USalvarCliente in 'USalvarCliente.pas' {frmIncluirCliente},
  UAlterarCliente in 'UAlterarCliente.pas' {frmAlterarCliente},
  UOS in 'UOS.pas' {frmOrcamento},
  UNovaOs in 'UNovaOs.pas' {frmNovoOrcamento},
  UBusCliente in 'UBusCliente.pas' {frmBusCliente},
  UAlterOS in 'UAlterOS.pas' {frmOrcamentoAlterar};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincip, frmPrincip);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TfrmIncluirCliente, frmIncluirCliente);
  Application.CreateForm(TfrmAlterarCliente, frmAlterarCliente);
  Application.CreateForm(TfrmOrcamento, frmOrcamento);
  Application.CreateForm(TfrmNovoOrcamento, frmNovoOrcamento);
  Application.CreateForm(TfrmBusCliente, frmBusCliente);
  Application.CreateForm(TfrmOrcamentoAlterar, frmOrcamentoAlterar);
  Application.Run;
end.
