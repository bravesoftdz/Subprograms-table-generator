object TableGenForm: TTableGenForm
  Left = 0
  Top = 0
  Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1090#1072#1073#1083#1080#1094#1099' '#1087#1086#1076#1087#1088#1086#1075#1088#1072#1084#1084
  ClientHeight = 449
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object memoInpCode: TMemo
    Left = 0
    Top = 0
    Width = 353
    Height = 368
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object StringGrid1: TStringGrid
    Left = 352
    Top = 0
    Width = 363
    Height = 449
    DoubleBuffered = False
    FixedCols = 0
    FixedRows = 0
    ParentDoubleBuffered = False
    ScrollBars = ssVertical
    TabOrder = 1
    ColWidths = (
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 368
    Width = 715
    Height = 81
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    Ctl3D = False
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 2
    object btnToExcel: TButton
      Left = 362
      Top = 0
      Width = 353
      Height = 81
      Align = alCustom
      Caption = #1074' Excel'
      TabOrder = 0
      OnClick = btnToExcelClick
    end
    object btnGenTable: TButton
      Left = 0
      Top = 0
      Width = 363
      Height = 81
      Align = alCustom
      Caption = #1055#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1090#1100
      TabOrder = 1
      OnClick = btnGenTableClick
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 312
    Top = 168
  end
  object MainMenu1: TMainMenu
    Left = 432
    Top = 152
    object mnFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object mniConver: TMenuItem
        Caption = #1055#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1090#1100
        OnClick = mniConverClick
      end
      object mnToExcel: TMenuItem
        Caption = #1042' Excel'
        OnClick = mnToExcelClick
      end
    end
    object mnClear: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1090#1077#1082#1089#1090#1086#1074#1086#1077' '#1087#1086#1083#1077
      OnClick = mnClearClick
    end
    object mnSupport: TMenuItem
      Caption = #1055#1086#1076#1076#1077#1088#1078#1072#1090#1100
      OnClick = mnSupportClick
    end
  end
end
