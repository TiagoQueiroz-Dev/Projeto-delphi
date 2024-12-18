unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,uFrmCadastrocliente,
  uFrmListarClientes;

type
  TFrmPrincipal = class(TForm)
    mniPrincipal: TMainMenu;
    mniCadastros: TMenuItem;
    mniClientes: TMenuItem;
    mniVendas: TMenuItem;
    procedure mniClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.mniClientesClick(Sender: TObject);
begin
   TFrmListarClientes.abrir;
end;

end.
