object frFormPrincipal: TfrFormPrincipal
  AlignWithMargins = True
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 300
  ClientWidth = 406
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  PrintScale = poNone
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 72
    Top = 24
    object mmTarefas: TMenuItem
      Caption = 'Tarefas'
      object mmTarefas01: TMenuItem
        Caption = 'Tarefas 1'
        OnClick = mmTarefas01Click
      end
      object mmTarefas02: TMenuItem
        Caption = 'Tarefas 2'
        OnClick = mmTarefas02Click
      end
      object mmTarefas03: TMenuItem
        Caption = 'Tarefas 3'
        OnClick = mmTarefas03Click
      end
    end
  end
end
