object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  Caption = 'Tarefa 2'
  ClientHeight = 244
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 244
    Align = alClient
    TabOrder = 0
    object lbThread01: TLabel
      Left = 64
      Top = 24
      Width = 80
      Height = 13
      Caption = 'Tempo thread 1:'
    end
    object lbThread02: TLabel
      Left = 232
      Top = 24
      Width = 80
      Height = 13
      Caption = 'Tempo thread 2:'
    end
    object lbBarraThread1: TLabel
      Left = 64
      Top = 101
      Width = 47
      Height = 13
      Caption = 'Thread 1:'
    end
    object lbBarraThread2: TLabel
      Left = 64
      Top = 143
      Width = 47
      Height = 13
      Caption = 'Thread 2:'
    end
    object lbPorcThread1: TLabel
      Left = 473
      Top = 122
      Width = 17
      Height = 13
      Caption = '0%'
    end
    object lbPorcThread2: TLabel
      Left = 473
      Top = 162
      Width = 17
      Height = 13
      Caption = '0%'
    end
    object pbThread01: TProgressBar
      Left = 64
      Top = 120
      Width = 403
      Height = 17
      TabOrder = 3
    end
    object btExecutar: TButton
      Left = 392
      Top = 41
      Width = 75
      Height = 25
      Caption = 'Executar'
      TabOrder = 0
      OnClick = btExecutarClick
    end
    object edThread01: TEdit
      Left = 64
      Top = 43
      Width = 80
      Height = 21
      TabOrder = 1
    end
    object edThread02: TEdit
      Left = 232
      Top = 43
      Width = 80
      Height = 21
      TabOrder = 2
    end
    object pbThread02: TProgressBar
      Left = 64
      Top = 162
      Width = 403
      Height = 17
      TabOrder = 4
    end
  end
end
