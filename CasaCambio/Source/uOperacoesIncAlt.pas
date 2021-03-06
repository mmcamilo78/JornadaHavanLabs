{
  Projeto..: Desafio Programa??o - Jornada Labs HAVAN - PROWAY
  Candidato: M?rcio Moreira Camilo
  Telefone.: (47)98867-7130
  E-mail...: mmcamilo@gmail.com
  Data.....: 19/05/2021

  Parte 2 - Crie um sistema que permita o controle das opera??es

            O cadastro dever? conter os seguintes dados:
              - Nome do Cliente
              - Moeda de Origem
              - Moeda de Destino
              - Data da Opera??o
              - Valor Original
              - Valor Convertido
              - Taxa Cobrada

            O sistema fornecer? os seguintes relat?rios:
              - Lista de Opera??es
              - Valor das ?pera??es
              - Valor total das taxas cobradas

      Os relat?rios poder?o ser filtrados por intervalo de tempo e cliente.
      O valor de convers?o de cada moeda PARA Reais, poder? ser definido no
      c?digo-fonte ou cadastrado pelo usu?rio do sistema. O cadastro  de
      valores de convers?o garantir? pontos extras na avalia??o


      Obs. Conforme proposto acima, deu-se a entender que as convers?es deveriam
      acontecer de qualquer moedas para BRL (Reais)

      "O valor de convers?o de cada moeda PARA Reais"... ent?o mesmo que eu j?
      havia feito as convers?es entre diversas moedas nas duas dire??es
      na Parte 1 - Calculadora de C?mbio, aqui eu n?o quis fazer o mesmo
      para n?o sair do escopo do desafio conforme entendi no enunciado da Parte 2.
}


unit uOperacoesIncAlt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TfrmOperacoesIncAlt = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtNomeCliente: TEdit;
    dtCotacao: TDateTimePicker;
    cbbMoedaOrigem: TComboBox;
    edtValorConverter: TEdit;
    edtValorConvertido: TEdit;
    edtTaxaCobrada: TEdit;
    Label8: TLabel;
    edtCotacaoMoeda: TEdit;
    btnConverter: TButton;
    Bevel1: TBevel;
    btnGravar: TButton;
    btnCancelar: TButton;
    qryCotacoes: TFDQuery;
    qryCotacoesCODIGO: TSmallintField;
    qryCotacoesSIMBOLO: TStringField;
    qryCotacoesTIPO: TStringField;
    qryCotacoesNOME: TStringField;
    qryCotacoesTAXA_COMPRA: TFloatField;
    qryCotacoesTAXA_VENDA: TFloatField;
    qryCotacoesPARIDADE_COMPRA: TFloatField;
    qryCotacoesPARIDADE_VENDA: TFloatField;
    qryClientes: TFDQuery;
    dsClientes: TDataSource;
    DBGrid1: TDBGrid;
    qryClientesNOME_CLIENTE: TStringField;
    Label4: TLabel;
    cbbLojas: TComboBox;
    Label9: TLabel;
    edtRepasse: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure dtCotacaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbMoedaOrigemChange(Sender: TObject);
    procedure edtValorConverterExit(Sender: TObject);
    procedure btnConverterClick(Sender: TObject);
    procedure edtValorConverterKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeClienteChange(Sender: TObject);
    procedure edtNomeClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeClienteKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure btnGravarClick(Sender: TObject);
    procedure edtNomeClienteExit(Sender: TObject);
    procedure edtNomeClienteKeyPress(Sender: TObject; var Key: Char);
    procedure cbbLojasChange(Sender: TObject);
  private
    { Private declarations }

    wTpMoedaOrigem, wSimbolo : String;
    wValorCompraOrigem, wValorVendaOrigem,
    wValorAConverter, wValorConvertido : Double;

    wCodigoMoedaOrigem : Integer;

    procedure LimpaForm;
    procedure ConverterMoeda;
    procedure ZerarVariaveis;
    procedure BuscarLojas;
  public
    { Public declarations }
  end;

var
  frmOperacoesIncAlt: TfrmOperacoesIncAlt;

implementation

{$R *.dfm}

uses uPrincipal, uDm;

procedure TfrmOperacoesIncAlt.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmOperacoesIncAlt.btnConverterClick(Sender: TObject);
begin
  if cbbMoedaOrigem.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione a moeda de Origem para realizar a convers?o.','Opera??es de C?mbio',MB_ICONEXCLAMATION);
    cbbMoedaOrigem.SetFocus;
    Exit;
  end;

  ConverterMoeda;
end;

