{
  Projeto..: Desafio Programa??o - Jornada Labs HAVAN - PROWAY
  Candidato: M?rcio Moreira Camilo
  Telefone.: (47)98867-7130
  E-mail...: mmcamilo@gmail.com
  Data.....: 14/05/2021

             Programa desenvolvido atrav?s do RadStudio 10.3
             Utilizado Banco de Dados Firebird-2.5.8.27089_0_Win32
             Banco: CASACAMBIO
             Tabelas: MOEDAS, COTACOES, OPERACOES
}


unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.pngimage;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl: TPageControl;
    tabCotacoes: TTabSheet;
    tabOperacoes: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnImportarCotacaoBCB: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    dsCotacoes: TDataSource;
    qryCotacoes: TFDQuery;
    qryCotacoesID: TIntegerField;
    qryCotacoesDATA_COTACAO: TDateField;
    qryCotacoesCODIGO: TSmallintField;
    qryCotacoesTAXA_COMPRA: TFloatField;
    qryCotacoesTAXA_VENDA: TFloatField;
    qryCotacoesPARIDADE_COMPRA: TFloatField;
    qryCotacoesPARIDADE_VENDA: TFloatField;
    Panel5: TPanel;
    Label4: TLabel;
    dtCotacao: TDateTimePicker;
    qryMoedas: TFDQuery;
    tabMoedas: TTabSheet;
    Panel6: TPanel;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Panel7: TPanel;
    Panel8: TPanel;
    DBGrid2: TDBGrid;
    dsMoedas: TDataSource;
    qryMoedasID: TIntegerField;
    qryMoedasCODIGO: TSmallintField;
    qryMoedasNOME: TStringField;
    qryMoedasSIMBOLO: TStringField;
    qryMoedasCOD_PAIS: TSmallintField;
    qryMoedasPAIS: TStringField;
    qryMoedasTIPO: TStringField;
    GroupBox1: TGroupBox;
    edtLocalizarMoedas: TEdit;
    qryCotacoesNOME: TStringField;
    qryCotacoesSIMBOLO: TStringField;
    qryCotacoesTIPO: TStringField;
    btnCalculadora: TButton;
    Panel9: TPanel;
    Panel10: TPanel;
    DBGrid3: TDBGrid;
    dsOperacoes: TDataSource;
    qryOperacoes: TFDQuery;
    btnIncluirOp: TButton;
    btnExcluirOp: TButton;
    btnAlterarOp: TButton;
    btnImprimirOp: TButton;
    qryOperacoesID: TIntegerField;
    qryOperacoesNOME_CLIENTE: TStringField;
    qryOperacoesMOEDA_ORIGEM: TStringField;
    qryOperacoesMOEDA_DESTINO: TStringField;
    qryOperacoesDATA_OPERACAO: TDateField;
    qryOperacoesVALOR_ORIGINAL: TFloatField;
    qryOperacoesVALOR_CONVERTIDO: TFloatField;
    qryOperacoesTAXA_COBRADA: TFloatField;
    qryOperacoesVALOR_COTACAO: TFloatField;
    qryOperacoesIND_CBBMOEDA: TSmallintField;
    qryOperacoesCODIGO_MOEDA_ORIGEM: TSmallintField;
    qryOperacoesCODIGO_MOEDA_DESTINO: TSmallintField;
    Panel11: TPanel;
    lblTotalValorOriginal: TLabel;
    lblTotalValorConvertido: TLabel;
    lblTotalTaxas: TLabel;
    qryTotais: TFDQuery;
    qryTotaisVALORORIGINAL: TFloatField;
    qryTotaisVALORCONVERTIDO: TFloatField;
    qryTotaisTAXACOBRADA: TFloatField;
    edtPesquisa: TEdit;
    lblFiltro: TLabel;
    tabLojas: TTabSheet;
    Panel12: TPanel;
    btnExcluirLoja: TButton;
    btnAlterarLoja: TButton;
    btnIncluirLoja: TButton;
    Panel13: TPanel;
    GroupBox2: TGroupBox;
    edtLocalizarLoja: TEdit;
    Panel14: TPanel;
    DBGrid4: TDBGrid;
    qryLojas: TFDQuery;
    dsLojas: TDataSource;
    qryLojasID: TIntegerField;
    qryLojasNOME: TStringField;
    qryLojasCIDADE: TStringField;
    qryLojasUF: TStringField;
    qryOperacoesID_LOJA: TIntegerField;
    qryOperacoesNOMELOJA: TStringField;
    Panel16: TPanel;
    Panel15: TPanel;
    Button5: TButton;
    Image1: TImage;
    Bevel1: TBevel;
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure dtCotacaoChange(Sender: TObject);
    procedure btnImportarCotacaoBCBClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure edtLocalizarMoedasChange(Sender: TObject);
    procedure btnCalculadoraClick(Sender: TObject);
    procedure btnExcluirOpClick(Sender: TObject);
    procedure btnIncluirOpClick(Sender: TObject);
    procedure btnAlterarOpClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure edtPesquisaChange(Sender: TObject);
    procedure btnImprimirOpClick(Sender: TObject);
    procedure btnExcluirLojaClick(Sender: TObject);
    procedure btnIncluirLojaClick(Sender: TObject);
    procedure btnAlterarLojaClick(Sender: TObject);
    procedure edtLocalizarLojaChange(Sender: TObject);
  private
    { Private declarations }

  wOrdem, wCondicao : string;

  public
    { Public declarations }

    procedure AtualizarLojas;
    procedure AtualizarMoedas;
    procedure AtualizarCotacoes;
    procedure AtualizarOperacoes;
    procedure AtualizarTotais;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uMoedasIncAlt, uDm, uImporta, uCotacaoIncAlt, calculadora,
  uOperacoesIncAlt, uRelatorios, uLojasIncAlt;

