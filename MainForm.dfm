object fmPrime: TfmPrime
  Left = 0
  Top = 0
  Caption = 'Prime Form'
  ClientHeight = 201
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblNumber: TLabel
    Left = 8
    Top = 20
    Width = 66
    Height = 13
    Caption = 'Enter Number'
  end
  object Label1: TLabel
    Left = 8
    Top = 120
    Width = 233
    Height = 41
    AutoSize = False
    Caption = 
      '*This program will find prime numbers from 1 to till the given n' +
      'umber by using threads*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object btnPrime: TButton
    Left = 80
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Prime Number'
    TabOrder = 0
    OnClick = btnPrimeClick
  end
  object edPrimeNumber: TEdit
    Left = 80
    Top = 17
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = edPrimeNumberKeyPress
  end
  object PrimeMemo: TMemo
    Left = 263
    Top = 0
    Width = 233
    Height = 201
    Align = alRight
    ScrollBars = ssVertical
    TabOrder = 2
    ExplicitLeft = 240
    ExplicitTop = 8
    ExplicitHeight = 161
  end
end
