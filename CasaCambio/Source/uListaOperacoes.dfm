object rel_ListaOperacoes: Trel_ListaOperacoes
  Left = 0
  Top = 0
  Caption = 'rel_ListaOperacoes'
  ClientHeight = 363
  ClientWidth = 894
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object relListagemOperacoes: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsListagem
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Title = 'Listagem de Opera'#231#245'es de C'#226'mbio'
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
        Left = 0
        Top = 17
        Width = 718
        Height = 13
        Align = faCenterBottom
        Alignment = taCenter
        Caption = 'Listagem das Opera'#231#245'es de C'#226'mbio'
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
        Height = 18
        Align = faLeftTop
        Caption = 'Data Opera'#231#227'o'
        Layout = tlCenter
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 76
        Top = 0
        Width = 23
        Height = 18
        Align = faLeftTop
        Caption = 'Loja'
        Layout = tlCenter
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 294
        Top = 0
        Width = 66
        Height = 18
        Alignment = taRightJustify
        Caption = 'Valor Original'
        Layout = tlCenter
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 380
        Top = 0
        Width = 40
        Height = 18
        Caption = 'Origem'
        Layout = tlCenter
        Transparent = False
      end
      object RLLabel7: TRLLabel
        Left = 429
        Top = 0
        Width = 15
        Height = 18
        Caption = '->'
        Layout = tlCenter
        Transparent = False
      end
      object RLLabel8: TRLLabel
        Left = 453
        Top = 0
        Width = 39
        Height = 18
        Caption = 'Destino'
        Layout = tlCenter
        Transparent = False
      end
      object RLLabel9: TRLLabel
        Left = 635
        Top = 0
        Width = 83
        Height = 18
        Align = faRightTop
        Alignment = taRightJustify
        Caption = 'Valor Convertido'
        Layout = tlCenter
        Transparent = False
      end
      object RLLabel13: TRLLabel
        Left = 99
        Top = 0
        Width = 81
        Height = 18
        Align = faLeftTop
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
        Top = 0
        Width = 78
        Height = 14
        Align = faLeftTop
        Alignment = taCenter
        AutoSize = False
        DataField = 'DATA_OPERACAO'
        DataSource = dsListagem
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 102
        Top = 1
        Width = 233
        Height = 14
        AutoSize = False
        DataField = 'NOME_CLIENTE'
        DataSource = dsListagem
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 268
        Top = 1
        Width = 91
        Height = 13
        Alignment = taRightJustify
        DataField = 'VALOR_ORIGINAL'
        DataSource = dsListagem
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 360
        Top = 0
        Width = 82
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'MOEDA_ORIGEM'
        DataSource = dsListagem
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 432
        Top = 0
        Width = 80
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'MOEDA_DESTINO'
        DataSource = dsListagem
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 626
        Top = 0
        Width = 92
        Height = 14
        Align = faRightTop
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR_CONVERTIDO'
        DataSource = dsListagem
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 78
        Top = 0
        Width = 24
        Height = 13
        Alignment = taCenter
        DataField = 'ID_LOJA'
        DataSource = dsListagem
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
        Left = 198
        Top = 1
        Width = 161
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR_ORIGINAL'
        DataSource = dsListagem
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
        DataField = 'VALOR_CONVERTIDO'
        DataSource = dsListagem
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
  object qryListagem: TFDQuery
    Connection = DM.fbConn
    SQL.Strings = (
      
        'select data_operacao, id_loja, nome_cliente, valor_original, moe' +
        'da_origem,'
      
        'moeda_destino, valor_convertido from operacoes  order by data_op' +
        'eracao')
    Left = 168
    Top = 280
    object qryListagemDATA_OPERACAO: TDateField
      FieldName = 'DATA_OPERACAO'
      Origin = 'DATA_OPERACAO'
    end
    object qryListagemID_LOJA: TIntegerField
      DisplayLabel = 'Loja'
      DisplayWidth = 5
      FieldName = 'ID_LOJA'
      Origin = 'ID_LOJA'
      DisplayFormat = '000'
    end
    object qryListagemNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      Size = 60
    end
    object qryListagemVALOR_ORIGINAL: TFloatField
      FieldName = 'VALOR_ORIGINAL'
      Origin = 'VALOR_ORIGINAL'
      DisplayFormat = ',###,##0.00'
    end
    object qryListagemMOEDA_ORIGEM: TStringField
      FieldName = 'MOEDA_ORIGEM'
      Origin = 'MOEDA_ORIGEM'
      Size = 3
    end
    object qryListagemMOEDA_DESTINO: TStringField
      FieldName = 'MOEDA_DESTINO'
      Origin = 'MOEDA_DESTINO'
      Size = 3
    end
    object qryListagemVALOR_CONVERTIDO: TFloatField
      FieldName = 'VALOR_CONVERTIDO'
      Origin = 'VALOR_CONVERTIDO'
      DisplayFormat = ',###,##0.00'
    end
  end
  object dsListagem: TDataSource
    DataSet = qryListagem
    Left = 104
    Top = 280
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 646
    Top = 46
  end
  object RLPreviewSetup1: TRLPreviewSetup
    Left = 248
    Top = 288
  end
end
