unit uRelTaxasCobradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Trel_TaxasCobradas = class(TForm)
    relTaxasCobradas: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLBand2: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand3: TRLBand;
    lblFiltro: TRLLabel;
    RLBand4: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLBand5: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand6: TRLBand;
    RLLabel10: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLBand7: TRLBand;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    qryTaxas: TFDQuery;
    dsTaxas: TDataSource;
    qryTaxasDATA_OPERACAO: TDateField;
    qryTaxasNOME_CLIENTE: TStringField;
    qryTaxasVALOR_CONVERTIDO: TFloatField;
    qryTaxasTAXA_COBRADA: TFloatField;
    RLLabel5: TRLLabel;
    RLDBText3: TRLDBText;
    qryTaxasID_LOJA: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rel_TaxasCobradas: Trel_TaxasCobradas;

implementation

{$R *.dfm}

uses uDm;

end.
