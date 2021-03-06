unit uTotalOperacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Trel_TotalOperacoes = class(TForm)
    relTotalOperacoes: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLBand2: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand3: TRLBand;
    lblFiltro: TRLLabel;
    RLBand6: TRLBand;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLBand7: TRLBand;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    dsTotais: TDataSource;
    qryTotais: TFDQuery;
    qryTotaisMOEDA_ORIGEM: TStringField;
    qryTotaisVALORORIGINAL: TFloatField;
    qryTotaisVALORCONVERTIDO: TFloatField;
    qryTotaisTAXACOBRADA: TFloatField;
    RLDBResult1: TRLDBResult;
    qryTotaisID_LOJA: TIntegerField;
    RLGroup1: TRLGroup;
    RLBand8: TRLBand;
    RLLabel6: TRLLabel;
    qryTotaisNOME: TStringField;
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
    qryTotaisCIDADE: TStringField;
    RLLabel13: TRLLabel;
    RLDBText1: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rel_TotalOperacoes: Trel_TotalOperacoes;

implementation

{$R *.dfm}

uses uDm;

end.