procedure TfrmOperacoesIncAlt.btnGravarClick(Sender: TObject);
begin

  // Validando as informa??es importante antes da inclus?o/altera??o das Opera??es de C?mbio

  if Length(Trim(edtNomeCliente.Text)) = 0 then
  begin
    Application.MessageBox('Digite o nome do cliente para continuar.','Opera??es de C?mbio',MB_ICONEXCLAMATION);
    edtNomeCliente.SetFocus;
    Exit;
  end;

  if cbbMoedaOrigem.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione a moeda de Origem para continuar.','Opera??es de C?mbio',MB_ICONEXCLAMATION);
    cbbMoedaOrigem.SetFocus;
    Exit;
  end;

  if wValorAConverter <= 0 then
  begin
    Application.MessageBox('Informe o Valor a Converter para continuar.','Opera??es de C?mbio',MB_ICONEXCLAMATION);
    Exit;
  end;

  if wValorConvertido <= 0 then
  begin
    Application.MessageBox('Informe o Valor a Converter para continuar.','Opera??es de C?mbio',MB_ICONEXCLAMATION);
    Exit;
  end;

  if Application.MessageBox('Confirma a grava??o das informa??es digitas?','Opera??es de C?mbio',MB_ICONQUESTION+MB_YESNO) = IDYES then
  begin
    if not Dm.fbConn.InTransaction then
    Dm.fbConn.StartTransaction;

    if Tag = 1 then
    begin
      with Dm.qryOperacoes do
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into operacoes ('+
                'nome_cliente, moeda_origem, moeda_destino, data_operacao, valor_original, '+
                'valor_convertido, taxa_cobrada, valor_cotacao, ind_cbbmoeda, '+
                'codigo_moeda_origem, codigo_moeda_destino, id_loja'+
                ') values ('+
                ':nome_cliente, :moeda_origem, :moeda_destino, :data_operacao, :valor_original, '+
                ':valor_convertido, :taxa_cobrada, :valor_cotacao, :ind_cbbmoeda, '+
                ':codigo_moeda_origem, :codigo_moeda_destino, :id_loja)');

        Params.ParamByName('nome_cliente').Value         := edtNomeCliente.Text;
        Params.ParamByName('moeda_origem').Value         :=  wSimbolo;
        Params.ParamByName('moeda_destino').Value        := 'BRL';
        Params.ParamByName('data_operacao').Value        := StringReplace(DateToStr(dtCotacao.Date),'/','.',[rfReplaceAll]);
        Params.ParamByName('valor_original').Value       := wValorAConverter;
        Params.ParamByName('valor_convertido').Value     := wValorConvertido;
        Params.ParamByName('taxa_cobrada').Value         := StrToFloatDef(edtTaxaCobrada.Text,0);
        Params.ParamByName('valor_cotacao').Value        := strtoFloatDef(edtCotacaoMoeda.Text,0);
        Params.ParamByName('ind_cbbmoeda').Value         := cbbMoedaOrigem.ItemIndex;
        Params.ParamByName('codigo_moeda_origem').Value  := wCodigoMoedaOrigem;
        Params.ParamByName('codigo_moeda_destino').Value := 790;
        Params.ParamByName('id_loja').Value              := StrToInt( copy(cbbLojas.Text,1,3) );

        ExecSQL;
      end;
    end;

   if Tag = 2 then
    begin
      with Dm.qryOperacoes do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update operacoes set '+
                'nome_cliente = :nome_cliente, moeda_origem = :moeda_origem, moeda_destino = :moeda_destino, '+
                'data_operacao = :data_operacao, valor_original = :valor_original, valor_convertido = :valor_convertido, '+
                'taxa_cobrada = :taxa_cobrada, valor_cotacao = :valor_cotacao, ind_cbbmoeda = :ind_cbbmoeda, '+
                'codigo_moeda_origem = :codigo_moeda_origem, codigo_moeda_destino = :codigo_moeda_destino, '+
                'id_loja = :id_loja'+
                'where id = :id');

        Params.ParamByName('id').Value                   := frmPrincipal.qryOperacoesID.Value;
        Params.ParamByName('nome_cliente').Value         := edtNomeCliente.Text;
        Params.ParamByName('moeda_origem').Value         := wSimbolo;
        Params.ParamByName('moeda_destino').Value        := 'BRL';
        Params.ParamByName('data_operacao').Value        := StringReplace(DateToStr(dtCotacao.Date),'/','.',[rfReplaceAll]);
        Params.ParamByName('valor_original').Value       := wValorAConverter;
        Params.ParamByName('valor_convertido').Value     := wValorConvertido;
        Params.ParamByName('taxa_cobrada').Value         := StrToFloatDef(edtTaxaCobrada.Text,0);
        Params.ParamByName('valor_cotacao').Value        := strtoFloatDef(edtCotacaoMoeda.Text,0);
        Params.ParamByName('ind_cbbmoeda').Value         := cbbMoedaOrigem.ItemIndex;
        Params.ParamByName('codigo_moeda_origem').Value  := wCodigoMoedaOrigem;
        Params.ParamByName('codigo_moeda_destino').Value := 790;
        Params.ParamByName('id_loja').Value              := StrToInt( copy(cbbLojas.Text,1,3) );

        ExecSQL;
      end;
    end;

    try
      Dm.fbConn.Commit;

      frmPrincipal.AtualizarOperacoes;
      frmPrincipal.AtualizarTotais;

      if Tag = 1 then
      LimpaForm;
      edtNomeCliente.SetFocus;

      if Tag = 2 then
      frmOperacoesIncAlt.Close;

    except
      Dm.fbConn.Rollback;
    end;

  end;
