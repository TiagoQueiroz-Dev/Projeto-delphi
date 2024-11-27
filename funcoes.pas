unit funcoes;

interface

uses
  Inifiles, System.SysUtils;

type
  TFuncoes = class
  private
    function StripTags(Valor: String; Par: Byte; Id: Char = '|'): String;
  public
    class function LerIni(pChave: String; pItem: String; pDefault: String; pUpperCase: boolean = True;
      pCriar: boolean = True): String;
  end;

implementation

{ TFuncoes }

class function TFuncoes.LerIni(pChave, pItem, pDefault: String; pUpperCase, pCriar: boolean): String;
var
  Ini: TIniFile;
  ArquivoIni: String;
begin
  ArquivoIni := GetCurrentDir + '\setup.ini';
  Ini := TIniFile.Create(ArquivoIni);
  Result := Ini.ReadString(pChave, pItem, pDefault);
  if pUpperCase then
    Result := AnsiUpperCase(Result);
  FreeAndNil(Ini);
end;

function TFuncoes.StripTags(Valor: String; Par: Byte; Id: Char): String;
begin
  //
end;

end.
