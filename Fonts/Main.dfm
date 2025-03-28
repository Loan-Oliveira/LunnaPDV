object MainForm: TMainForm
  Left = 194
  Top = 111
  Caption = 'Lunna'
  ClientHeight = 440
  ClientWidth = 875
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  FormStyle = fsMDIForm
  VisualManager = FormTabsBar1
  Position = poDefault
  WindowState = wsMaximized
  OnShow = FormShow
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 421
    Width = 875
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    AutoHint = True
    Panels = <>
    SimplePanel = True
  end
  object tbBarraPrincipal: TToolBar
    Left = 0
    Top = 0
    Width = 875
    Height = 72
    BorderWidth = 1
    ButtonHeight = 73
    ButtonWidth = 58
    Color = clBtnFace
    Images = DataModuleLunna.Virtualizacao
    Indent = 5
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Transparent = False
    Wrapable = False
    object tbEstoque: TToolButton
      Left = 5
      Top = 0
      Caption = 'Estoque'
      DropdownMenu = pmEstoque
      ImageIndex = 3
      ImageName = 'Estoque'
      Style = tbsDropDown
      OnClick = CadastroProdutosExecute
    end
    object tbVenda: TToolButton
      Left = 78
      Top = 0
      Action = NovaVenda
      DropdownMenu = pmVenda
      ImageIndex = 4
      ImageName = 'Vendas'
      Style = tbsDropDown
    end
    object tbClientes: TToolButton
      Left = 151
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 5
      ImageName = 'Clientes'
      OnClick = tbClientesClick
    end
    object tbConfiguracao: TToolButton
      Left = 209
      Top = 0
      Caption = 'ToolButton3'
      ImageIndex = 6
      ImageName = 'Configuracao'
      OnClick = tbConfiguracaoClick
    end
  end
  object FormTabsBar1: TFormTabsBar
    Left = 0
    Top = 72
    Width = 875
    Height = 30
    ParentColor = False
    TabOptions.ShowFormIcon = True
    TabOptions.ShowFormSystemMenu = True
    TabOptions.ShowCloseButton = True
    TabOptions.ShowHintForTruncatedCaption = True
    TabMinWidth = 100
    TabMaxWidth = 250
    ShowTabsMenuButton = True
  end
  object ActionList1: TActionList
    Left = 64
    Top = 232
    object FileNew1: TAction
      Category = 'File'
      Caption = '&New'
      Hint = 'New|Create a new file'
      ImageIndex = 6
      ImageName = 'Item7'
      ShortCut = 16462
      OnExecute = FileNew1Execute
    end
    object FileOpen1: TAction
      Category = 'File'
      Caption = '&Open'
      Hint = 'Open|Open a file'
      ImageIndex = 7
      ImageName = 'Item8'
      ShortCut = 16463
      OnExecute = FileOpen1Execute
    end
    object FileClose1: TWindowClose
      Category = 'File'
      Caption = '&Close'
      Hint = 'Close|Close current file'
    end
    object FileSave1: TAction
      Category = 'File'
      Caption = '&Save'
      Hint = 'Save|Save current file'
      ImageIndex = 8
      ImageName = 'Item9'
      ShortCut = 16467
    end
    object FileSaveAs1: TAction
      Category = 'File'
      Caption = 'Save &As...'
      Hint = 'Save As|Save current file with different name'
    end
    object FileExit1: TAction
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Exit|Exit application'
      OnExecute = FileExit1Execute
    end
    object EditCut1: TEditCut
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 0
      ImageName = 'Item1'
      ShortCut = 16472
    end
    object EditCopy1: TEditCopy
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 1
      ImageName = 'Item2'
      ShortCut = 16451
    end
    object EditPaste1: TEditPaste
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 2
      ImageName = 'Item3'
      ShortCut = 16470
    end
    object WindowCascade1: TWindowCascade
      Category = 'Window'
      Caption = '&Cascade'
      Hint = 'Cascade'
      ImageIndex = 17
      ImageName = 'Item18'
      OnExecute = WindowCascade1Execute
    end
    object WindowTileHorizontal1: TWindowTileHorizontal
      Category = 'Window'
      Caption = 'Tile &Horizontally'
      Hint = 'Tile Horizontally'
      ImageIndex = 15
      ImageName = 'Item16'
      OnExecute = WindowTileHorizontal1Execute
    end
    object WindowTileVertical1: TWindowTileVertical
      Category = 'Window'
      Caption = 'Tile &Vertically'
      Hint = 'Tile Vertically'
      ImageIndex = 16
      ImageName = 'Item17'
      OnExecute = WindowTileVertical1Execute
    end
    object WindowMinimizeAll1: TWindowMinimizeAll
      Category = 'Window'
      Caption = '&Minimize All'
      Hint = 'Minimize All'
    end
    object HelpAbout1: TAction
      Category = 'Help'
      Caption = '&About...'
      Hint = 
        'About|Displays program information, version number, and copyrigh' +
        't'
      OnExecute = HelpAbout1Execute
    end
    object CadastroProdutos: TAction
      Category = 'Estoque'
      Caption = 'Cadastro de Produtos'
      OnExecute = CadastroProdutosExecute
    end
    object NovaVenda: TAction
      Category = 'Venda'
      Caption = 'Nova venda'
      OnExecute = NovaVendaExecute
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = CadastroProdutos
              end>
            Caption = '&Estoque'
          end
          item
            Items = <
              item
                Action = FileNew1
                ImageIndex = 6
                ImageName = 'Item7'
                ShortCut = 16462
              end
              item
                Action = FileOpen1
                ImageIndex = 7
                ImageName = 'Item8'
                ShortCut = 16463
              end
              item
                Action = FileClose1
              end
              item
                Action = FileSave1
                ImageIndex = 8
                ImageName = 'Item9'
                ShortCut = 16467
              end
              item
                Action = FileSaveAs1
              end
              item
                Action = FileExit1
              end>
            Caption = '&File'
          end
          item
            Items = <
              item
                Action = EditCut1
                ImageIndex = 0
                ImageName = 'Item1'
                ShortCut = 16472
              end
              item
                Action = EditCopy1
                ImageIndex = 1
                ImageName = 'Item2'
                ShortCut = 16451
              end
              item
                Action = EditPaste1
                ImageIndex = 2
                ImageName = 'Item3'
                ShortCut = 16470
              end>
            Caption = 'E&dit'
          end
          item
            Items = <
              item
                Action = WindowCascade1
                ImageIndex = 17
                ImageName = 'Item18'
              end
              item
                Action = WindowTileHorizontal1
                ImageIndex = 15
                ImageName = 'Item16'
              end
              item
                Action = WindowTileVertical1
                ImageIndex = 16
                ImageName = 'Item17'
              end
              item
                Action = WindowMinimizeAll1
              end>
            Caption = '&Window'
          end
          item
            Items = <
              item
                Action = HelpAbout1
              end>
            Caption = '&Help'
          end>
      end>
    LinkedActionLists = <
      item
        ActionList = ActionList1
        Caption = 'ActionList1'
      end>
    Left = 64
    Top = 296
    StyleName = 'Platform Default'
  end
  object pmEstoque: TPopupMenu
    Left = 64
    Top = 104
    object Cadastrodeprodutos1: TMenuItem
      Action = CadastroProdutos
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Cadastrodeprodutos2: TMenuItem
      Caption = 'Movimentar Estoque'
      object Entrada1: TMenuItem
        Caption = 'Entrada'
      end
      object Sada1: TMenuItem
        Caption = 'Sa'#237'da'
      end
    end
  end
  object pmVenda: TPopupMenu
    Left = 64
    Top = 160
    object MenuItem1: TMenuItem
      Action = NovaVenda
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object Devoluodevenda1: TMenuItem
      Caption = 'Devolu'#231#227'o de venda'
    end
  end
end
