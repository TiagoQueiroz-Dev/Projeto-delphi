unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.IBBase, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TTransacao = TFDTransaction;
  TQuery = TFDQuery;

  TDM = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    FireConexao: TFDConnection;
    FireDriver: TFDPhysFBDriverLink;
    function GetTransaction: TTransacao;
    function GetQuery(pTransaction: TTransacao): TQuery;
    { }
    procedure FreeTransaction(pTransaction: TTransacao);
    procedure FreeQuery(pQuery: TQuery);
    destructor Destroy; override;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses funcoes;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  vBanco: String;
  vServidor: String;
  vPorta: String;
begin
  vBanco := TFuncoes.LerIni('GERAL', 'BANCO', 'C:\projetos\banco\');
  vServidor := TFuncoes.LerIni('GERAL', 'SERVIDOR', '127.0.0.1');
  vPorta := TFuncoes.LerIni('GERAL', 'PORTA', '3050');

  FireDriver := TFDPhysFBDriverLink.Create(nil);
  FireConexao := TFDConnection.Create(nil);

  FireDriver.DriverID := 'FB';
  FireDriver.VendorLib :=
    'C:\Program Files\Firebird\Firebird_2_5\WOW64\fbclient.dll';

  FireConexao.Params.DriverID := 'FB';
  FireConexao.Params.Database := vBanco + 'LOCADORA.FDB';
  FireConexao.Params.UserName := 'PROTEGIDO';
  FireConexao.Params.Password := '1234';
  FireConexao.Params.Add('Host=' + vServidor);
  FireConexao.Params.Add('Port=' + vPorta);
  FireConexao.Connected := true;
end;

{ TConexao }

procedure TDM.FreeQuery(pQuery: TQuery);
begin
  pQuery.Free;
end;

procedure TDM.FreeTransaction(pTransaction: TTransacao);
begin
  pTransaction.Free;
end;

function TDM.GetQuery(pTransaction: TTransacao): TQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := FireConexao;
  Result.Transaction := pTransaction;
end;

function TDM.GetTransaction: TTransacao;
begin
  Result := TFDTransaction.Create(nil);
  Result.Connection := FireConexao;
  Result.Options.AutoCommit := false;
  Result.Options.AutoStart := false;
  Result.Options.AutoStop := false;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  FireConexao.Free;
  FireDriver.Free;
end;

destructor TDM.Destroy;
begin

  inherited;
end;

end.
