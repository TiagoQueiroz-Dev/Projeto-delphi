inherited FrmListarClientes: TFrmListarClientes
  Caption = 'FrmListarClientes'
  ClientHeight = 442
  ClientWidth = 628
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  inherited pnlCentral: TPanel
    Width = 628
    Height = 401
    inherited Grid: TDBGrid
      OnCellClick = GridCellClick
    end
  end
  inherited pnlButton: TPanel
    Top = 401
    Width = 628
    inherited btnFechar: TButton
      ExplicitLeft = 508
    end
    inherited btnEditar: TButton
      ExplicitLeft = 412
    end
    inherited btnExcluir: TButton
      ExplicitLeft = 316
    end
    inherited btnQuatro: TButton
      Left = 0
      ExplicitLeft = -4
    end
  end
  inherited acGeral: TActionList
    Left = 448
    Top = 40
    inherited acEditar: TAction
      OnExecute = acEditarExecute
    end
    inherited acIncluir: TAction
      OnExecute = acIncluirExecute
    end
  end
end
