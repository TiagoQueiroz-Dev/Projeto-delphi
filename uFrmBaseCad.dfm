object frmBaseCad: TfrmBaseCad
  Left = 0
  Top = 0
  Caption = 'frmBaseCad'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlButton: TPanel
    Left = 0
    Top = 401
    Width = 628
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 400
    ExplicitWidth = 624
    object btnCancelar: TButton
      Left = 440
      Top = 6
      Width = 75
      Height = 25
      Action = acCancelar
      TabOrder = 0
    end
    object btnOk: TButton
      Left = 536
      Top = 6
      Width = 75
      Height = 25
      Action = acOk
      TabOrder = 1
    end
  end
  object pnlCentral: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 401
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = -6
  end
  object acGeral: TActionList
    Left = 448
    Top = 72
    object acCancelar: TAction
      Caption = 'Cancelar'
    end
    object acOk: TAction
      Caption = 'Ok'
    end
  end
end
