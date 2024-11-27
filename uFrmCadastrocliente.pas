unit uFrmCadastrocliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFrmCadastroclientes = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure abrir;
  end;

var
  FrmCadastroclientes: TFrmCadastroclientes;

implementation

{$R *.dfm}
{ TFrmCadastroclientes }

class procedure TFrmCadastroclientes.abrir;
begin
  if not Assigned(FrmCadastroclientes) then
    Application.CreateForm(TFrmCadastroclientes, FrmCadastroclientes);
  with FrmCadastroclientes do
    try
      ShowModal;
    finally
      FreeAndNil(FrmCadastroclientes);
    end;
end;

end.