procedure TfrmPrincipal.AtualizarCotacoes;
begin
  // Query respons?vel pelos campos LookUp na tela de Cota??o de Moedas
  AtualizarMoedas;

  // Atualiza as informa??es do grid na tela de Cota??o de Moedas
  with qryCotacoes do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from cotacoes where data_cotacao = :data_cotacao');
    Params.ParamByName('data_cotacao').Value :=  StringReplace(DateToStr(dtCotacao.Date), '/', '.', [rfReplaceAll]);
    Open;
  end;
end;

procedure TfrmPrincipal.AtualizarLojas;
begin
  with qryLojas do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from lojas order by id');
    Open;
  end;
end;

procedure TfrmPrincipal.AtualizarMoedas;
begin
  with qryMoedas do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from moedas order by nome');
    Open;
  end;
end;

procedure TfrmPrincipal.AtualizarOperacoes;
begin
  with qryOperacoes do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from operacoes order by data_operacao desc');
    Open;
  end;
end;

procedure TfrmPrincipal.AtualizarTotais;
begin
  // Totalizador das informa??es de tela em Opera??es de C?mbio
  with qryTotais do
  begin
    close;
    SQL.Clear;
    SQL.Add('select sum(valor_original) as valorOriginal, sum(valor_convertido) as valorConvertido, '+
            'sum(taxa_cobrada) as taxaCobrada from operacoes');

    if not wCondicao.IsEmpty then
    SQL.Add(' where ' + wOrdem + ' LIKE ' + QuotedStr('%' + edtPesquisa.Text + '%') );

    Open;
  end;

  lblTotalValorOriginal.Caption   := FormatFloat('#,###,##0.00', qryTotaisVALORORIGINAL.Value);
  lblTotalValorConvertido.Caption := FormatFloat('#,###,##0.00', qryTotaisVALORCONVERTIDO.Value);
  lblTotalTaxas.Caption           := FormatFloat('#,###,##0.00', qryTotaisTAXACOBRADA.Value);
end;

