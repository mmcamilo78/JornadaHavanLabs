object frmCalculadora: TfrmCalculadora
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Calculadora de C'#226'mbio - Desafio Programa'#231#227'o - Jornada Havan Labs'
  ClientHeight = 404
  ClientWidth = 603
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 32
    Width = 85
    Height = 13
    Caption = 'Valor a Converter'
  end
  object Label2: TLabel
    Left = 16
    Top = 88
    Width = 84
    Height = 13
    Caption = 'Moeda de Origem'
  end
  object Label3: TLabel
    Left = 16
    Top = 136
    Width = 86
    Height = 13
    Caption = 'Moeda de Destino'
  end
  object Label4: TLabel
    Left = 384
    Top = 88
    Width = 82
    Height = 13
    Caption = 'Paridade Compra'
  end
  object Label5: TLabel
    Left = 384
    Top = 136
    Width = 82
    Height = 13
    Caption = 'Paridade Compra'
  end
  object Label6: TLabel
    Left = 464
    Top = 16
    Width = 81
    Height = 13
    Caption = 'Data da Cota'#231#227'o'
  end
  object Label10: TLabel
    Left = 512
    Top = 88
    Width = 75
    Height = 13
    Caption = 'Paridade Venda'
  end
  object Label11: TLabel
    Left = 512
    Top = 136
    Width = 75
    Height = 13
    Caption = 'Paridade Venda'
  end
  object cbbMoedaOrigem: TComboBox
    Left = 16
    Top = 104
    Width = 321
    Height = 23
    BevelKind = bkFlat
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = cbbMoedaOrigemChange
  end
  object cbbMoedaDestino: TComboBox
    Left = 16
    Top = 152
    Width = 321
    Height = 23
    BevelKind = bkFlat
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = cbbMoedaDestinoChange
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 200
    Width = 569
    Height = 193
    Caption = 'Resultado'
    TabOrder = 4
    object Label7: TLabel
      Left = 32
      Top = 24
      Width = 71
      Height = 13
      Caption = 'Convers'#227'o de:'
    end
    object Label8: TLabel
      Left = 77
      Top = 48
      Width = 26
      Height = 13
      Caption = 'Para:'
    end
    object lblConversaoDe: TLabel
      Left = 281
      Top = 22
      Width = 220
      Height = 18
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblConversaoPara: TLabel
      Left = 115
      Top = 46
      Width = 433
      Height = 17
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 19
      Top = 72
      Width = 84
      Height = 13
      Caption = 'Valor Convertido:'
    end
    object lblValorAConverter: TLabel
      Left = 115
      Top = 22
      Width = 446
      Height = 18
      AutoSize = False
      Caption = '0,0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorConvertido: TLabel
      Left = 115
      Top = 70
      Width = 190
      Height = 17
      AutoSize = False
      Caption = '0,0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 8
      Top = 104
      Width = 545
      Height = 9
      Shape = bsTopLine
    end
    object Label13: TLabel
      Left = 8
      Top = 112
      Width = 126
      Height = 13
      Caption = 'Refer'#234'ncia da Convers'#227'o:'
    end
    object lblOrigem: TLabel
      Left = 14
      Top = 132
      Width = 540
      Height = 18
      AutoSize = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
    object lblDestino: TLabel
      Left = 14
      Top = 156
      Width = 540
      Height = 18
      AutoSize = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
  end
  object dtCotacao: TDateTimePicker
    Left = 464
    Top = 32
    Width = 122
    Height = 26
    Date = 44332.000000000000000000
    Time = 0.610543611110188100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnChange = dtCotacaoChange
  end
  object edtParidadeOrigemCompra: TEdit
    Left = 368
    Top = 104
    Width = 97
    Height = 19
    Alignment = taRightJustify
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    Text = '0,00'
  end
  object edtParidadeOrigemVenda: TEdit
    Left = 488
    Top = 104
    Width = 97
    Height = 19
    Alignment = taRightJustify
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Text = '0,00'
  end
  object edtParidadeDestinoCompra: TEdit
    Left = 368
    Top = 160
    Width = 97
    Height = 19
    Alignment = taRightJustify
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    Text = '0,00'
  end
  object edtParidadeDestinoVenda: TEdit
    Left = 488
    Top = 160
    Width = 97
    Height = 19
    Alignment = taRightJustify
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
    Text = '0,00'
  end
  object edtValor: TEdit
    Left = 16
    Top = 48
    Width = 121
    Height = 25
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = '0,00'
    OnExit = edtValorExit
    OnKeyPress = edtValorKeyPress
  end
  object qryConv: TFDQuery
    Connection = DM.fbConn
    SQL.Strings = (
      'select a.codigo, b.simbolo, b.tipo, b.nome, '
      'a.taxa_compra, a.taxa_venda, a.paridade_compra, '
      'a.paridade_venda'
      'from cotacoes a, moedas b'
      'where a.data_cotacao = :data_cotacao'
      'and a.codigo = b.codigo')
    Left = 272
    Top = 40
    ParamData = <
      item
        Name = 'DATA_COTACAO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
    object qryConvCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object qryConvSIMBOLO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SIMBOLO'
      Origin = 'SIMBOLO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryConvTIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryConvNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryConvTAXA_COMPRA: TFloatField
      FieldName = 'TAXA_COMPRA'
      Origin = 'TAXA_COMPRA'
    end
    object qryConvTAXA_VENDA: TFloatField
      FieldName = 'TAXA_VENDA'
      Origin = 'TAXA_VENDA'
    end
    object qryConvPARIDADE_COMPRA: TFloatField
      FieldName = 'PARIDADE_COMPRA'
      Origin = 'PARIDADE_COMPRA'
    end
    object qryConvPARIDADE_VENDA: TFloatField
      FieldName = 'PARIDADE_VENDA'
      Origin = 'PARIDADE_VENDA'
    end
  end
end
