object frmOperacoesIncAlt: TfrmOperacoesIncAlt
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Opera'#231#245'es de C'#226'mbio'
  ClientHeight = 312
  ClientWidth = 525
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
    Left = 16
    Top = 80
    Width = 78
    Height = 13
    Caption = 'Nome do Cliente'
  end
  object Label2: TLabel
    Left = 16
    Top = 16
    Width = 88
    Height = 13
    Caption = 'Data da Opera'#231#227'o'
  end
  object Label3: TLabel
    Left = 16
    Top = 128
    Width = 84
    Height = 13
    Caption = 'Moeda de Origem'
  end
  object Label5: TLabel
    Left = 16
    Top = 176
    Width = 85
    Height = 13
    Caption = 'Valor a Converter'
  end
  object Label6: TLabel
    Left = 160
    Top = 176
    Width = 104
    Height = 13
    Caption = 'Valor Convertido (R$)'
  end
  object Label7: TLabel
    Left = 280
    Top = 176
    Width = 92
    Height = 13
    Caption = 'Taxa Cobrada (R$)'
  end
  object Label8: TLabel
    Left = 392
    Top = 128
    Width = 114
    Height = 13
    Caption = 'Cota'#231#227'o da Moeda (R$)'
  end
  object Bevel1: TBevel
    Left = 16
    Top = 240
    Width = 497
    Height = 9
    Shape = bsTopLine
  end
  object Label4: TLabel
    Left = 160
    Top = 16
    Width = 20
    Height = 13
    Caption = 'Loja'
  end
  object Label9: TLabel
    Left = 392
    Top = 176
    Width = 114
    Height = 13
    Caption = 'Repasse p/ Cliente (R$)'
  end
  object edtNomeCliente: TEdit
    Left = 16
    Top = 96
    Width = 497
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = edtNomeClienteChange
    OnExit = edtNomeClienteExit
    OnKeyDown = edtNomeClienteKeyDown
    OnKeyPress = edtNomeClienteKeyPress
    OnKeyUp = edtNomeClienteKeyUp
  end
  object dtCotacao: TDateTimePicker
    Left = 16
    Top = 32
    Width = 121
    Height = 26
    Date = 44334.000000000000000000
    Time = 0.891288506943965300
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = dtCotacaoChange
  end
  object cbbMoedaOrigem: TComboBox
    Left = 16
    Top = 144
    Width = 369
    Height = 22
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = cbbMoedaOrigemChange
  end
  object edtValorConverter: TEdit
    Left = 16
    Top = 192
    Width = 97
    Height = 24
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = '0,00'
    OnExit = edtValorConverterExit
    OnKeyPress = edtValorConverterKeyPress
  end
  object edtValorConvertido: TEdit
    Left = 160
    Top = 192
    Width = 113
    Height = 24
    Alignment = taRightJustify
    Color = 14408667
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = '0,00'
  end
  object edtTaxaCobrada: TEdit
    Left = 280
    Top = 192
    Width = 105
    Height = 24
    Alignment = taRightJustify
    Color = 14408667
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    Text = '0,00'
  end
  object edtCotacaoMoeda: TEdit
    Left = 392
    Top = 144
    Width = 121
    Height = 22
    Alignment = taRightJustify
    AutoSize = False
    Color = 14408667
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Text = '0,0000'
  end
  object btnConverter: TButton
    Left = 120
    Top = 191
    Width = 33
    Height = 26
    Caption = '--->'
    TabOrder = 7
    OnClick = btnConverterClick
  end
  object btnGravar: TButton
    Left = 312
    Top = 256
    Width = 97
    Height = 41
    Caption = '&Gravar'
    TabOrder = 8
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 416
    Top = 256
    Width = 97
    Height = 41
    Caption = '&Cancelar'
    TabOrder = 9
    OnClick = btnCancelarClick
  end
  object cbbLojas: TComboBox
    Left = 160
    Top = 32
    Width = 353
    Height = 24
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnChange = cbbLojasChange
  end
  object edtRepasse: TEdit
    Left = 392
    Top = 192
    Width = 121
    Height = 24
    Alignment = taRightJustify
    Color = 14408667
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 12
    Text = '0,00'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 120
    Width = 497
    Height = 120
    DataSource = dsClientes
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    OnKeyPress = DBGrid1KeyPress
  end
  object qryCotacoes: TFDQuery
    Connection = DM.fbConn
    SQL.Strings = (
      
        'select a.codigo, b.simbolo, b.tipo, b.nome, a.taxa_compra, a.tax' +
        'a_venda,'
      '            a.paridade_compra, a.paridade_venda '
      
        '            from cotacoes a, moedas b where a.data_cotacao = :da' +
        'ta_cotacao'
      '            and a.codigo = b.codigo')
    Left = 144
    Top = 80
    ParamData = <
      item
        Name = 'DATA_COTACAO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
    object qryCotacoesCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object qryCotacoesSIMBOLO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SIMBOLO'
      Origin = 'SIMBOLO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryCotacoesTIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryCotacoesNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryCotacoesTAXA_COMPRA: TFloatField
      FieldName = 'TAXA_COMPRA'
      Origin = 'TAXA_COMPRA'
    end
    object qryCotacoesTAXA_VENDA: TFloatField
      FieldName = 'TAXA_VENDA'
      Origin = 'TAXA_VENDA'
    end
    object qryCotacoesPARIDADE_COMPRA: TFloatField
      FieldName = 'PARIDADE_COMPRA'
      Origin = 'PARIDADE_COMPRA'
    end
    object qryCotacoesPARIDADE_VENDA: TFloatField
      FieldName = 'PARIDADE_VENDA'
      Origin = 'PARIDADE_VENDA'
    end
  end
  object qryClientes: TFDQuery
    Connection = DM.fbConn
    SQL.Strings = (
      'select distinct nome_cliente from operacoes')
    Left = 256
    Top = 80
    object qryClientesNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      Size = 60
    end
  end
  object dsClientes: TDataSource
    DataSet = qryClientes
    Left = 328
    Top = 80
  end
end
