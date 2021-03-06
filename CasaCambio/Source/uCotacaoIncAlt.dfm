object frmCotacaoIncAlt: TfrmCotacaoIncAlt
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cota'#231#227'o de Moedas - '
  ClientHeight = 321
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
  object Label1: TLabel
    Left = 18
    Top = 24
    Width = 81
    Height = 13
    Caption = 'Data da Cota'#231#227'o'
  end
  object Label2: TLabel
    Left = 17
    Top = 48
    Width = 83
    Height = 13
    Caption = 'C'#243'digo da Moeda'
  end
  object Label3: TLabel
    Left = 61
    Top = 96
    Width = 36
    Height = 13
    Caption = 'S'#237'mbolo'
  end
  object Label4: TLabel
    Left = 21
    Top = 120
    Width = 77
    Height = 13
    Caption = 'Nome da Moeda'
  end
  object Label5: TLabel
    Left = 35
    Top = 144
    Width = 64
    Height = 13
    Caption = 'Taxa Compra'
  end
  object Label6: TLabel
    Left = 42
    Top = 168
    Width = 57
    Height = 13
    Caption = 'Taxa Venda'
  end
  object Label7: TLabel
    Left = 17
    Top = 192
    Width = 82
    Height = 13
    Caption = 'Paridade Compra'
  end
  object Label8: TLabel
    Left = 24
    Top = 216
    Width = 75
    Height = 13
    Caption = 'Paridade Venda'
  end
  object Bevel1: TBevel
    Left = 16
    Top = 248
    Width = 441
    Height = 9
    Shape = bsTopLine
  end
  object Label9: TLabel
    Left = 79
    Top = 72
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object dtCotacao: TDateTimePicker
    Left = 112
    Top = 16
    Width = 105
    Height = 21
    Date = 44330.000000000000000000
    Time = 0.424571076386200700
    TabOrder = 0
  end
  object edtCodigo: TEdit
    Left = 112
    Top = 40
    Width = 50
    Height = 19
    NumbersOnly = True
    TabOrder = 1
    OnExit = edtCodigoExit
    OnKeyPress = edtCodigoKeyPress
  end
  object edtSimbolo: TEdit
    Left = 112
    Top = 88
    Width = 49
    Height = 19
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 3
    ReadOnly = True
    TabOrder = 9
  end
  object edtNome: TEdit
    Left = 112
    Top = 112
    Width = 337
    Height = 19
    CharCase = ecUpperCase
    Color = clBtnFace
    MaxLength = 60
    ReadOnly = True
    TabOrder = 10
  end
  object btnGravar: TButton
    Left = 216
    Top = 264
    Width = 113
    Height = 41
    Caption = '&Gravar'
    TabOrder = 7
    OnClick = btnGravarClick
  end
  object brnCancelar: TButton
    Left = 336
    Top = 264
    Width = 121
    Height = 41
    Caption = '&Cancelar'
    TabOrder = 8
    OnClick = brnCancelarClick
  end
  object edtTipo: TEdit
    Left = 112
    Top = 64
    Width = 49
    Height = 19
    Color = clBtnFace
    MaxLength = 1
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 11
  end
  object Button3: TButton
    Left = 165
    Top = 39
    Width = 25
    Height = 22
    Caption = '...'
    TabOrder = 2
    OnClick = Button3Click
  end
  object edtTxCompra: TEdit
    Left = 112
    Top = 136
    Width = 97
    Height = 19
    Alignment = taRightJustify
    TabOrder = 3
    Text = '0,0000'
    OnKeyPress = edtTxCompraKeyPress
  end
  object edtTxVenda: TEdit
    Left = 112
    Top = 160
    Width = 97
    Height = 19
    Alignment = taRightJustify
    TabOrder = 4
    Text = '0,0000'
    OnKeyPress = edtTxCompraKeyPress
  end
  object edtParCompra: TEdit
    Left = 112
    Top = 184
    Width = 97
    Height = 19
    Alignment = taRightJustify
    TabOrder = 5
    Text = '0,0000000'
    OnKeyPress = edtTxCompraKeyPress
  end
  object edtParVenda: TEdit
    Left = 112
    Top = 208
    Width = 97
    Height = 19
    Alignment = taRightJustify
    TabOrder = 6
    Text = '0,0000000'
    OnKeyPress = edtTxCompraKeyPress
  end
  object GroupBox1: TGroupBox
    Left = 220
    Top = 138
    Width = 229
    Height = 89
    Caption = 'Taxas e Paridades'
    TabOrder = 12
    object Label10: TLabel
      Left = 10
      Top = 17
      Width = 208
      Height = 65
      AutoSize = False
      Caption = 
        'Os valores poder'#227'o ser informados por digita'#231#227'o pelo usu'#225'rio ou ' +
        'se preferir '#233' poss'#237'el busc'#225'-los diretamente do Banco Central do ' +
        'Brasil ap'#243's a inclus'#227'o das moedas para cota'#231#227'o. '#201' necess'#225'rio exi' +
        'stir conex'#227'o com a Internet para realizar a Importa'#231#227'o.'
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
