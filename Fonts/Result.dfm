object FResult: TFResult
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FResult'
  ClientHeight = 286
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  RoundedCorners = rcOn
  TextHeight = 15
  object grResult: TDBGrid
    Left = 23
    Top = 23
    Width = 525
    Height = 217
    DrawingStyle = gdsGradient
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btSelecionar: TButton
    Left = 248
    Top = 246
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    TabOrder = 1
    OnClick = btSelecionarClick
  end
end
