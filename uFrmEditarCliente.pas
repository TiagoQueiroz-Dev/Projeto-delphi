unit uFrmEditarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFmrCadCliente, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uDM;

type
  TfrmEditarCliente = class(TfrmCadCliente)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Abrir(ID: integer);
    procedure CarregarCliente(ID: integer);
    procedure CarregarDados;

  var
    Ftransacao: TTransacao;
    Fquery: TQuery;
    Fid: integer;
  end;

var
  frmEditarCliente: TfrmEditarCliente;

implementation

{$R *.dfm}
{ TfrmCadCliente1 }

procedure TfrmEditarCliente.Abrir(ID: integer);
begin
  if not Assigned(frmEditarCliente) then
    Application.CreateForm(TfrmEditarCliente, frmEditarCliente);
  try
           Fid := ID;
    frmEditarCliente.ShowModal;

  finally
    FreeAndNil(frmEditarCliente);
  end;

end;

procedure TfrmEditarCliente.CarregarCliente(ID: integer);
begin
  with Fquery do
  begin
    sql.Clear;
    sql.Add('SELECT * FROM clientes WHERE cod_cliente =' + inttostr(ID));
    open;
    rdgTipoPessoa.ItemIndex := 0;
    edtCPF_CNPJ.Text := FieldByName('CPF_CNPJ').AsString;
    edtNome.Text := FieldByName('NOME_RAZAO_SOCIAL').AsString;
    edtEndereco.Text := FieldByName('ENDERECO').AsString;
    edtBairro.Text := FieldByName('BAIRRO').AsString;
    edtCidade.Text := FieldByName('CIDADE').AsString;
    edtUF.Text := FieldByName('UF').AsString;
    edtNumero.Text := FieldByName('NUMERO').AsString;
    close;
  end;
end;

procedure TfrmEditarCliente.CarregarDados;
begin
  Ftransacao := DM.GetTransaction;
  Ftransacao.StartTransaction;
  Fquery := DM.GetQuery(Ftransacao);
end;

procedure TfrmEditarCliente.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarDados;
  CarregarCliente(Fid);
end;

end.
