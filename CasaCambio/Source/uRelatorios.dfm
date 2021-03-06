object frmRelatorios: TfrmRelatorios
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rios - Casa de C'#226'mbio Muito Dinheiro'
  ClientHeight = 345
  ClientWidth = 686
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
  object GroupBox3: TGroupBox
    Left = 16
    Top = 176
    Width = 321
    Height = 153
    Caption = 'Tipo de Relat'#243'rio'
    TabOrder = 0
    object Bevel1: TBevel
      Left = 24
      Top = 104
      Width = 273
      Height = 9
      Shape = bsTopLine
    end
    object rdbListagemOperacoes: TRadioButton
      Left = 24
      Top = 24
      Width = 201
      Height = 17
      Caption = 'Listagem de Opera'#231#245'es'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rdbTotalOperacoes: TRadioButton
      Left = 24
      Top = 48
      Width = 185
      Height = 17
      Caption = 'Valor Total das Opera'#231#245'es'
      TabOrder = 1
    end
    object rdbTotalTaxas: TRadioButton
      Left = 24
      Top = 72
      Width = 241
      Height = 17
      Caption = 'Valor Total das Taxas Cobradas'
      TabOrder = 2
    end
    object rdbOperacoesLoja: TRadioButton
      Left = 24
      Top = 116
      Width = 265
      Height = 17
      Caption = 'Listagem de Opera'#231#245'es por Loja (recurso adicional)'
      TabOrder = 3
    end
  end
  object GroupBox4: TGroupBox
    Left = 16
    Top = 8
    Width = 649
    Height = 161
    Caption = 'Definir Crit'#233'rios do Filtro de Pesquisas'
    TabOrder = 1
    object rdbTodosRegistros: TRadioButton
      Left = 184
      Top = 32
      Width = 113
      Height = 17
      Caption = 'Todos os Registros'
      TabOrder = 0
      OnClick = rdbTodosRegistrosClick
    end
    object rdbIncluirFiltro: TRadioButton
      Left = 24
      Top = 32
      Width = 153
      Height = 17
      Caption = 'Filtro de Pesquisa'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rdbIncluirFiltroClick
    end
    object pnlFiltro: TPanel
      Left = 16
      Top = 56
      Width = 617
      Height = 97
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 297
        Height = 73
        Caption = 'Por Cliente Espec'#237'fico'
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 20
          Width = 78
          Height = 13
          Caption = 'Nome do Cliente'
        end
        object edtNomeCliente: TEdit
          Left = 16
          Top = 37
          Width = 265
          Height = 19
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtNomeClienteChange
          OnExit = edtNomeClienteExit
          OnKeyPress = edtNomeClienteKeyPress
        end
      end
      object GroupBox2: TGroupBox
        Left = 312
        Top = 8
        Width = 297
        Height = 73
        Caption = 'Por Per'#237'odo de Opera'#231#227'o'
        TabOrder = 1
        object Label2: TLabel
          Left = 32
          Top = 24
          Width = 53
          Height = 13
          Caption = 'Data Inicial'
        end
        object Label3: TLabel
          Left = 168
          Top = 24
          Width = 48
          Height = 13
          Caption = 'Data Final'
        end
        object dtOperacaoInicial: TDateTimePicker
          Left = 32
          Top = 40
          Width = 113
          Height = 21
          Date = 44335.000000000000000000
          Time = 0.567262337965075900
          TabOrder = 0
        end
        object dtOperacaoFinal: TDateTimePicker
          Left = 168
          Top = 40
          Width = 105
          Height = 21
          Date = 44335.000000000000000000
          Time = 0.567416689817037000
          TabOrder = 1
        end
      end
    end
  end
  object btnImprimir: TButton
    Left = 384
    Top = 240
    Width = 105
    Height = 41
    Caption = 'Imprimir'
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object Button2: TButton
    Left = 528
    Top = 240
    Width = 105
    Height = 41
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 56
    Top = 129
    Width = 265
    Height = 120
    DataSource = dsClientes
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    OnDblClick = DBGrid1DblClick
  end
  object qryClientes: TFDQuery
    Connection = DM.fbConn
    SQL.Strings = (
      
        'select distinct nome_cliente from operacoes order by nome_client' +
        'e')
    Left = 168
    Top = 176
    object qryClientesNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      Size = 60
    end
  end
  object dsClientes: TDataSource
    DataSet = qryClientes
    Left = 112
    Top = 176
  end
end