end;

procedure TfrmOperacoesIncAlt.BuscarLojas;
begin
  with Dm.qryLojas do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from lojas order by id');
    Open;
  end;

  if Dm.qryLojas.IsEmpty then
  begin
    Application.MessageBox('Nenhuma loja foi cadastrada em Lojas de C?mbio'+#13+'Inclua uma nova Loja de C?mbio e em seguida tente novamente.','Opera??es de C?mbio',MB_ICONEXCLAMATION);
    Exit;
  end
  else
  begin
    cbbLojas.Clear;

    Dm.qryLojas.First;
    while not Dm.qryLojas.Eof do
    begin
      cbbLojas.Items.Add(FormatFloat('000',Dm.qryLojasID.Value) + ' | '+ Dm.qryLojasNOME.Text + ' - ' + Dm.qryLojasCIDADE.Text + ' - ' + Dm.qryLojasUF.Text );
      Dm.qryLojas.Next;
    end;

    cbbLojas.ItemIndex := 0;
  end;
end;

procedure TfrmOperacoesIncAlt.cbbLojasChange(Sender: TObject);
begin
  edtNomeCliente.SetFocus;
end;

procedure TfrmOperacoesIncAlt.cbbMoedaOrigemChange(Sender: TObject);
begin

  // Buscando as informa??es em uma Tabela de acordo com a Moeda de Origem selecionada pelo usu?rio

  with qryCotacoes do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select a.codigo, b.simbolo, b.tipo, b.nome, a.taxa_compra, a.taxa_venda, '+
            'a.paridade_compra, a.paridade_venda '+
            'from cotacoes a, moedas b where a.data_cotacao = :data_cotacao '+
            'and a.codigo = :codigo and a.codigo = b.codigo');
    Params.ParamByName('data_cotacao').Value := StringReplace(DateToStr(dtCotacao.Date), '/', '.', [rfReplaceAll]);
    Params.ParamByName('codigo').Value := StrToInt(copy(cbbMoedaOrigem.Text,1,3));
    Open;
  end;

  if not qryCotacoes.Eof then
  begin

    // Guardando temporariamente as informa??es retornadas se encontradas para realiza??o das convers?es

    wTpMoedaOrigem := '';
    wTpMoedaOrigem := qryCotacoesTIPO.Text;

    wSimbolo := '';
    wSimbolo := qryCotacoesSIMBOLO.Text;

    wCodigoMoedaOrigem := 0;
    wCodigoMoedaOrigem := qryCotacoesCODIGO.Value;

    wValorCompraOrigem := 0;
    wValorCompraOrigem := qryCotacoesTAXA_COMPRA.Value;

    edtCotacaoMoeda.Text := FormatFloat('0.0000',wValorCompraOrigem);

    wValorVendaOrigem := 0;
    wValorVendaOrigem := qryCotacoesTAXA_VENDA.Value;

    edtValorConverter.SetFocus;

    if wValorAConverter > 0 then
    ConverterMoeda;
  end
  else
  begin
    wValorCompraOrigem := 0;
    wValorVendaOrigem  := 0;
    wTpMoedaOrigem     := '';
  end;

end;