procedure TfrmPrincipal.btnImportarCotacaoBCBClick(Sender: TObject);
begin
  if qryCotacoes.RecordCount = 0 then
  Application.MessageBox('Nenhuma Moeda foi inclu?da para cota??o na data selecionada. Nesse caso voc? poder? fazer o Download de todas as moedas dispon?veis no reposit?rio do BCB.','Cota??o de Moedas',MB_ICONINFORMATION);

  try
    frmImporta := TfrmImporta.Create(Owner);
    frmImporta.Tag := 1;
    frmImporta.ShowModal;
  finally
    frmImporta.Free;
  end;
end;

procedure TfrmPrincipal.btnImprimirOpClick(Sender: TObject);
begin
  try
    frmRelatorios := TfrmRelatorios.Create(Owner);
    frmRelatorios.Tag := 1;
    frmRelatorios.ShowModal;
  finally
    frmRelatorios.Free;
  end;
end;

procedure TfrmPrincipal.btnIncluirLojaClick(Sender: TObject);
begin
  try
    frmLojasIncAlt := TfrmLojasIncAlt.Create(Owner);
    frmLojasIncAlt.Tag := 1;
    frmLojasIncAlt.ShowModal;
  finally
    frmLojasIncAlt.Free;
  end;
end;

procedure TfrmPrincipal.btnIncluirOpClick(Sender: TObject);
begin
  try
    frmOperacoesIncAlt := TfrmOperacoesIncAlt.Create(Owner);
    frmOperacoesIncAlt.Tag := 1;
    frmOperacoesIncAlt.ShowModal;
  finally
    frmOperacoesIncAlt.Free;
  end;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  if qryCotacoes.RecordCount = 0 then
  begin
    Application.MessageBox('Nenhum registro a ser exclu?do.','Cota??o de Moedas',MB_ICONINFORMATION);
    Exit;
  end;

  if Application.MessageBox('Confirma a exclus?o do registro selecionado?','Cota??o de Moedas',MB_YESNO+MB_ICONQUESTION) = IDYES then
  begin
    try
      if not Dm.fbConn.InTransaction then
      Dm.fbConn.StartTransaction;

      with Dm.qryCotacoes do
      begin
        Close;
        SQL.Clear;
        SQL.Add('delete from cotacoes where id = :id');
        Params.ParamByName('id').Value := qryCotacoesID.Value;
        ExecSQL;
      end;

      try
        Dm.fbConn.Commit;
        qryCotacoes.Refresh;
      except
        Dm.fbConn.Rollback;
      end;
    except
      Application.MessageBox('O registro selecionado para exclus?o possui informa??es vinculadas nas Opera??es de C?mbio.','Moedas de C?mbio',MB_ICONERROR);
    end;
  end;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  try
    frmCotacaoIncAlt := TfrmCotacaoIncAlt.Create(Owner);
    frmCotacaoIncAlt.Tag := 2;
    frmCotacaoIncAlt.ShowModal;
  finally
    frmCotacaoIncAlt.Free;
  end;
end;

procedure TfrmPrincipal.Button4Click(Sender: TObject);
begin
  try
    frmCotacaoIncAlt := TfrmCotacaoIncAlt.Create(Owner);
    frmCotacaoIncAlt.Tag := 1;
    frmCotacaoIncAlt.ShowModal;
  finally
    frmCotacaoIncAlt.Free;
  end;
end;

procedure TfrmPrincipal.Button5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPrincipal.btnAlterarLojaClick(Sender: TObject);
begin
  try
    frmLojasIncAlt := TfrmLojasIncAlt.Create(Owner);
    frmLojasIncAlt.Tag := 2;
    frmLojasIncAlt.ShowModal;
  finally
    frmLojasIncAlt.Free;
  end;
end;

procedure TfrmPrincipal.btnAlterarOpClick(Sender: TObject);
begin
  try
    frmOperacoesIncAlt := TfrmOperacoesIncAlt.Create(Owner);
    frmOperacoesIncAlt.Tag := 2;
    frmOperacoesIncAlt.ShowModal;
  finally
    frmOperacoesIncAlt.Free;
  end;
