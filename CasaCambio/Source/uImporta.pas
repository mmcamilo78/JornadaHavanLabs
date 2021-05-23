{
  Projeto..: Desafio Programação - Jornada Labs HAVAN - PROWAY
  Candidato: Márcio Moreira Camilo
  Telefone.: (47)98867-7130
  E-mail...: mmcamilo@gmail.com
  Data.....: 18/05/2021

  Parte Extra - Importação dos Valores de Cotação das Moedas no Banco Central do Brasil

                Essa rotina viza dar celeridade quanto a aquisição das taxas de cada moeda que
                será utilizada no processo de conversão.

                Com base em uma data onde há movimentação de câmbio (geralmente em dias úteis)
                o aplicativo faz uma requisição de arquivo .CSV no BCB através do link
                https://www.bcb.gov.br/estabilidadefinanceira/cotacoestodas e ao retornar
                realiza-se o tratamento das informações obtidas pelo arquivo que alem de
                gravá-lo em uma determinada pasta, as informações são gravadas na tabela
                específica.

                O retorno das cotações pode ser apenas para as moedas pré-determinadas pelo
                usuário e com disponibilidade das mesmas no arquivo do BCB, ou se preferir
                poderá retornar todas as moedas e cotações disponíveis de acordo com a data
                de Cotação definida pelo usuário.

                [ ] Importar Todas as moedas disponíveis no BCB / Arquivo .CSV

                Existe ainda a possíbilidade de importar o arquivo .CSV [padrão do BCB]
                caso o arquivo seja obtido de outra forma.
                [ ] Importar arquivo .CSV já retornado

}

unit uImporta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, urlmon, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, WinInet,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids;

type
  TfrmImporta = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    dtCotacao: TDateTimePicker;
    btnImportar: TButton;
    pnlRetorno: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    chkFecharAoConcluir: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    cdsMoedas: TClientDataSet;
    Panel3: TPanel;
    Button2: TButton;
    Panel4: TPanel;
    cdsMoedasdata_cotacao: TDateField;
    cdsMoedascodigo: TStringField;
    cdsMoedasmoeda: TStringField;
    cdsMoedasdescricao: TStringField;
    cdsMoedastaxa_compra: TFloatField;
    cdsMoedastaxa_venda: TFloatField;
    cdsMoedasparidade_compra: TFloatField;
    cdsMoedasparidade_venda: TFloatField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    cdsMoedastipo: TStringField;
    chkImportarArquivo: TCheckBox;
    opdArquivo: TOpenDialog;
    chkImportarTodas: TCheckBox;
    procedure Button2Click(Sender: TObject);

    function RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;
    function RetornaKiloBytes(ValorAtual: real): string;
    procedure IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure btnImportarClick(Sender: TObject);
    procedure dtCotacaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkImportarTodasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImporta: TfrmImporta;

implementation

{$R *.dfm}

uses uDm, uPrincipal;


{
  Function para retornar o arquivo CSV com as cotações das moedas de acordo
  com a data selecionada pelo usuário
}

function DownloadArquivo(const Origem, Destino: String): Boolean;
const BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  f: File;
  sAppName: string;
begin
  Result   := False;
  sAppName := ExtractFileName(Application.ExeName);
  hSession := InternetOpen(PChar(sAppName),
              INTERNET_OPEN_TYPE_PRECONFIG,
              nil, nil, 0);
  try
    hURL := InternetOpenURL(hSession,
              PChar(Origem),
              nil,0,0,0);
     try
        AssignFile(f, Destino);
        Rewrite(f,1);
        repeat
          InternetReadFile(hURL, @Buffer,
                           SizeOf(Buffer), BufferLen);
          BlockWrite(f, Buffer, BufferLen)
        until BufferLen = 0;
        CloseFile(f);
        Result:=True;
     finally
         InternetCloseHandle(hURL)
      end
   finally
    InternetCloseHandle(hSession)
   end

end;

procedure TfrmImporta.btnImportarClick(Sender: TObject);
var
  uData, uUrl, uDestino, uPath, uPasta : String;
  uValorCompra, uValorVenda : Double;
  DataFile : TextFile;
  lineFile : String;
  fileStrings : TStringList;