procedure TfrmOperacoesIncAlt.ConverterMoeda;
begin

  // Converte a moeda selecionada pelo usu?rio em Reais BRL conforme enunciado do desafio.

  if ( cbbMoedaOrigem.ItemIndex <> -1 ) and
     ( wValorAConverter > 0 )
  then
  begin

    if wTpMoedaOrigem = 'A' then
    begin
      wValorConvertido := 0;
      wValorConvertido := wValorAConverter * wValorCompraOrigem;

      edtValorConvertido.Text := FormatFloat('#,##0.00',wValorConvertido);
    end;

    if wTpMoedaOrigem = 'B' then
    begin
      wValorConvertido := 0;
      wValorConvertido := (wValorAConverter * wValorCompraOrigem);

      edtValorConvertido.Text := FormatFloat('#,##0.00',wValorConvertido);
    end;

    edtTaxaCobrada.Clear;
    edtTaxaCobrada.Text := FormatFloat('0.00',wValorConvertido * 0.1);

    edtRepasse.Clear;
    edtRepasse.Text     := FormatFloat('#,##0.00',wValorConvertido - ( wValorConvertido * 0.1 ) );
  end;
end;

procedure TfrmOperacoesIncAlt.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    edtNomeCliente.Text := qryClientesNOME_CLIENTE.Text;
    DBGrid1.Visible := False;
    cbbMoedaOrigem.SetFocus;
  end;
end;

procedure TfrmOperacoesIncAlt.dtCotacaoChange(Sender: TObject);
begin
  // Validando a data de cota??o selecionada

  if dtCotacao.Date > Date then
  begin
    Application.MessageBox('Data de Cota??o n?o pode ser maior que a data atual.','Aten??o',MB_ICONINFORMATION);
    dtCotacao.SetFocus;
    Exit;
  end;

  // Verificando se ? final de semana

  if (DayOfWeek(dtcotacao.Date) = 1) or   //Domingo
     (DayOfWeek(dtcotacao.Date) = 7)      //Sabado
  then
  begin
    Application.MessageBox('O dia selecionado n?o ? dia ?til.','Aten??o',MB_ICONINFORMATION);
    dtCotacao.SetFocus;
    Exit;
  end;

  if Tag = 1 then
  LimpaForm;

  {
     De acordo com a data de cota??o selecionada, uma sele??o ? feita em uma tabela pr?-existente,
     onde anteriormente foi poss?vel ao usu?rio informar os valores das moedas pr?-Cadastradas manualmente,
     ou importar os respectivos valores da cota??o de cada moeda informada no Banco Central do Brasil.

     https://www.bcb.gov.br/estabilidadefinanceira/cotacoestodas

     O processo de importa??o retorna um arquivo .CSV referente a data de cota??o selecionada
     pelo usu?rio, o arquivo ent?o ? gravado em uma determinada pasta e as informa??es
     desse arquivo, armazenadas na respectiva tabela onde a sele??o ? realizada.
  }

  with qryCotacoes do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select a.codigo, b.simbolo, b.tipo, b.nome, a.taxa_compra, a.taxa_venda, '+
            'a.paridade_compra, a.paridade_venda '+
            'from cotacoes a, moedas b where a.data_cotacao = :data_cotacao '+
            'and a.codigo = b.codigo');

    Params.ParamByName('data_cotacao').value := StringReplace(DateToStr(dtCotacao.Date), '/', '.', [rfReplaceAll]);
    Open;
  end;

  if not qryCotacoes.Eof then
  begin

    // Caso exista as cotac?es para a data selecionada, duas combos s?o populadas
    // Moeda de Origem x Moeda de Destino

    cbbMoedaOrigem.Clear;

    qryCotacoes.First;
    while not qryCotacoes.eof do
    begin
      cbbMoedaOrigem.Items.Add(FormatFloat('000',qryCotacoesCODIGO.Value) +
                               ' | ' + qryCotacoesSIMBOLO.Text + ' | ' + qryCotacoesTIPO.Text +
                               ' | ' + qryCotacoesNOME.Text);

      qryCotacoes.Next;
    end;

    edtNomeCliente.SetFocus;
  end
  else
  begin

    // Sen?o uma mensagem ? exibida ao usu?rio solicitando ao mesmo que realiza a digita??o ou a importa??o dos valores

    Application.MessageBox('Ainda n?o existem moedas cotadas para a data selecionada!'+#13+'Selecione uma nova data ou realize a inclus?o ou a importa??o das cota??oes atrav?s da guia Cota??o de Moedas para a data pretendida e em seguida tente novamente.','Opera??es de C?mbio',MB_ICONEXCLAMATION);
    dtCotacao.SetFocus;
  end;
end;

procedure TfrmOperacoesIncAlt.edtNomeClienteChange(Sender: TObject);
begin
  {
    Como n?o foi solicitado no desafio algum campo do tipo Chave ?nica para identifica??o
    do cliente, fiz esse ajuste para tentar evitar o cadastro em duplicidade dos mesmos.
    N?o ? nem de longe a melhor op??o, mas eu n?o quis fugir do escopo solicitado e a priori
    ajudou a limitir aa duplicidades de cadastros dos mesmos clientes em rela??o ao seus nomes
  }

  if length(trim(edtNomeCliente.Text)) > 0 then
  begin
    DBGrid1.Visible := True;
    with qryClientes do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select distinct nome_cliente from operacoes where nome_cliente like :nome');
      Params.ParamByName('nome').Value := edtNomeCliente.Text+'%';
      Open;
    end;
  end
  else
  begin
    DBGrid1.Visible := False;
    qryClientes.Close;
  end;

end;

procedure TfrmOperacoesIncAlt.edtNomeClienteExit(Sender: TObject);
begin
  if (Length(Trim(edtNomeCliente.Text)) = 0) and  (DBGrid1.Visible = True) then
  DBGrid1.Visible := False;
end;

procedure TfrmOperacoesIncAlt.edtNomeClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  DBGrid1.Visible := False;

  if (key = VK_DOWN) and (DBGrid1.Visible = True) then
  DBGrid1.SetFocus;
end;

procedure TfrmOperacoesIncAlt.edtNomeClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) and (qryClientes.RecordCount > 0) then
  begin
    edtNomeCliente.Text := qryClientesNOME_CLIENTE.Text;
    DBGrid1.Visible := False;
    cbbMoedaOrigem.SetFocus;
  end
  else
  DBGrid1.Visible := False;
