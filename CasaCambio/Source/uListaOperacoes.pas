unit uListaOperacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, RLFilters, RLPDFFilter, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RLPreview, RLPreviewForm;

type
  Trel_ListaOperacoes = class(TForm)
    relListagemOperacoes: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLBand2: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand3: TRLBand;
    lblFiltro: TRLLabel;
    qryListagem: TFDQuery;
    dsListagem: TDataSource;
    RLBand4: TRLBand;
    RLPDFFilter1: TRLPDFFilter;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLBand5: TRLBand;
    RLDBText1: TRLDBText;
    qryListagemDATA_OPERACAO: TDateField;
    qryListagemNOME_CLIENTE: TStringField;
    qryListagemVALOR_ORIGINAL: TFloatField;
    qryListagemMOEDA_ORIGEM: TStringField;
    qryListagemMOEDA_DESTINO: TStringField;
    qryListagemVALOR_CONVERTIDO: TFloatField;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand6: TRLBand;
    RLBand7: TRLBand;
    RLLabel10: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLLabel11: TRLLabel;
    RLPreviewSetup1: TRLPreviewSetup;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    qryListagemID_LOJA: TIntegerField;
    RLDBText7: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rel_ListaOperacoes: Trel_ListaOperacoes;

implementation

{$R *.dfm}

uses uDm;

end.
