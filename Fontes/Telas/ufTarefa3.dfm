object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'Tarefa 3'
  ClientHeight = 363
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnTela: TPanel
    Left = 0
    Top = 0
    Width = 569
    Height = 363
    Align = alClient
    TabOrder = 0
    object lbTotal: TLabel
      Left = 416
      Top = 247
      Width = 40
      Height = 13
      Caption = 'Total R$'
    end
    object lbTotalDivisoes: TLabel
      Left = 416
      Top = 295
      Width = 81
      Height = 13
      Caption = 'Total divis'#245'es R$'
    end
    object edTotal: TEdit
      Left = 416
      Top = 266
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object grGridValores: TDBGrid
      Left = 24
      Top = 8
      Width = 513
      Height = 233
      DrawingStyle = gdsClassic
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'idProjeto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeProjeto'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Width = 70
          Visible = True
        end>
    end
    object btObterTotal: TButton
      Left = 320
      Top = 264
      Width = 75
      Height = 25
      Caption = 'Obter total'
      TabOrder = 2
      OnClick = btObterTotalClick
    end
    object btObterDivisao: TButton
      Left = 288
      Top = 312
      Width = 107
      Height = 25
      Caption = 'Obter Total Divis'#245'es'
      TabOrder = 3
      OnClick = btObterDivisaoClick
    end
    object edTotalDivisoes: TEdit
      Left = 416
      Top = 314
      Width = 121
      Height = 21
      TabOrder = 4
    end
  end
end
