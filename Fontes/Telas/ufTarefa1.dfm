object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  Caption = 'Tarefa 1'
  ClientHeight = 299
  ClientWidth = 637
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
  object pnTela: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 299
    Align = alClient
    TabOrder = 0
    object lbColuna: TLabel
      Left = 24
      Top = 5
      Width = 42
      Height = 13
      Caption = 'Colunas:'
    end
    object lbCondicoes: TLabel
      Left = 375
      Top = 5
      Width = 53
      Height = 13
      Caption = 'Condi'#231#245'es:'
    end
    object lbSQL: TLabel
      Left = 24
      Top = 128
      Width = 61
      Height = 13
      Caption = 'SQL Gerado:'
    end
    object lbTabela: TLabel
      Left = 199
      Top = 5
      Width = 36
      Height = 13
      Caption = 'Tabela:'
    end
    object btGeraSQL: TButton
      Left = 542
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Gera SQL'
      TabOrder = 3
      OnClick = btGeraSQLClick
    end
    object mmColuna: TMemo
      Left = 24
      Top = 24
      Width = 155
      Height = 89
      TabOrder = 0
    end
    object mmCondicoes: TMemo
      Left = 375
      Top = 24
      Width = 155
      Height = 89
      TabOrder = 2
    end
    object mmSQL: TMemo
      Left = 24
      Top = 146
      Width = 593
      Height = 144
      ReadOnly = True
      TabOrder = 4
    end
    object mmTabela: TMemo
      Left = 199
      Top = 24
      Width = 155
      Height = 89
      TabOrder = 1
    end
  end
  object spQuery1: TspQuery
    Left = 600
    Top = 104
  end
end
