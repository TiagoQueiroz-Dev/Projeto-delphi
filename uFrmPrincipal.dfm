object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'MENUS'
  ClientHeight = 440
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = mniPrincipal
  Position = poScreenCenter
  TextHeight = 15
  object mniPrincipal: TMainMenu
    Left = 152
    Top = 80
    object mniCadastros: TMenuItem
      Caption = 'Cadastros'
      object mniClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = mniClientesClick
      end
    end
    object mniVendas: TMenuItem
      Caption = 'Vendas'
    end
  end
end
