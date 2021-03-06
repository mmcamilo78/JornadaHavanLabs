object frmLocalizaMoedas: TfrmLocalizaMoedas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Localizar Moeda de C'#226'mbio'
  ClientHeight = 359
  ClientWidth = 775
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
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 769
    Height = 78
    Align = alTop
    Caption = 'Qual moeda voc'#234' procura ? '
    TabOrder = 0
    object Label1: TLabel
      Left = 18
      Top = 24
      Width = 35
      Height = 13
      Caption = 'Crit'#233'rio'
    end
    object Label2: TLabel
      Left = 147
      Top = 24
      Width = 134
      Height = 13
      Caption = 'Descri'#231#227'o a ser localizada...'
    end
    object cbbCriterio: TComboBox
      Left = 16
      Top = 40
      Width = 121
      Height = 21
      BevelKind = bkFlat
      Style = csDropDownList
      CharCase = ecUpperCase
      ItemIndex = 0
      TabOrder = 0
      Text = 'NOME'
      OnChange = cbbCriterioChange
      Items.Strings = (
        'NOME'
        'S'#205'MBOLO'
        'PA'#205'S')
    end
    object edtDescricao: TEdit
      Left = 144
      Top = 40
      Width = 225
      Height = 21
      AutoSize = False
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = edtDescricaoChange
      OnKeyPress = edtDescricaoKeyPress
    end
    object btnSelecionar: TButton
      Left = 376
      Top = 38
      Width = 75
      Height = 25
      Caption = '&Selecionar'
      TabOrder = 2
      OnClick = btnSelecionarClick
    end
    object btnCancelar: TButton
      Left = 456
      Top = 38
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 87
    Width = 769
    Height = 269
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 765
      Height = 265
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsMoedas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
    end
  end
  object dsMoedas: TDataSource
    DataSet = qryPesquisa
    Left = 155
    Top = 127
  end
  object qryPesquisa: TFDQuery
    Connection = DM.fbConn
    SQL.Strings = (
      'select * from moedas')
    Left = 211
    Top = 127
    object qryPesquisaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Visible = False
    end
    object qryPesquisaCODIGO: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 7
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      DisplayFormat = '000'
    end
    object qryPesquisaNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object qryPesquisaSIMBOLO: TStringField
      Alignment = taCenter
      DisplayLabel = 'S'#237'mbolo'
      DisplayWidth = 7
      FieldName = 'SIMBOLO'
      Origin = 'SIMBOLO'
      Size = 10
    end
    object qryPesquisaTIPO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tipo'
      DisplayWidth = 3
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qryPesquisaCOD_PAIS: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo Pa'#237's'
      FieldName = 'COD_PAIS'
      Origin = 'COD_PAIS'
      DisplayFormat = '000000'
    end
    object qryPesquisaPAIS: TStringField
      DisplayLabel = 'Pa'#237's'
      DisplayWidth = 40
      FieldName = 'PAIS'
      Origin = 'PAIS'
      Size = 50
    end
  end
end
