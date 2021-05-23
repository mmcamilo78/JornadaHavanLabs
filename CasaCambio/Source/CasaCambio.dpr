program CasaCambio;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uMoedasIncAlt in 'uMoedasIncAlt.pas' {frmMoedasIncAlt},
  uDm in 'uDm.pas' {DM: TDataModule},
  uImporta in 'uImporta.pas' {frmImporta},
  uCotacaoIncAlt in 'uCotacaoIncAlt.pas' {frmCotacaoIncAlt},
  uLocalizaMoedas in 'uLocalizaMoedas.pas' {frmLocalizaMoedas},
  calculadora in 'calculadora.pas' {frmCalculadora},
  uOperacoesIncAlt in 'uOperacoesIncAlt.pas' {frmOperacoesIncAlt},
  Vcl.Themes,
  Vcl.Styles,
  uRelatorios in 'uRelatorios.pas' {frmRelatorios},
  uListaOperacoes in 'uListaOperacoes.pas' {rel_ListaOperacoes},
  uRelTaxasCobradas in 'uRelTaxasCobradas.pas' {rel_TaxasCobradas},
  uTotalOperacoes in 'uTotalOperacoes.pas' {rel_TotalOperacoes},
  uLojasIncAlt in 'uLojasIncAlt.pas' {frmLojasIncAlt},
  uOperacoesLoja in 'uOperacoesLoja.pas' {rel_OperacoesLoja};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Trel_ListaOperacoes, rel_ListaOperacoes);
  Application.CreateForm(Trel_TaxasCobradas, rel_TaxasCobradas);
  Application.CreateForm(Trel_TotalOperacoes, rel_TotalOperacoes);
  Application.CreateForm(Trel_OperacoesLoja, rel_OperacoesLoja);
  Application.Run;
end.
