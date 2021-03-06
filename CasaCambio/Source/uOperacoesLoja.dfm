object rel_OperacoesLoja: Trel_OperacoesLoja
  Left = 0
  Top = 0
  Caption = 'rel_OperacoesLoja'
  ClientHeight = 362
  ClientWidth = 815
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object relOperacoesLoja: TRLReport
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
    Title = 'Listagem de Opera'#231#245'es por Loja'
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
        Left = 225
        Top = 17
        Width = 268
        Height = 13
        Align = faCenterBottom
        Alignment = taCenter
        Caption = 'Relat'#243'rio com o Valor Total das das Opera'#231#245'es por Loja'
      end
    end
    object RLBand2: TRLBand
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
      Top = 69
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
        object RLLabel17: TRLLabel
          Left = 104
          Top = 0
          Width = 19
          Height = 18
          Align = faLeft
          Caption = '  -  '
          Layout = tlCenter
          Transparent = False
        end
        object RLDBText11: TRLDBText
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
          Left = 213
          Top = 2
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Original'
        end
        object RLLabel8: TRLLabel
          Left = 418
          Top = 2
          Width = 83
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Convertido'
        end
        object RLLabel9: TRLLabel
          Left = 518
          Top = 2
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Taxa'
        end
        object RLLabel5: TRLLabel
          Left = 288
          Top = 2
          Width = 37
          Height = 13
          Caption = 'Origem'
        end
        object RLLabel10: TRLLabel
          Left = 375
          Top = 2
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cota'#231#227'o'
        end
        object RLLabel11: TRLLabel
          Left = 62
          Top = 2
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nome do Cliente'
        end
        object RLLabel12: TRLLabel
          Left = 0
          Top = 2
          Width = 26
          Height = 13
          Caption = 'Data'
        end
        object RLLabel13: TRLLabel
          Left = 328
          Top = 2
          Width = 39
          Height = 13
          Caption = 'Destino'
        end
      end
      object RLBand5: TRLBand
        Left = 1
        Top = 35
        Width = 716
        Height = 19
        object RLDBText2: TRLDBText
          Left = 216
          Top = 2
          Width = 62
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR_ORIGINAL'
          DataSource = dsTotais
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 416
          Top = 2
          Width = 85
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR_CONVERTIDO'
          DataSource = dsTotais
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 516
          Top = 2
          Width = 57
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'TAXA_COBRADA'
          DataSource = dsTotais
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 288
          Top = 2
          Width = 37
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'MOEDA_ORIGEM'
          DataSource = dsTotais
          Text = ''
        end
        object RLDBText1: TRLDBText
          Left = 0
          Top = 2
          Width = 66
          Height = 14
          AutoSize = False
          DataField = 'DATA_OPERACAO'
          DataSource = dsTotais
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 62
          Top = 2
          Width = 150
          Height = 14
          AutoSize = False
          DataField = 'NOME_CLIENTE'
          DataSource = dsTotais
          Text = ''
        end
        object RLDBText9: TRLDBText
          Left = 328
          Top = 2
          Width = 38
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'MOEDA_DESTINO'
          DataSource = dsTotais
          Text = ''
        end
        object RLDBText10: TRLDBText
          Left = 360
          Top = 2
          Width = 59
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR_COTACAO'
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
          Left = 208
          Top = 2
          Width = 70
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DataField = 'VALOR_ORIGINAL'
          DataSource = dsTotais
          DisplayMask = '#,###,##0.00'
          Info = riSum
          Text = ''
        end
        object RLDBResult5: TRLDBResult
          Left = 432
          Top = 2
          Width = 69
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DataField = 'VALOR_CONVERTIDO'
          DataSource = dsTotais
          DisplayMask = '#,###,##0.00'
          Info = riSum
          Text = ''
        end
        object RLDBResult6: TRLDBResult
          Left = 504
          Top = 2
          Width = 69
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DataField = 'TAXA_COBRADA'
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
        Left = 389
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
        DataField = 'VALOR_CONVERTIDO'
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
        Left = 502
        Top = 7
        Width = 72
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DataField = 'TAXA_COBRADA'
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
        Left = 175
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
        DataField = 'VALOR_ORIGINAL'
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
      object RLLabel14: TRLLabel
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
      object RLLabel15: TRLLabel
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
      object RLLabel16: TRLLabel
        Left = 205
        Top = 17
        Width = 307
        Height = 13
        Align = faCenterBottom
        Caption = 'M'#225'rcio Moreira Camilo | (47)98867-7130 | mmcamilo@gmail.com'
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
      '   operacoes.id_loja,'
      '   operacoes.data_operacao,'
      '   operacoes.nome_cliente, '
      '   operacoes.moeda_origem,'
      '   operacoes.valor_original,'
      '   operacoes.moeda_destino,'
      '   operacoes.valor_cotacao,'
      '   operacoes.valor_convertido,'
      '   operacoes.taxa_cobrada,'
      '   lojas.nome,'
      '   lojas.cidade'
      'from operacoes'
      '    left join lojas on lojas.id = operacoes.id_loja'
      'order by operacoes.id_loja, valor_convertido desc')
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
    object qryTotaisDATA_OPERACAO: TDateField
      FieldName = 'DATA_OPERACAO'
      Origin = 'DATA_OPERACAO'
    end
    object qryTotaisNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      Size = 60
    end
    object qryTotaisMOEDA_ORIGEM: TStringField
      FieldName = 'MOEDA_ORIGEM'
      Origin = 'MOEDA_ORIGEM'
      Size = 3
    end
    object qryTotaisVALOR_ORIGINAL: TFloatField
      FieldName = 'VALOR_ORIGINAL'
      Origin = 'VALOR_ORIGINAL'
      DisplayFormat = '#,###,##0.00'
    end
    object qryTotaisMOEDA_DESTINO: TStringField
      FieldName = 'MOEDA_DESTINO'
      Origin = 'MOEDA_DESTINO'
      Size = 3
    end
    object qryTotaisVALOR_COTACAO: TFloatField
      FieldName = 'VALOR_COTACAO'
      Origin = 'VALOR_COTACAO'
      DisplayFormat = '0.0000'
    end
    object qryTotaisVALOR_CONVERTIDO: TFloatField
      FieldName = 'VALOR_CONVERTIDO'
      Origin = 'VALOR_CONVERTIDO'
      DisplayFormat = '#,###,##0.00'
    end
    object qryTotaisTAXA_COBRADA: TFloatField
      FieldName = 'TAXA_COBRADA'
      Origin = 'TAXA_COBRADA'
      DisplayFormat = '#,###,##0.00'
    end
  end
end
