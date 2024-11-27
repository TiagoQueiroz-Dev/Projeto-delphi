program MENU;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  uFrmCadastrocliente in 'uFrmCadastrocliente.pas' {FrmCadastroclientes},
  uFrmBaseGrid in 'uFrmBaseGrid.pas' {frmBaseGrid},
  uFrmBaseCad in 'uFrmBaseCad.pas' {frmBaseCad},
  uFrmListarClientes in 'uFrmListarClientes.pas' {FrmListarClientes},
  uCliente in 'uCliente.pas',
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
