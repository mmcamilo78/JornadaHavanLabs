object frmLojasIncAlt: TfrmLojasIncAlt
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Lojas de C'#226'mbio'
  ClientHeight = 198
  ClientWidth = 316
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
    Top = 16
    Width = 65
    Height = 13
    Caption = 'Nome da Loja'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label3: TLabel
    Left = 256
    Top = 64
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object Bevel1: TBevel
    Left = 19
    Top = 120
    Width = 278
    Height = 9
    Shape = bsTopLine
  end
  object edtNome: TEdit
    Left = 16
    Top = 32
    Width = 281
    Height = 21
    AutoSize = False
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edtCidade: TEdit
    Left = 16
    Top = 80
    Width = 233
    Height = 21
    AutoSize = False
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object cbbUF: TComboBox
    Left = 256
    Top = 80
    Width = 41
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE'
      'TO')
  end
  object btnGravar: TButton
    Left = 16
    Top = 136
    Width = 113
    Height = 41
    Caption = '&Gravar'
    TabOrder = 3
    OnClick = btnGravarClick
  end
  object brnCancelar: TButton
    Left = 179
    Top = 136
    Width = 121
    Height = 41
    Caption = '&Cancelar'
    TabOrder = 4
    OnClick = brnCancelarClick
  end
end
