unit uOperacoesLoja;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Trel_OperacoesLoja = class(TForm)
    relOperacoesLoja: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLBand2: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand3: TRLBand;
    lblFiltro: TRLLabel;
    dsTotais: TDataSource;
    qryTotais: TFDQuery;
    qryTotaisID_LOJA: TIntegerField;
    qryTotaisMOEDA_ORIGEM: TStringField;
    qryTotaisNOME: TStringField;
    qryTotaisVALOR_ORIGINAL: TFloatField;
    qryTotaisMOEDA_DESTINO: TStringField;
    qryTotaisVALOR_COTACAO: TFloatField;
    qryTotaisVALOR_CONVERTIDO: TFloatField;
    qryTotaisTAXA_COBRADA: TFloatField;
    qryTotaisDATA_OPERACAO: TDateField;
    qryTotaisNOME_CLIENTE: TStringField;
    RLGroup1: TRLGroup;
    RLBand8: TRLBand;
    RLLabel6: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText7: TRLDBText;
    RLBand4: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel5: TRLLabel;
    RLBand5: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText3: TRLDBText;
    RLBand9: TRLBand;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLLabel3: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLBand6: TRLBand;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult1: TRLDBResult;
    RLLabel14: TRLLabel;
    RLBand7: TRLBand;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    qryTotaisCIDADE: TStringField;
    RLLabel17: TRLLabel;
    RLDBText11: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rel_OperacoesLoja: Trel_OperacoesLoja;

implementation

{$R *.dfm}

uses uDm;

end.
