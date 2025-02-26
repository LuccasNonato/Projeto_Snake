object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 186
    Top = 27
    Width = 72
    Height = 15
    Caption = 'Profundidade'
  end
  object Label2: TLabel
    Left = 222
    Top = 75
    Width = 36
    Height = 15
    Caption = 'Subida'
  end
  object Label3: TLabel
    Left = 217
    Top = 128
    Width = 41
    Height = 15
    Caption = 'Descida'
  end
  object EditProfundidade: TEdit
    Left = 264
    Top = 24
    Width = 121
    Height = 23
    NumbersOnly = True
    TabOrder = 0
  end
  object EditSubida: TEdit
    Left = 264
    Top = 72
    Width = 121
    Height = 23
    NumbersOnly = True
    TabOrder = 1
  end
  object EditDescida: TEdit
    Left = 264
    Top = 120
    Width = 121
    Height = 23
    NumbersOnly = True
    TabOrder = 2
  end
  object Button1: TButton
    Left = 280
    Top = 160
    Width = 97
    Height = 25
    Caption = 'Sair do Buraco'
    TabOrder = 3
    OnClick = Button1Click
  end
  object MemoLog: TMemo
    Left = 0
    Top = 208
    Width = 624
    Height = 233
    Align = alBottom
    ScrollBars = ssBoth
    TabOrder = 4
  end
end
