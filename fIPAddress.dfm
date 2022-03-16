object frmIP: TfrmIP
  Left = 0
  Top = 0
  ActiveControl = edtIP
  AutoSize = True
  Caption = 'IP Address - Regular Expressions'
  ClientHeight = 238
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 10
  Padding.Top = 10
  Padding.Right = 10
  Padding.Bottom = 10
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnFindIP: TSpeedButton
    Left = 13
    Top = 203
    Width = 75
    Height = 25
    Caption = 'Find IP'
    OnClick = btnFindIPClick
  end
  object btnIPsOnly: TSpeedButton
    Left = 94
    Top = 203
    Width = 75
    Height = 25
    Caption = 'IPs Only'
    OnClick = btnIPsOnlyClick
  end
  object btnMaskIPs: TSpeedButton
    Left = 175
    Top = 203
    Width = 75
    Height = 25
    Caption = 'Mask IPs'
    OnClick = btnMaskIPsClick
  end
  object edtIP: TEdit
    Left = 10
    Top = 10
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '192.168.1.1'
    OnChange = edtIPChange
  end
  object edtIP2: TEdit
    Left = 10
    Top = 37
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '192.168.1.256'
    OnChange = edtIPChange
  end
  object btnResetMemo: TButton
    Left = 10
    Top = 67
    Width = 75
    Height = 25
    Caption = 'Reset Memo'
    TabOrder = 2
    OnClick = btnResetMemoClick
  end
  object Memo1: TMemo
    Left = 13
    Top = 98
    Width = 569
    Height = 99
    HideSelection = False
    Lines.Strings = (
      'Memo2')
    TabOrder = 3
  end
end