end;

procedure TfrmPrincipal.btnCalculadoraClick(Sender: TObject);
begin
  try
    frmCalculadora := TfrmCalculadora.Create(Owner);
    frmCalculadora.Tag := 1;
    frmCalculadora.ShowModal;
  finally
    frmCalculadora.Free;
  end;
end;

procedure TfrmPrincipal.btnExcluirLojaClick(Sender: TObject);
begin
  if qryLojas.RecordCount = 0 then
  begin
    Application.MessageBox('Nenhum registro a ser exclu?do.','Lojas de C?mbio',MB_ICONINFORMATION);
    Exit;
  end;

  if Application.MessageBox('Confirma a exclus?o do registro selecionado?','Lojas de C?mbio',MB_YESNO+MB_ICONQUESTION) = IDYES then
  begin
    try

      if not Dm.fbConn.InTransaction then
      Dm.fbConn.StartTransaction;
      with Dm.qryLojas do
      begin
        Close;
        SQL.Clear;
        SQL.Add('delete from lojas where id = :id');
        Params.ParamByName('id').Value := qryLojasID.Value;
        ExecSQL;
      end;

      try
        Dm.fbConn.Commit;
        qryLojas.Refresh;
      except
        Dm.fbConn.Rollback;
      end;
    except
      Application.MessageBox('A loja selecionada para exclus?o possui informa??es vinculadas nas Opera??es de C?mbio.','Moedas de C?mbio',MB_ICONERROR);
    end;
  end;

end;

procedure TfrmPrincipal.btnExcluirOpClick(Sender: TObject);
begin
  if qryOperacoes.RecordCount = 0 then
  begin
    Application.MessageBox('Nenhum registro a ser exclu?do.','Opera??es de C?mbio',MB_ICONINFORMATION);
    Exit;
  end;

  if Application.MessageBox('Confirma a exclus?o do registro selecionado?','Opera??es de C?mbio',MB_YESNO+MB_ICONQUESTION) = IDYES then
  begin
    if not Dm.fbConn.InTransaction then
    Dm.fbConn.StartTransaction;

    with Dm.qryOperacoes do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from operacoes where id = :id');
      Params.ParamByName('id').Value := qryOperacoesID.Value;
      ExecSQL;
    end;

    try
      Dm.fbConn.Commit;
      qryOperacoes.Refresh;
      AtualizarTotais;
    except
      Dm.fbConn.Rollback;
    end;
  end;
end;

procedure TfrmPrincipal.Button7Click(Sender: TObject);
begin
  if qryMoedas.RecordCount = 0 then
  begin
    Application.MessageBox('Nenhum registro a ser exclu?do.','Moedas de C?mbio',MB_ICONINFORMATION);
    Exit;
  end;

  if Application.MessageBox('Confirma a exclus?o do registro selecionado?','Moedas de C?mbio',MB_YESNO+MB_ICONQUESTION) = IDYES then
  begin
    try
      if not Dm.fbConn.InTransaction then
      Dm.fbConn.StartTransaction;

      with Dm.qryMoedas do
      begin
        Close;
        SQL.Clear;
        SQL.Add('delete from moedas where id = :id');
        Params.ParamByName('id').Value := qryMoedasID.Value;
        ExecSQL;
      end;

      try
        Dm.fbConn.Commit;
        qryMoedas.Refresh;
      except
        Dm.fbConn.Rollback;
      end;
    except
      Application.MessageBox('A Moeda selecionada para exclus?o possui informa??es vinculadas nas Opera??es de C?mbio.','Moedas de C?mbio',MB_ICONERROR);
    end;
  end;

end;

procedure TfrmPrincipal.Button8Click(Sender: TObject);
begin
  try
    frmMoedasIncAlt := TfrmMoedasIncAlt.Create(Owner);
    frmMoedasIncAlt.Tag := 2;
    frmMoedasIncAlt.ShowModal;
  finally
    frmMoedasIncAlt.Free;
  end;