end;

procedure TfrmOperacoesIncAlt.edtNomeClienteKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_UP) and (DBGrid1.Visible = True) then
  DBGrid1.SetFocus;
end;

procedure TfrmOperacoesIncAlt.edtValorConverterExit(Sender: TObject);
begin

  // Validando o valor informado a ser convertido.

  if StrToFloat(edtValorConverter.Text) < 0 then
  begin
    Application.MessageBox('Informe um valor a ser covertido para continuar.','Calculadora',MB_ICONEXCLAMATION);
    edtValorConverter.SetFocus;
    Exit;
  end;

  if StrToFloat(edtValorConverter.Text) > 0 then
  begin
    wValorAConverter := 0;
    wValorAConverter := StrToFloatDef(edtValorConverter.Text,1);

    edtValorConverter.Text := FormatFloat('0.00', wValorAConverter);

    btnConverter.SetFocus;
  end
  else
  wValorAConverter := 0;

end;

procedure TfrmOperacoesIncAlt.edtValorConverterKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in [#13,'0'..'9',',',#8]) then
  Key := #0;

  if Key = #13 then
  begin
    edtValorConverterExit(Sender);
    btnConverterClick(Sender);
  end;
end;

procedure TfrmOperacoesIncAlt.FormShow(Sender: TObject);
begin
  if Tag = 1 then
  begin
    dtCotacao.Date := frmPrincipal.dtCotacao.Date;
    BuscarLojas;
    dtCotacaoChange(Sender);
  end;

  if Tag = 2 then
  begin
    dtCotacao.Date := frmPrincipal.qryOperacoesDATA_OPERACAO.Value;
    dtCotacaoChange(Sender);

    BuscarLojas;
    cbbLojas.ItemIndex := frmPrincipal.qryOperacoesID_LOJA.Value -1;

    edtNomeCliente.Text := frmPrincipal.qryOperacoesNOME_CLIENTE.Text;
    DBGrid1.Visible := False;

    cbbMoedaOrigem.ItemIndex := frmPrincipal.qryOperacoesIND_CBBMOEDA.Value;
    cbbMoedaOrigemChange(Sender);

    edtValorConverter.Text := FormatFloat('0.00', frmPrincipal.qryOperacoesVALOR_ORIGINAL.Value);
    edtValorConverterExit(Sender);
    ConverterMoeda;

    dtCotacao.SetFocus;
  end;
end;

procedure TfrmOperacoesIncAlt.LimpaForm;
begin
  edtNomeCliente.Clear;
  cbbMoedaOrigem.ItemIndex := -1;

  ZerarVariaveis;

  edtCotacaoMoeda.Text     := '0,0000';
  edtValorConverter.Text   := '0,00';
  edtValorConvertido.Text  := '0,00';
  edtTaxaCobrada.Text      := '0,00';
  edtRepasse.Text          := '0,00';
end;

procedure TfrmOperacoesIncAlt.ZerarVariaveis;
begin
  wSimbolo := '';
  wTpMoedaOrigem := '';
  wValorCompraOrigem := 0;
  wValorVendaOrigem  := 0;
  wValorAConverter   := 0;
  wValorConvertido   := 0;
  wCodigoMoedaOrigem := 0;
end;

end.
