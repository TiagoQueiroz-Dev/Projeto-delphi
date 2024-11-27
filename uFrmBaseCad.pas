unit uFrmBaseCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList;

type
  TfrmBaseCad = class(TForm)
    pnlButton: TPanel;
    pnlCentral: TPanel;
    btnCancelar: TButton;
    btnOk: TButton;
    acGeral: TActionList;
    acCancelar: TAction;
    acOk: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseCad: TfrmBaseCad;

implementation

{$R *.dfm}

end.
