object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 206
  Width = 392
  object fbConn: TFDConnection
    Params.Strings = (
      'Database=C:\Softwares\CasaCambio\BD\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'DriverID=FB')
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 56
    Top = 88
  end
  object qryCotacoes: TFDQuery
    Connection = fbConn
    SQL.Strings = (
      'select * from cotacoes')
    Left = 176
    Top = 104
    object qryCotacoesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryCotacoesDATA_COTACAO: TDateField
      FieldName = 'DATA_COTACAO'
      Origin = 'DATA_COTACAO'
    end
    object qryCotacoesCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
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
  object qryOperacoes: TFDQuery
    Connection = fbConn
    SQL.Strings = (
      'select * from operacoes')
    Left = 256
    Top = 104
    object qryOperacoesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryOperacoesNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      Size = 60
    end
    object qryOperacoesMOEDA_ORIGEM: TStringField
      FieldName = 'MOEDA_ORIGEM'
      Origin = 'MOEDA_ORIGEM'
      Size = 3
    end
    object qryOperacoesMOEDA_DESTINO: TStringField
      FieldName = 'MOEDA_DESTINO'
      Origin = 'MOEDA_DESTINO'
      Size = 3
    end
    object qryOperacoesDATA_OPERACAO: TDateField
      FieldName = 'DATA_OPERACAO'
      Origin = 'DATA_OPERACAO'
    end
    object qryOperacoesVALOR_ORIGINAL: TFloatField
      FieldName = 'VALOR_ORIGINAL'
      Origin = 'VALOR_ORIGINAL'
    end
    object qryOperacoesVALOR_CONVERTIDO: TFloatField
      FieldName = 'VALOR_CONVERTIDO'
      Origin = 'VALOR_CONVERTIDO'
    end
    object qryOperacoesTAXA_COBRADA: TFloatField
      FieldName = 'TAXA_COBRADA'
      Origin = 'TAXA_COBRADA'
    end
  end
  object qryAux: TFDQuery
    Connection = fbConn
    Left = 328
    Top = 80
  end
  object qryMoedas: TFDQuery
    Connection = fbConn
    SQL.Strings = (
      'select * from moedas')
    Left = 256
    Top = 48
    object qryMoedasID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryMoedasCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object qryMoedasNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object qryMoedasSIMBOLO: TStringField
      FieldName = 'SIMBOLO'
      Origin = 'SIMBOLO'
      Size = 10
    end
    object qryMoedasCOD_PAIS: TSmallintField
      FieldName = 'COD_PAIS'
      Origin = 'COD_PAIS'
    end
    object qryMoedasPAIS: TStringField
      FieldName = 'PAIS'
      Origin = 'PAIS'
      Size = 50
    end
    object qryMoedasTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object qryLojas: TFDQuery
    Connection = fbConn
    SQL.Strings = (
      'select * from lojas order by id')
    Left = 176
    Top = 43
    object qryLojasID: TIntegerField
      DisplayLabel = 'Loja'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryLojasNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 40
    end
    object qryLojasCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object qryLojasUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 144
  end
end
