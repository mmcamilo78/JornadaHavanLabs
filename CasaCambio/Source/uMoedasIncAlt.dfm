object frmMoedasIncAlt: TfrmMoedasIncAlt
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Moedas de C'#226'mbio -'
  ClientHeight = 285
  ClientWidth = 470
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 18
    Top = 32
    Width = 83
    Height = 13
    Caption = 'C'#243'digo da Moeda'
  end
  object Label3: TLabel
    Left = 65
    Top = 96
    Width = 36
    Height = 13
    Caption = 'S'#237'mbolo'
  end
  object Label4: TLabel
    Left = 22
    Top = 128
    Width = 77
    Height = 13
    Caption = 'Nome da Moeda'
  end
  object Label5: TLabel
    Left = 44
    Top = 160
    Width = 55
    Height = 13
    Caption = 'C'#243'digo Pa'#237's'
  end
  object Label6: TLabel
    Left = 33
    Top = 192
    Width = 64
    Height = 13
    Caption = 'Nome do Pa'#237's'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 216
    Width = 449
    Height = 9
    Shape = bsTopLine
  end
  object Label9: TLabel
    Left = 31
    Top = 64
    Width = 70
    Height = 13
    Caption = 'Tipo da Moeda'
  end
  object edtCodigo: TEdit
    Left = 112
    Top = 24
    Width = 49
    Height = 19
    NumbersOnly = True
    TabOrder = 0
    OnEnter = edtCodigoEnter
    OnExit = edtCodigoExit
  end
  object edtSimbolo: TEdit
    Left = 112
    Top = 88
    Width = 49
    Height = 19
    CharCase = ecUpperCase
    Color = clWhite
    MaxLength = 10
    TabOrder = 2
    OnEnter = edtSimboloEnter
    OnExit = edtSimboloExit
  end
  object edtNome: TEdit
    Left = 112
    Top = 120
    Width = 337
    Height = 19
    CharCase = ecUpperCase
    Color = clWhite
    MaxLength = 60
    TabOrder = 3
  end
  object btnGravar: TButton
    Left = 208
    Top = 232
    Width = 113
    Height = 41
    Caption = '&Gravar'
    TabOrder = 6
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 328
    Top = 232
    Width = 121
    Height = 41
    Caption = '&Cancelar'
    TabOrder = 7
    OnClick = btnCancelarClick
  end
  object edtCodPais: TEdit
    Left = 112
    Top = 152
    Width = 65
    Height = 19
    CharCase = ecUpperCase
    Color = clWhite
    MaxLength = 6
    NumbersOnly = True
    TabOrder = 4
  end
  object edtNomPais: TEdit
    Left = 112
    Top = 184
    Width = 337
    Height = 19
    CharCase = ecUpperCase
    Color = clWhite
    MaxLength = 40
    TabOrder = 5
  end
  object cbbTipo: TComboBox
    Left = 112
    Top = 56
    Width = 49
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    Items.Strings = (
      'A'
      'B')
  end
  object gbxAjuda: TGroupBox
    Left = 184
    Top = 16
    Width = 265
    Height = 94
    Caption = 'Tipo da Moeda'
    TabOrder = 8
    Visible = False
    object lblLinha1: TLabel
      Left = 8
      Top = 21
      Width = 250
      Height = 31
      AutoSize = False
      Caption = 
        'Tipo A - Moeda cuja paridade '#233' expressa em quantidade de moeda p' +
        'or uma unidade de d'#243'lar.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblLinha2: TLabel
      Left = 8
      Top = 56
      Width = 250
      Height = 31
      AutoSize = False
      Caption = 
        'Tipo B: Moeda cuja paridade '#233' expressa em quantidade de d'#243'lar, p' +
        'or uma unidade de moeda.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
  end
end
