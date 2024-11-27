unit uFrmListarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmBaseGrid, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, uDM, uCliente, System.Actions,
  Vcl.ActnList, uFmrCadCliente, uFrmEditarCliente;

type
  TFrmListarClientes = class(TfrmBaseGrid)
    procedure FormCreate(Sender: TObject);
    procedure acIncluirExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure abrir;
    procedure CarregarDados;

  var
    Ftransacao: TTransacao;
    Fquery: TQuery;
    Fid: integer;

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

procedure TFrmListarClientes.acEditarExecute(Sender: TObject);
begin
  inherited;
  frmEditarCliente.abrir(Fid);

end;

procedure TFrmListarClientes.acIncluirExecute(Sender: TObject);
begin
  inherited;
  TfrmCadCliente.abrir;
  CarregarDados;
end;

procedure TFrmListarClientes.FormCreate(Sender: TObject);

begin
  inherited;
  CarregarDados;
end;

procedure TFrmListarClientes.GridCellClick(Column: TColumn);
begin
  inherited;
  Fid := Fquery.FieldByName('COD_CLIENTE').Value;
end;

procedure TFrmListarClientes.CarregarDados;
begin
  if Assigned(Ftransacao) then
    DM.FreeTransaction(Ftransacao);
  if Assigned(Fquery) then
    DM.FreeQuery(Fquery);
  Ftransacao := DM.GetTransaction;
  Ftransacao.StartTransaction;
  Fquery := TCliente.pesquisar(Ftransacao);
  dsDados.DataSet := Fquery;
end;

end.
