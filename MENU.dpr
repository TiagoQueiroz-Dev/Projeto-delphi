program MENU;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  uFrmCadastrocliente in 'uFrmCadastrocliente.pas' {FrmCadastroclientes},
  uFrmBaseGrid in 'uFrmBaseGrid.pas' {frmBaseGrid},
  uFrmBaseCad in 'uFrmBaseCad.pas' {frmBaseCad},
  uFrmListarClientes in 'uFrmListarClientes.pas' {FrmListarClientes},
  uCliente in 'uCliente.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  uFmrCadCliente in 'uFmrCadCliente.pas' {frmCadCliente},
  Vcl.Themes,
  Vcl.Styles,
  uFrmEditarCliente in 'uFrmEditarCliente.pas' {frmEditarCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