begin
  uPath := '';
  uPath := ExtractFilePath(Application.ExeName);

  // Validando data se é dia útil

  if (DayOfWeek(dtcotacao.Date) = 1) or   //Domingo
     (DayOfWeek(dtcotacao.Date) = 7)      //Sabado
  then
  begin
    Application.MessageBox('O dia selecionado não é dia útil.','Atenção',MB_ICONINFORMATION);
    dtCotacao.SetFocus;
    Exit;
  end;

  pnlRetorno.Visible := True;

  // Ajustando o formado da data selecionada pelo usuário para obtenção do arquivo .CSV
  // Banco Central do Brasil passando pela Url abaixo

  uData := '';
  uData := FormatDateTime('yyyy/mm/dd',dtCotacao.Date);
  uData := StringReplace(uData,'/','',[rfReplaceAll]);

  uUrl := '';
  uUrl := 'http://www4.bcb.gov.br/Download/fechamento/'+ uData + '.csv';


  Label6.Caption := uUrl;

  try
    uDestino := '';
    uDestino := uPath + 'Arquivos\' + uData + '.csv';

    uPasta := '';
    uPasta := uPath + 'Arquivos\';

    ProgressBar1.Visible := True;
    Label4.Visible       := True;
    Label5.Visible       := True;
    btnImportar.Enabled  := False;

    cdsMoedas.LoadFromFile(uPath + 'BD\cotacoes.xml');

    // Se já existir um arquivo .CSV no padrão do BCB ele pode ser importado

    if chkImportarArquivo.Checked = True then
    begin
      opdArquivo.DefaultExt :='*.CSV';
      opdArquivo.InitialDir := uPasta;
      opdArquivo.FileName   := uDestino;

      if opdArquivo.Execute then
        uDestino := opdArquivo.FileName
      else
      uDestino := '';
    end
    else
    begin
      // Senão o download do arquivo .CSV com as cotações das moedas de acordo com a data
      // selecionada pelo usuário será retornado abaixo
      try
        if DownloadArquivo(uURL, uDestino) then
        begin
          Application.ProcessMessages;

          ProgressBar1.Position := 100;
          Label4.Caption := 'Arquivo de Cotações obtido com sucesso...';
        end
        else
        begin
          Application.MessageBox('Falha ao obter o arquivo no Banco Central do Brasil. Verifique a conexão com a internet e tente novamente.','Atenção',MB_ICONINFORMATION);
          Exit;
        end;
      except
        Application.MessageBox('Não foi possível abrir o arquivo informado, verifique se o mesmo já não está em uso.','Atenção',MB_ICONINFORMATION);
        Exit;
      end;

    end;

    //Checando se o arquivo foi carregado

    if Length(Trim(uDestino)) = 0 then
    begin
      Application.MessageBox('Arquivo .CSV não localizado ou ainda não baixado do BCB.'+#13+'Verifique a existência do arquivo em seu computador, caso não encontre, realize nova importação do BCB.','Atenção',MB_ICONINFORMATION);
      Exit;
    end;

    cdsMoedas.Active := True;
    cdsmoedas.EmptyDataSet;

    // Após a obtenção do arquivo a tradução do arquivo será realizada
    try
      AssignFile(DataFile, uDestino);
      Reset(DataFile);
      try

        Label4.Caption := 'Traduzindo o arquivo CSV...';
        fileStrings := TStringList.Create;
        try
          ProgressBar1.Position := 0;
          ProgressBar1.Max := fileStrings.Count;

          while not EOF (DataFile) do
          begin
            Readln(DataFile, lineFile);
            ExtractStrings([';'],[' '],PChar(lineFile),fileStrings);

            with cdsMoedas do
            begin
              Insert;
              cdsMoedasdata_cotacao.Value    := StrToDate(fileStrings[0]);
              cdsMoedascodigo.Value          := fileStrings[1];
              cdsMoedastipo.Value            := fileStrings[2];
              cdsMoedasmoeda.Value           := fileStrings[3];
              cdsMoedastaxa_compra.Value     := fileStrings[4].ToDouble;
              cdsMoedastaxa_venda.Value      := fileStrings[5].ToDouble;
              cdsMoedasparidade_compra.Value := fileStrings[6].ToDouble;
              cdsMoedasparidade_venda.Value  := fileStrings[7].ToDouble;

              cdsMoedas.Post;
            end;

            ProgressBar1.Position := ProgressBar1.Position + 1;
            fileStrings.Clear;
          end;
        finally
          fileStrings.Free;
        end;
      finally
        CloseFile(DataFile);
      end;
    except
      Application.MessageBox('Arquivo de Cotação das Moedas não disponível no momento.'+#13+
                             'Causas prováveis:'+#13+
                             '- Falha na conexão com a internet'+#13+
                             '- Não é um dia útil'+#13+
                             '- Mercado financeiro de cotação fechado no momento.'
                             ,'Cotação de Moedas',MB_ICONEXCLAMATION);
    end;

    Label4.Caption   := 'Tradução do arquivo CSV concluída...';
    cdsMoedas.Active := False;
    cdsMoedas.Active := True;

    Label4.Caption   := 'Populando tabela de Moedas e Cotações...';

    ProgressBar1.Position := 0;
    ProgressBar1.Max := cdsMoedas.RecordCount;

    cdsMoedas.First;
    while not cdsMoedas.Eof do
    begin
      if cdsMoedascodigo.Value = '220' then
      begin
        uValorCompra := 0;
        uValorCompra := cdsMoedastaxa_compra.Value;

        uValorVenda := 0;
        uValorVenda := cdsMoedastaxa_venda.Value;
      end;


      with Dm.qryAux do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select data_cotacao, codigo from cotacoes where data_cotacao = :data_cotacao and codigo = :codigo');
        Params.ParamByName('data_cotacao').Value := StringReplace(cdsMoedasdata_cotacao.AsString,'/','.',[rfReplaceAll]);
        Params.ParamByName('codigo').Value       := cdsMoedascodigo.Value;
        Open;
      end;

      if not DM.fbConn.InTransaction then
      Dm.fbConn.StartTransaction;

      if not Dm.qryAux.eof then
      begin

        // Se a opção de retorar todas as moedas não estiver marcada, apenas as moedas pré-definidas para
        // cotação serão atualizadas

        with Dm.qryCotacoes do
        begin
          Close;
          SQL.Clear;
          SQL.Add('update cotacoes set '+
                  'taxa_compra = :taxa_compra, taxa_venda = :taxa_venda, paridade_compra = :paridade_compra, '+
                  'paridade_venda = :paridade_venda where data_cotacao = :data_cotacao and codigo = :codigo');

          Params.ParamByName('data_cotacao').Value    := StringReplace(cdsMoedasdata_cotacao.AsString, '/', '.', [rfReplaceAll]);
          Params.ParamByName('codigo').Value          := cdsMoedascodigo.Value;
          Params.ParamByName('taxa_compra').Value     := cdsMoedastaxa_compra.Value;
          Params.ParamByName('taxa_venda').Value      := cdsMoedastaxa_venda.Value;
          Params.ParamByName('paridade_compra').Value := cdsMoedasparidade_compra.Value;
          Params.ParamByName('paridade_venda').Value  := cdsMoedasparidade_venda.Value;

          ExecSQL;
        end;
      end
      else
      if chkImportarTodas.Checked = True then
      begin

        // Se a opção estiver marcada, todas as moedas disponiveis no BCB e retornadas no arquivo serão
        // disponibilizadas para cotação e operações de câmbio

        with Dm.qryCotacoes do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into cotacoes (');
          SQL.Add('data_cotacao, codigo, taxa_compra, taxa_venda, paridade_compra, paridade_venda');
          SQL.Add(') values (');
          SQL.Add(':data_cotacao, :codigo, :taxa_compra, :taxa_venda, :paridade_compra, :paridade_venda)');
          Params.ParamByName('data_cotacao').Value    := StringReplace(cdsMoedasdata_cotacao.AsString, '/', '.', [rfReplaceAll]);
          Params.ParamByName('codigo').Value          := cdsMoedascodigo.Value;
          Params.ParamByName('taxa_compra').Value     := cdsMoedastaxa_compra.Value;
          Params.ParamByName('taxa_venda').Value      := cdsMoedastaxa_venda.Value;
          Params.ParamByName('paridade_compra').Value := cdsMoedasparidade_compra.Value;
          Params.ParamByName('paridade_venda').Value  := cdsMoedasparidade_venda.Value;
          ExecSQL;
        end;
      end;

      ProgressBar1.Position := ProgressBar1.Position + 1;
      cdsMoedas.Next;
    end;

    //Atualizar o BRL se houver já que o BCB não retorna no arquivo CSV
    with Dm.qryCotacoes do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update cotacoes set '+
              'taxa_compra = :taxa_compra, taxa_venda = :taxa_venda, paridade_compra = :paridade_compra, '+
              'paridade_venda = :paridade_venda where data_cotacao = :data_cotacao and codigo = :codigo');

      Params.ParamByName('data_cotacao').Value    := StringReplace(cdsMoedasdata_cotacao.AsString, '/', '.', [rfReplaceAll]);
      Params.ParamByName('codigo').Value          := '790';
      Params.ParamByName('taxa_compra').Value     := 1;
      Params.ParamByName('taxa_venda').Value      := 1;
      Params.ParamByName('paridade_compra').Value := uValorCompra;
      Params.ParamByName('paridade_venda').Value  := uValorVenda;

      ExecSQL;
    end;

    try
      Dm.fbConn.Commit;

      frmPrincipal.dtCotacao.Date := dtCotacao.Date;
      frmPrincipal.AtualizarCotacoes;
    except
      Dm.fbConn.Rollback;
    end;

    Application.MessageBox('Importação de Moedas e Cotações do Banco Central do Brasil finalizada.','FeedBack',MB_ICONINFORMATION);

    if chkFecharAoConcluir.Checked = True then
    frmImporta.Close;

  finally
    ProgressBar1.Visible := False;
    Label4.Visible       := False;
    Label5.Visible       := False;
    btnImportar.Enabled  := True;
    pnlRetorno.Visible   := False;
  end;
end;

procedure TfrmImporta.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmImporta.chkImportarTodasClick(Sender: TObject);
begin
{
  if chkImportarTodas.Checked = True then
    if Application.MessageBox('Essa opção sobrepõe as moedas já definidas manualmente para a data de cotação informada. Deseja continuar?','Atenção',MB_ICONQUESTION+MB_YESNO) = IDNO then
    chkImportarTodas.Checked := False;
}
end;

procedure TfrmImporta.dtCotacaoChange(Sender: TObject);
begin
  if dtCotacao.Date > Date then
  begin
    Application.MessageBox('Data de Cotação não pode ser maior que a data atual.','Atenção',MB_ICONINFORMATION);
    dtCotacao.SetFocus;
    Exit;
  end;
end;

procedure TfrmImporta.FormShow(Sender: TObject);
begin
  dtCotacao.Date := frmPrincipal.dtCotacao.Date;
  pnlRetorno.Visible   := False;
  btnImportar.SetFocus;
end;

procedure TfrmImporta.IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  ProgressBar1.Position := AWorkCount;
  Label4.Caption        := 'Baixando ... ' + RetornaKiloBytes(AWorkCount);
  Label5.Caption        := 'Download em ... ' + RetornaPorcentagem(ProgressBar1.Max, AWorkCount);
end;

procedure TfrmImporta.IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  ProgressBar1.Max := AWorkCountMax;
end;

procedure TfrmImporta.IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  ProgressBar1.Position := 0;
  Label5.Caption        := 'Finalizado ...';
  Label4.Caption        := 'Download Finalizado ...';
  ProgressBar1.Visible  := false;
  btnImportar.Enabled   := true;

  if chkFecharAoConcluir.Checked then
  Close;
end;

function TfrmImporta.RetornaKiloBytes(ValorAtual: real): string;
var
  resultado : real;
begin
  resultado := ((ValorAtual / 1024) / 1024);
  Result    := FormatFloat('0.000 KBs', resultado);
end;

function TfrmImporta.RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;
var
  resultado: Real;
begin
  resultado := ((ValorAtual * 100) / ValorMaximo);
  Result    := FormatFloat('0%', resultado);
end;

end.
