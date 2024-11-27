unit uCliente;

interface

uses uDM;

type
  TCliente = class
  private
  public
    class function pesquisar(ptransacao: TTransacao): TQuery;
  end;

implementation

{ TCliente }

class function TCliente.pesquisar(ptransacao: TTransacao): TQuery;
begin
       result := DM.GetQuery(ptransacao);
       result.SQL.Add('select * from clientes');
       result.Open();
end;

end.
