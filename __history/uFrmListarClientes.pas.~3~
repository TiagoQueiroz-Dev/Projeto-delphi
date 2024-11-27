unit uFrmListarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmBaseGrid, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,uDM,uCliente;

type
  TFrmListarClientes = class(TfrmBaseGrid)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure abrir;
    var
    Ftransacao: TTransacao;
    Fquery: TQuery;


  end;

var
  FrmListarClientes: TFrmListarClientes;

implementation

{$R *.dfm}
{ TFrmListarClientes }

class procedure TFrmListarClientes.abrir;
begin
  if not Assigned(FrmListarClientes) then
    Application.CreateForm(TFrmListarClientes, FrmListarClientes);
  with FrmListarClientes do
    try
      ShowModal;
    finally
      FreeAndNil(FrmListarClientes);
    end;
end;

procedure TFrmListarClientes.FormCreate(Sender: TObject);

begin
  inherited;
            Ftransacao := DM.GetTransaction;
            Ftransacao.StartTransaction;
            Fquery := TCliente.pesquisar(Ftransacao);
            dsDados.DataSet := Fquery;
end;

end.
