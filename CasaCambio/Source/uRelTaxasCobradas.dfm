object rel_TaxasCobradas: Trel_TaxasCobradas
  Left = 0
  Top = 0
  Caption = 'rel_TaxasCobradas'
  ClientHeight = 409
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object relTaxasCobradas: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsTaxas
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 31
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 261
        Top = 0
        Width = 195
        Height = 14
        Align = faCenterTop
        Caption = 'Casa de C'#226'mbio Muito Dinheiro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 243
        Top = 17
        Width = 232
        Height = 13
        Align = faCenterBottom
        Alignment = taCenter
        Caption = 'Relat'#243'rio com o Valor Total das Taxas Cobradas'
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 69
      Width = 718
      Height = 20
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLSystemInfo1: TRLSystemInfo
        Left = 0
        Top = 0
        Width = 89
        Height = 13
        Align = faLeftTop
        Info = itNow
        Text = 'Data/Hora: '
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 607
        Top = 0
        Width = 111
        Height = 13
        Align = faRightTop
        Alignment = taRightJustify
        Info = itPageNumber
        Text = 'P'#225'gina: '
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 89
      Width = 718
      Height = 20
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lblFiltro: TRLLabel
        Left = 0
        Top = 0
        Width = 27
        Height = 13
        Align = faLeftTop
        Caption = 'Filtro'
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 109
      Width = 718
      Height = 19
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Color = clSilver
      ParentColor = False
      Transparent = False
      object RLLabel3: TRLLabel
        Left = 0
        Top = 0
        Width = 76
        Height = 17
        Align = faLeftTop
        AutoSize = False
        Caption = 'Data Opera'#231#227'o'
        Layout = tlCenter
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 76
        Top = 0
        Width = 23
        Height = 17
        Align = faLeftTop
        AutoSize = False
        Caption = 'Loja'
        Layout = tlCenter
        Transparent = False
      end
      object RLLabel8: TRLLabel
        Left = 413
        Top = 0
        Width = 83
        Height = 17
        AutoSize = False
        Caption = 'Valor Convertido'
        Layout = tlCenter
        Transparent = False
      end
      object RLLabel9: TRLLabel
        Left = 647
        Top = 0
        Width = 71
        Height = 17
        Align = faRightTop
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Taxa Cobrada'
        Layout = tlCenter
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 99
        Top = 0
        Width = 81
        Height = 17
        Align = faLeftTop
        AutoSize = False
        Caption = 'Nome do Cliente'
        Layout = tlCenter
        Transparent = False
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 128
      Width = 718
      Height = 19
      object RLDBText1: TRLDBText
        Left = 0
        Top = 2
        Width = 78
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'DATA_OPERACAO'
        DataSource = dsTaxas
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 77
        Top = 2
        Width = 28
        Height = 14
        AutoSize = False
        DataField = 'ID_LOJA'
        DataSource = dsTaxas
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 344
        Top = 0
        Width = 152
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR_CONVERTIDO'
        DataSource = dsTaxas
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 592
        Top = 0
        Width = 126
        Height = 14
        Align = faRightTop
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'TAXA_COBRADA'
        DataSource = dsTaxas
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 101
        Top = 1
        Width = 233
        Height = 14
        AutoSize = False
        DataField = 'NOME_CLIENTE'
        DataSource = dsTaxas
        Text = ''
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 147
      Width = 718
      Height = 40
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel10: TRLLabel
        Left = 0
        Top = 1
        Width = 104
        Height = 13
        Align = faLeftTop
        Caption = 'Total de Opera'#231#245'es: '
      end
      object RLDBResult1: TRLDBResult
        Left = 104
        Top = 1
        Width = 40
        Height = 13
        Align = faLeftTop
        Info = riCount
        Text = ''
      end
      object RLDBResult2: TRLDBResult
        Left = 336
        Top = 1
        Width = 161
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR_CONVERTIDO'
        DataSource = dsTaxas
        DisplayMask = '#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult3: TRLDBResult
        Left = 552
        Top = 1
        Width = 166
        Height = 14
        Align = faRightTop
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'TAXA_COBRADA'
        DataSource = dsTaxas
        DisplayMask = '#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
    end
    object RLBand7: TRLBand
      Left = 38
      Top = 187
      Width = 718
      Height = 30
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel11: TRLLabel
        Left = 203
        Top = 1
        Width = 311
        Height = 13
        Align = faCenterTop
        Caption = 'Desafio Programa'#231#227'o - Jornada Labs HAVAN - PROWAY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 205
        Top = 17
        Width = 307
        Height = 13
        Align = faCenterBottom
        Caption = 'M'#225'rcio Moreira Camilo | (47)98867-7130 | mmcamilo@gmail.com'
      end
    end
  end
  object qryTaxas: TFDQuery
    Connection = DM.fbConn
    SQL.Strings = (
      
        'select data_operacao, id_loja, nome_cliente, valor_convertido, t' +
        'axa_cobrada from operacoes  order by data_operacao')
    Left = 168
    Top = 248
    object qryTaxasDATA_OPERACAO: TDateField
      FieldName = 'DATA_OPERACAO'
      Origin = 'DATA_OPERACAO'
    end
    object qryTaxasID_LOJA: TIntegerField
      DisplayLabel = 'Loja'
      DisplayWidth = 5
      FieldName = 'ID_LOJA'
      Origin = 'ID_LOJA'
      DisplayFormat = '000'
    end
    object qryTaxasNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      Size = 60
    end
    object qryTaxasVALOR_CONVERTIDO: TFloatField
      FieldName = 'VALOR_CONVERTIDO'
      Origin = 'VALOR_CONVERTIDO'
      DisplayFormat = '#,###,##0.00'
    end
    object qryTaxasTAXA_COBRADA: TFloatField
      FieldName = 'TAXA_COBRADA'
      Origin = 'TAXA_COBRADA'
      DisplayFormat = '#,###,##0.00'
    end
  end
  object dsTaxas: TDataSource
    DataSet = qryTaxas
    Left = 120
    Top = 248
  end
end