end;

procedure TfrmPrincipal.Button9Click(Sender: TObject);
begin
  try
    frmMoedasIncAlt := TfrmMoedasIncAlt.Create(Owner);
    frmMoedasIncAlt.Tag := 1;
    frmMoedasIncAlt.ShowModal;
  finally
    frmMoedasIncAlt.Free;
  end;
end;

procedure TfrmPrincipal.DBGrid1TitleClick(Column: TColumn);
begin
  // Ordenar as informa??es do Grid na tela de Cota??o de Moedas
  if Column.Field.FieldKind = fkData then
  begin
    with qryCotacoes do
    begin
      if IndexFieldNames = Column.FieldName + ':A' then
        IndexFieldNames := Column.FieldName + ':D'
      else
      IndexFieldNames := Column.FieldName + ':A';
    end;
  end;
end;

procedure TfrmPrincipal.DBGrid2TitleClick(Column: TColumn);
begin
  // Ordenar as informa??es do Grid na tela de Moedas de C?mbio
  if Column.Field.FieldKind = fkData then
  begin
    with qryMoedas do
    begin
      if IndexFieldNames = Column.FieldName + ':A' then
        IndexFieldNames := Column.FieldName + ':D'
      else
      IndexFieldNames := Column.FieldName + ':A';
    end;
  end;
end;

procedure TfrmPrincipal.DBGrid3TitleClick(Column: TColumn);
begin
  // Ordenar as informa??es do Grid na tela de Opera??es de C?mbio
  if Column.Field.FieldKind = fkData then
  begin
    wOrdem := '';
    wOrdem := Column.FieldName;

    lblFiltro.Caption := 'Filtrar informa??es por [ ' + wOrdem + ' ]';

    with qryOperacoes do
    begin
      if IndexFieldNames = Column.FieldName + ':A' then
        IndexFieldNames := Column.FieldName + ':D'
      else
      IndexFieldNames := Column.FieldName + ':A';
    end;

    edtPesquisa.Clear;
    edtPesquisa.SetFocus;
  end;
end;

procedure TfrmPrincipal.dtCotacaoChange(Sender: TObject);
begin
  AtualizarCotacoes;
end;

procedure TfrmPrincipal.edtPesquisaChange(Sender: TObject);
begin
  wCondicao := wOrdem;
  AtualizarTotais;

  qryOperacoes.Filtered := False;
  qryOperacoes.Filter   := wOrdem + ' LIKE ' + QuotedStr('%' + edtPesquisa.Text + '%');
  qryOperacoes.Filtered := True;
end;

procedure TfrmPrincipal.edtLocalizarMoedasChange(Sender: TObject);
begin
  if Length(Trim(edtLocalizarMoedas.Text)) > 0 then
  begin
    qryMoedas.Filtered := False;
    qryMoedas.Filter   := 'NOME LIKE ' + QuotedStr('%' + edtLocalizarMoedas.Text + '%');
    qryMoedas.Filtered := True;
  end
  else
  qryMoedas.Filtered := False;
end;

procedure TfrmPrincipal.edtLocalizarLojaChange(Sender: TObject);
begin
  if Length(Trim(edtLocalizarLoja.Text)) > 0 then
  begin
    qryLojas.Filtered := False;
    qryLojas.Filter   := 'NOME LIKE ' + QuotedStr('%' + edtLocalizarLoja.Text + '%');
    qryLojas.Filtered := True;
  end
  else
  qryLojas.Filtered := False;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  dtCotacao.Date := Date;
  PageControlChange(Sender);
end;

procedure TfrmPrincipal.PageControlChange(Sender: TObject);
begin
  case PageControl.TabIndex of
    0 : AtualizarLojas;
    1 : AtualizarMoedas;
    2 : AtualizarCotacoes;
  end;

  if PageControl.TabIndex = 3 then
  begin
    wOrdem := 'DATA_OPERACAO';
    AtualizarOperacoes;
    AtualizarTotais;
  end;

end;

end.
