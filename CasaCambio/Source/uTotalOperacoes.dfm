object rel_TotalOperacoes: Trel_TotalOperacoes
  Left = 0
  Top = 0
  Caption = 'rel_TotalOperacoes'
  ClientHeight = 376
  ClientWidth = 858
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object relTotalOperacoes: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsTotais
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Title = 'Valor Total das Opera'#231#245'es de C'#226'mbio'
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
        Left = 219
        Top = 17
        Width = 280
        Height = 13
        Align = faCenterBottom
        Alignment = taCenter
        Caption = 'Relat'#243'rio com o Valor Total das das Opera'#231#245'es de C'#226'mbio'
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
    object RLBand6: TRLBand
      Left = 38
      Top = 193
      Width = 718
      Height = 40
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBResult2: TRLDBResult
        Left = 256
        Top = 7
        Width = 112
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DataField = 'VALORCONVERTIDO'
        DataSource = dsTotais
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
        Left = 384
        Top = 7
        Width = 110
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DataField = 'TAXACOBRADA'
        DataSource = dsTotais
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
      object RLDBResult1: TRLDBResult
        Left = 136
        Top = 7
        Width = 104
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DataField = 'VALORORIGINAL'
        DataSource = dsTotais
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
      object RLLabel10: TRLLabel
        Left = 0
        Top = 7
        Width = 156
        Height = 13
        Caption = 'Valor Total das Opera'#231#245'es: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand7: TRLBand
      Left = 38
      Top = 233
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
    object RLGroup1: TRLGroup
      Left = 38
      Top = 109
      Width = 718
      Height = 84
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      DataFields = 'ID_LOJA'
      object RLBand8: TRLBand
        Left = 1
        Top = 1
        Width = 716
        Height = 18
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLLabel6: TRLLabel
          Left = 0
          Top = 0
          Width = 30
          Height = 18
          Align = faLeft
          Caption = 'Loja: '
          Layout = tlCenter
          Transparent = False
        end
        object RLDBText4: TRLDBText
          Left = 30
          Top = 0
          Width = 23
          Height = 18
          Align = faLeft
          AutoSize = False
          DataField = 'ID_LOJA'
          DataSource = dsTotais
          Layout = tlCenter
          Text = ''
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 53
          Top = 0
          Width = 19
          Height = 18
          Align = faLeft
          Caption = '  -  '
          Layout = tlCenter
          Transparent = False
        end
        object RLDBText7: TRLDBText
          Left = 72
          Top = 0
          Width = 32
          Height = 18
          Align = faLeft
          DataField = 'NOME'
          DataSource = dsTotais
          Layout = tlCenter
          Text = ''
          Transparent = False
        end
        object RLLabel13: TRLLabel
          Left = 104
          Top = 0
          Width = 19
          Height = 18
          Align = faLeft
          Caption = '  -  '
          Layout = tlCenter
          Transparent = False
        end
        object RLDBText1: TRLDBText
          Left = 123
          Top = 0
          Width = 41
          Height = 18
          Align = faLeft
          DataField = 'CIDADE'
          DataSource = dsTotais
          Layout = tlCenter
          Text = ''
          Transparent = False
        end
      end
      object RLBand4: TRLBand
        Left = 1
        Top = 19
        Width = 716
        Height = 16
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel4: TRLLabel
          Left = 173
          Top = 0
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Original'
        end
        object RLLabel8: TRLLabel
          Left = 282
          Top = 0
          Width = 83
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Convertido'
        end
        object RLLabel9: TRLLabel
          Left = 438
          Top = 0
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Taxa'
        end
        object RLLabel5: TRLLabel
          Left = 40
          Top = 0
          Width = 35
          Height = 13
          Caption = 'Moeda'
        end
      end
      object RLBand5: TRLBand
        Left = 1
        Top = 35
        Width = 716
        Height = 19
        object RLDBText2: TRLDBText
          Left = 136
          Top = 0
          Width = 102
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALORORIGINAL'
          DataSource = dsTotais
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 256
          Top = 0
          Width = 109
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALORCONVERTIDO'
          DataSource = dsTotais
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 384
          Top = 2
          Width = 109
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'TAXACOBRADA'
          DataSource = dsTotais
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 32
          Top = 0
          Width = 50
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'MOEDA_ORIGEM'
          DataSource = dsTotais
          Text = ''
        end
      end
      object RLBand9: TRLBand
        Left = 1
        Top = 54
        Width = 716
        Height = 26
        BandType = btSummary
        object RLDBResult4: TRLDBResult
          Left = 136
          Top = 1
          Width = 104
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DataField = 'VALORORIGINAL'
          DataSource = dsTotais
          DisplayMask = '#,###,##0.00'
          Info = riSum
          Text = ''
        end
        object RLDBResult5: TRLDBResult
          Left = 256
          Top = 1
          Width = 110
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DataField = 'VALORCONVERTIDO'
          DataSource = dsTotais
          DisplayMask = '#,###,##0.00'
          Info = riSum
          Text = ''
        end
        object RLDBResult6: TRLDBResult
          Left = 384
          Top = 1
          Width = 110
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DataField = 'TAXACOBRADA'
          DataSource = dsTotais
          DisplayMask = '#,###,##0.00'
          Info = riSum
          Text = ''
        end
        object RLLabel3: TRLLabel
          Left = 0
          Top = 2
          Width = 98
          Height = 13
          Caption = 'Sub-Total da Loja >'
        end
      end
    end
  end
  object dsTotais: TDataSource
    DataSet = qryTotais
    Left = 80
    Top = 248
  end
  object qryTotais: TFDQuery
    Connection = DM.fbConn
    SQL.Strings = (
      'select '
      '   operacoes.id_loja, '
      '   operacoes.moeda_origem,'
      '   sum(operacoes.valor_original) as valorOriginal,'
      '   sum(operacoes.valor_convertido) as valorConvertido,'
      '   sum(operacoes.taxa_cobrada) as taxaCobrada,'
      '   lojas.nome,'
      '   lojas.cidade'
      'from operacoes'
      '    left join lojas on lojas.id = operacoes.id_loja'
      
        'group by operacoes.id_loja, operacoes.moeda_origem, lojas.nome, ' +
        'lojas.cidade'
      'order by operacoes.id_loja, valorConvertido desc, lojas.nome')
    Left = 136
    Top = 248
    object qryTotaisID_LOJA: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Loja'
      DisplayWidth = 5
      FieldName = 'ID_LOJA'
      Origin = 'ID_LOJA'
      DisplayFormat = '000'
    end
    object qryTotaisMOEDA_ORIGEM: TStringField
      FieldName = 'MOEDA_ORIGEM'
      Origin = 'MOEDA_ORIGEM'
      Size = 3
    end
    object qryTotaisVALORORIGINAL: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALORORIGINAL'
      Origin = 'VALORORIGINAL'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,###,##0.00'
    end
    object qryTotaisVALORCONVERTIDO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALORCONVERTIDO'
      Origin = 'VALORCONVERTIDO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,###,##0.00'
    end
    object qryTotaisTAXACOBRADA: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'TAXACOBRADA'
      Origin = 'TAXACOBRADA'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,###,##0.00'
    end
    object qryTotaisNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object qryTotaisCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
  end
end
