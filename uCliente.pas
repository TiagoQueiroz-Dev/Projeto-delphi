unit uCliente;

interface

uses uDM;

type
  TPessoa = class
  private
    FTipoPessoa: String;
    FFantasia: String;
    FBairro: String;
    FCodCli: integer;
    FUF: String;
    FNomeRazaoSocial: String;
    FCEP: String;
    FCPFCNPJ: String;
    FNumero: String;
    FCidade: String;
    FEndereco: String;
    procedure SetBairro(const Value: String);
    procedure SetCEP(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetCodCli(const Value: integer);
    procedure SetCPFCNPJ(const Value: String);
    procedure SetEndereco(const Value: String);
    procedure SetFantasia(const Value: String);
    procedure SetNomeRazaoSocial(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetTipoPessoa(const Value: String);
    procedure SetUF(const Value: String);
  published
    property CodCli: integer read FCodCli write SetCodCli;
    property TipoPessoa: String read FTipoPessoa write SetTipoPessoa;
    property CPFCNPJ: String read FCPFCNPJ write SetCPFCNPJ;
    property NomeRazaoSocial: String read FNomeRazaoSocial
      write SetNomeRazaoSocial;
    property Fantasia: String read FFantasia write SetFantasia;
    property Endereco: String read FEndereco write SetEndereco;
    property Bairro: String read FBairro write SetBairro;
    property Cidade: String read FCidade write SetCidade;
    property UF: String read FUF write SetUF;
    property CEP: String read FCEP write SetCEP;
    property Numero: String read FNumero write SetNumero;
  end;

  TCliente = class
  private
  public
    Pessoa: TPessoa;
    class function pesquisar(ptransacao: TTransacao): TQuery;
    function Salvar: boolean;
    Constructor Create;
    Destructor Destroy; override;
  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  Pessoa := TPessoa.Create;
end;

destructor TCliente.Destroy;
begin
  Pessoa.Free;
  inherited;
end;

class function TCliente.pesquisar(ptransacao: TTransacao): TQuery;
begin
  result := DM.GetQuery(ptransacao);
  result.SQL.Add('select * from clientes');
  result.Open();
end;

function TCliente.Salvar: boolean;
var
  vTransacao: TTransacao;
  vQuery: TQuery;
begin
  vTransacao := DM.GetTransaction;
  vQuery := DM.GetQuery(vTransacao);
  vTransacao.StartTransaction;
  with vQuery do
  begin
    SQL.Add('INSERT INTO clientes VALUES (gen_id(gen_clientes,0),:TipoPessoa,:CPFCNPJ,:NomeRazaosocial,:Fantasia,:Endereco,:Bairro,:Cidade,:UF,:CEP,:n,:Numero);');
    ParamByName('NomeRazaosocial').AsString := Pessoa.NomeRazaoSocial;
    ParamByName('CPFCNPJ').AsString := Pessoa.CPFCNPJ;
    ParamByName('Endereco').AsString := Pessoa.Endereco;
    ParamByName('TipoPessoa').AsString := Pessoa.TipoPessoa;
    ParamByName('Bairro').AsString := Pessoa.Bairro;
    ParamByName('UF').AsString := Pessoa.UF;
    ParamByName('CEP').AsString := Pessoa.CEP;
    ParamByName('CPFCNPJ').AsString := Pessoa.CPFCNPJ;
    ParamByName('Cidade').AsString := Pessoa.Cidade;
    ParamByName('Numero').AsString := Pessoa.Numero;
    ExecSQL;
    vTransacao.Commit;
  end;

  result := true;
end;

{ TPessoa }

procedure TPessoa.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TPessoa.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TPessoa.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TPessoa.SetCodCli(const Value: integer);
begin
  FCodCli := Value;
end;

procedure TPessoa.SetCPFCNPJ(const Value: String);
begin
  FCPFCNPJ := Value;
end;

procedure TPessoa.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TPessoa.SetFantasia(const Value: String);
begin
  FFantasia := Value;
end;

procedure TPessoa.SetNomeRazaoSocial(const Value: String);
begin
  FNomeRazaoSocial := Value;
end;

procedure TPessoa.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

procedure TPessoa.SetTipoPessoa(const Value: String);
begin
  FTipoPessoa := Value;
end;

procedure TPessoa.SetUF(const Value: String);
begin
  FUF := Value;
end;

end.
