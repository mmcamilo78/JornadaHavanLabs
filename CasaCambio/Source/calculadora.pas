{
  Projeto..: Desafio Programa??o - Jornada Labs HAVAN - PROWAY
  Candidato: M?rcio Moreira Camilo
  Telefone.: (47)98867-7130
  E-mail...: mmcamilo@gmail.com
  Data.....: 18/05/2021

  Parte 1 - Calculadora de C?mbio

            Crie um script em sua linguaguem preferida que receba a moeda de origem
            e a moeda de destino de uma lista previamente cadastrada, al?m do valor
            a ser convertido e retorne o valor convertido com precis?o de centavos.


            Aprimoramento...

            As convers?es na Calculadora de C?mbio s?o realizadas com base nas
            moedas e cota??es pr?-existentes em suas respectivas tabelas.

            Ao selecionar uma data de cota??o, uma sele??o busca na tabela de Cotacoes
            as moedas e seus respectivos valores de Compra, Venda e Paridades para as
            convers?o entre moedas estrangeiras.

            Caso n?o existam moedas cotadas para a data selecionada, uma mensagem ser?
            exibida para o usuario, informando a necessidade de realizar a inclus?o das
            moedas e ap?s a atualizar dos valores, as convers?es enfim poder?o
            ser realizadas.

            Encontrando-se as moedas e suas cota??es na data selecionada pelo usuario
            as listas (ComboBox) s?o preenchidas para posterior sele??o e convers?o
            das moedas.
}

unit calculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, MoneyEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmCalculadora = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbbMoedaOrigem: TComboBox;
    cbbMoedaDestino: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    dtCotacao: TDateTimePicker;
    qryConv: TFDQuery;
    qryConvCODIGO: TSmallintField;
    qryConvSIMBOLO: TStringField;
    qryConvTIPO: TStringField;
    qryConvNOME: TStringField;
    qryConvPARIDADE_VENDA: TFloatField;
    Label7: TLabel;
    Label8: TLabel;
    lblConversaoDe: TLabel;
    lblConversaoPara: TLabel;
    Label12: TLabel;
    lblValorAConverter: TLabel;
    lblValorConvertido: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    qryConvTAXA_COMPRA: TFloatField;
    qryConvTAXA_VENDA: TFloatField;
    qryConvPARIDADE_COMPRA: TFloatField;
    Bevel1: TBevel;
    Label13: TLabel;
    lblOrigem: TLabel;
    lblDestino: TLabel;
    edtParidadeOrigemCompra: TEdit;
    edtParidadeOrigemVenda: TEdit;
    edtParidadeDestinoCompra: TEdit;
    edtParidadeDestinoVenda: TEdit;
    edtValor: TEdit;
    procedure dtCotacaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbMoedaOrigemChange(Sender: TObject);
    procedure cbbMoedaDestinoChange(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    wTpMoedaOrigem, wTpMoedaDestino,
    wSimboloDestino: String;

    wValorOriginal, wValorConvertido,
    wValorCompraOrigem, wValorVendaOrigem,
    wValorCompraDestino, wValorVendaDestino,
    wParidadeOrigemCompra, wParidadeOrigemVenda,
    wParidadeDestinoCompra, wParidadeDestinoVenda : Double;

    procedure LimpaForm;
    procedure LimpaResultado;
    procedure ConverterMoedas;
    procedure ZeraVariaveisOrigem;
    procedure ZeraVariaveisDestino;
  public
    { Public declarations }
  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.dfm}

uses uDm, uPrincipal;

procedure TfrmCalculadora.cbbMoedaOrigemChange(Sender: TObject);
begin

  // Buscando as informa??es em uma Tabela de acordo com a Moeda de Origem selecionada pelo usu?rio

  with qryConv do
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

  if not qryConv.Eof then
  begin

    // Guardando temporariamente as informa??es retornadas se encontradas para realiza??o das convers?es

    wParidadeOrigemCompra := 0;
    wParidadeOrigemCompra := qryConvPARIDADE_COMPRA.Value;
    edtParidadeOrigemCompra.Text := FormatFloat('0.0000000', wParidadeOrigemCompra);

    wParidadeOrigemVenda := 0;
    wParidadeOrigemVenda := qryConvPARIDADE_VENDA.Value;
    edtParidadeOrigemVenda.Text := FormatFloat('0.0000000', wParidadeOrigemVenda);

    wTpMoedaOrigem := '';
    wTpMoedaOrigem := qryConvTIPO.Value;

    wValorCompraOrigem := 0;
    wValorCompraOrigem := qryConvTAXA_COMPRA.Value;

    wValorVendaOrigem := 0;
    wValorVendaOrigem := qryConvTAXA_VENDA.Value;

    lblConversaoDe.Caption := qryConvNOME.Text + '(' + qryConvSIMBOLO.Text + ')';

    ConverterMoedas;
  end
  else
  ZeraVariaveisOrigem;
end;

procedure TfrmCalculadora.cbbMoedaDestinoChange(Sender: TObject);
begin

  // Buscando as informa??es de acordo com a moeda de destino selecionada pelo usu?rio

  with qryConv do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select a.codigo, b.simbolo, b.tipo, b.nome, a.taxa_compra, a.taxa_venda, '+
            'a.paridade_compra, a.paridade_venda '+
            'from cotacoes a, moedas b where a.data_cotacao = :data_cotacao '+
            'and a.codigo = :codigo and a.codigo = b.codigo');
    Params.ParamByName('data_cotacao').Value := StringReplace(DateToStr(dtCotacao.Date), '/', '.', [rfReplaceAll]);
    Params.ParamByName('codigo').Value := StrToInt(copy(cbbMoedaDestino.Text,1,3));
    Open;
  end;

  if not qryConv.Eof then
  begin

    // Guardando temporariamente as informa??es retornadas se encontradas para realiza??o das convers?es

    wParidadeDestinoCompra := 0;
    wParidadeDestinoCompra := qryConvPARIDADE_COMPRA.Value;
    edtParidadeDestinoCompra.Text := FormatFloat('0.0000000', wParidadeDestinoCompra);

    wParidadeDestinoVenda := 0;
    wParidadeDestinoVenda := qryConvPARIDADE_VENDA.Value;
    edtParidadeDestinoVenda.Text := FormatFloat('0.0000000', wParidadeDestinoVenda);

    wValorCompraDestino := 0;
    wValorCompraDestino := qryConvTAXA_COMPRA.Value;

    wValorVendaDestino := 0;
    wValorVendaDestino := qryConvTAXA_VENDA.Value;

    wTpMoedaDestino := '';
    wTpMoedaDestino := qryConvTIPO.Value;

    wSimboloDestino := '';
    wSimboloDestino := qryConvSIMBOLO.Text;

    lblConversaoPara.Caption := qryConvNOME.Text + '(' + qryConvSIMBOLO.Text + ')';

    ConverterMoedas;
  end;
end;

procedure TfrmCalculadora.ConverterMoedas;
begin
  // Respons?vel por fazer as convers?es de valores de acordo com as moedas selecionadas pelo usu?rio

  // Se existirem os valores para as devidas convers?es o procedimento ConverterMoedas ? realizado

  if ( wValorOriginal > 0 ) and
     ( wParidadeOrigemCompra > 0 ) and
     ( wParidadeOrigemVenda > 0 ) and
     ( wParidadeDestinoCompra > 0 ) and
     ( wParidadeDestinoVenda > 0 ) and
     ( wValorCompraOrigem > 0 ) and
     ( wValorVendaOrigem > 0 ) and
     ( wValorCompraDestino > 0 ) and
     ( wValorVendaDestino > 0 )
  then
  begin
    lblValorAConverter.Caption := FormatFloat(' #,##0.00',wValorOriginal) + '  ' + lblConversaoDe.Caption;

    {
      Moedas Tipo A: Moeda cuja paridade ? expressa em quantidade de moeda por uma unidade de d?lar.
      Moedas Tipo B: Moeda cuja paridade ? expressa em quantidade de d?lar, por uma unidade de moeda.
    }

    // Tratando a convers?o de c?mbio referente a nossa moeda como Origem da Convers?o

    if copy(cbbMoedaOrigem.Text, 1,3) = '790' then  //BRL Origem
    begin
      if wTpMoedaDestino = 'A' then
      begin
        wValorConvertido := 0;
        wValorConvertido := wValorOriginal / wValorVendaDestino;

        lblValorConvertido.Caption := FormatFloat('#,##0.0000',wValorConvertido) + '  ' + wSimboloDestino;

        lblOrigem.Caption := ' 1 ' + lblConversaoDe.Caption + ' = ' +
                             FormatFloat('0.0000000', 1 / wValorVendaDestino ) +
                             ' ' + lblConversaoPara.Caption;

        lblDestino.Caption := ' 1 ' + lblConversaoPara.Caption + ' = '
                              + FormatFloat('0.0000000', wValorVendaDestino ) +
                              ' ' + lblConversaoDe.Caption;
      end;

      if wTpMoedaDestino = 'B' then
      begin
        wValorConvertido := 0;
        wValorConvertido := (1 / wValorVendaDestino * wValorOriginal);

        lblValorConvertido.Caption := FormatFloat('#,##0.0000',wValorConvertido) + '  ' + wSimboloDestino;

        lblOrigem.Caption := ' 1 ' + lblConversaoDe.Caption + ' = ' +
                             FormatFloat('0.0000000', 1 / wValorVendaDestino ) +
                             ' ' + lblConversaoPara.Caption;

        lblDestino.Caption := ' 1 ' + lblConversaoPara.Caption + ' = '
                              + FormatFloat('0.0000000', wValorVendaDestino ) +
                              ' ' + lblConversaoDe.Caption;
      end;

    end
    else
    if  copy(cbbMoedaDestino.Text, 1,3) = '790' then //BRL Destino
    begin

      // Tratando a convers?o de c?mbio referente a nossa moeda como Destino da Convers?o

      if wTpMoedaOrigem = 'A' then
      begin
        wValorConvertido := 0;
        wValorConvertido := wValorOriginal * wValorCompraOrigem;

        lblValorConvertido.Caption := FormatFloat('#,##0.0000',wValorConvertido) + '  ' + wSimboloDestino;

        lblOrigem.Caption := ' 1 ' + lblConversaoDe.Caption + ' = ' +
                             FormatFloat('0.0000000', wValorCompraOrigem ) +
                             ' ' + lblConversaoPara.Caption;

        lblDestino.Caption := ' 1 ' + lblConversaoPara.Caption + ' = '
                              + FormatFloat('0.0000000', 1 / wValorCompraOrigem ) +
                              ' ' + lblConversaoDe.Caption;
      end;

      if wTpMoedaOrigem = 'B' then
      begin
        wValorConvertido := 0;
        wValorConvertido := (wValorOriginal * wValorCompraOrigem);

        lblValorConvertido.Caption := FormatFloat('#,##0.0000',wValorConvertido) + '  ' + wSimboloDestino;

        lblOrigem.Caption := ' 1 ' + lblConversaoDe.Caption + ' = ' +
                             FormatFloat('0.0000000', wValorCompraOrigem ) +
                             ' ' + lblConversaoPara.Caption;

        lblDestino.Caption := ' 1 ' + lblConversaoPara.Caption + ' = '
                              + FormatFloat('0.0000000', 1 / wValorCompraOrigem ) +
                              ' ' + lblConversaoDe.Caption;
      end;

    end
    else
    begin

      // Tratando as convers?es e paridades entre outras moedas

      if (wTpMoedaOrigem = 'A') and (wTpMoedaDestino = 'A') then
      begin
        wValorConvertido := 0;
        wValorConvertido := (1 / wParidadeOrigemCompra) * wParidadeDestinoVenda * wValorOriginal;

        lblValorConvertido.Caption := FormatFloat('#,##0.0000',wValorConvertido) + '  ' + wSimboloDestino;


        lblOrigem.Caption := ' 1 ' + lblConversaoDe.Caption + ' = ' +
                            FormatFloat('0.0000000', 1 / wParidadeOrigemCompra * wParidadeDestinoVenda ) +
                            ' ' + lblConversaoPara.Caption;


        lblDestino.Caption := ' 1 ' + lblConversaoPara.Caption + ' = '
                             + FormatFloat('0.0000000', 1 / wParidadeDestinoVenda * wParidadeOrigemCompra ) +
                             ' ' + lblConversaoDe.Caption;
      end
      else
      if (wTpMoedaOrigem = 'A') and (wTpMoedaDestino = 'B') then
      begin
        wValorConvertido := 0;
        wValorConvertido := ( 1 / wParidadeOrigemCompra ) * ( 1 / wParidadeDestinoCompra ) * wValorOriginal;

        lblValorConvertido.Caption := FormatFloat('#,##0.0000',wValorConvertido) + '  ' + wSimboloDestino;

        lblOrigem.Caption := ' 1 ' + lblConversaoDe.Caption + ' = ' +
                             FormatFloat('0.0000000', (1 / wParidadeOrigemCompra ) * ( 1 / wParidadeDestinoCompra ) ) +
                             ' ' + lblConversaoPara.Caption;


         lblDestino.Caption := ' 1 ' + lblConversaoPara.Caption + ' = '
                               + FormatFloat('0.0000000', wParidadeDestinoCompra * wParidadeOrigemCompra ) +
                               ' ' + lblConversaoDe.Caption;
      end
      else
      if (wTpMoedaOrigem = 'B') and (wTpMoedaDestino = 'B') then
      begin
        wValorConvertido := 0;
        wValorConvertido := ( wParidadeOrigemCompra / wParidadeDestinoVenda ) * wValorOriginal;

        lblValorConvertido.Caption := FormatFloat('#,##0.0000',wValorConvertido) + '  ' + wSimboloDestino;

        lblOrigem.Caption := ' 1 ' + lblConversaoDe.Caption + ' = ' +
                            FormatFloat('0.0000000', wParidadeOrigemCompra / wParidadeDestinoVenda ) +
                            ' ' + lblConversaoPara.Caption;

        lblDestino.Caption := ' 1 ' + lblConversaoPara.Caption + ' = ' + FormatFloat('0.0000000', wParidadeDestinoVenda / wParidadeOrigemCompra ) +
                             ' ' + lblConversaoDe.Caption;
      end
      else
      if (wTpMoedaOrigem = 'B') and (wTpMoedaDestino = 'A') then
      begin
        wValorConvertido := 0;
        wValorConvertido := wParidadeOrigemCompra * wParidadeDestinoCompra * wValorOriginal;

        lblValorConvertido.Caption := FormatFloat('#,##0.0000',wValorConvertido) + '  ' + wSimboloDestino;

        lblOrigem.Caption := ' 1 ' + lblConversaoDe.Caption + ' = ' +
                             FormatFloat('0.0000000', wParidadeOrigemCompra * wParidadeDestinoCompra ) +
                             ' ' + lblConversaoPara.Caption;

        lblDestino.Caption := ' 1 ' + lblConversaoPara.Caption + ' = ' + FormatFloat('0.0000000', ( 1 / wParidadeOrigemCompra) * ( 1 / wParidadeDestinoCompra) ) +
                              ' ' + lblConversaoDe.Caption;
      end
     else
     LimpaResultado;
    end;
  end
  else
  LimpaResultado;
end;

procedure TfrmCalculadora.dtCotacaoChange(Sender: TObject);
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

  with qryConv do
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

  if not qryConv.Eof then
  begin

    // Caso exista as cotac?es para a data selecionada, duas combos s?o populadas
    // Moeda de Origem x Moeda de Destino

    cbbMoedaOrigem.Clear;
    cbbMoedaDestino.Clear;

    qryConv.First;
    while not qryConv.eof do
    begin
      cbbMoedaOrigem.Items.Add(FormatFloat('000',qryConvCODIGO.Value) +
                               ' | ' + qryConvSIMBOLO.Text + ' | ' + qryConvTIPO.Text +
                               ' | ' + qryConvNOME.Text);

      cbbMoedaDestino.Items.Add(FormatFloat('000',qryConvCODIGO.Value) +
                               ' | ' + qryConvSIMBOLO.Text + ' | ' + qryConvTIPO.Text +
                               ' | ' + qryConvNOME.Text);
      qryConv.Next;
    end;

    edtValor.SetFocus;
  end
  else
  begin

    // Sen?o uma mensagem ? exibida ao usu?rio solicitando ao mesmo que realiza a digita??o ou a importa??o dos valores

    Application.MessageBox('Ainda n?o existem moedas cotadas para a data selecionada!'+#13+'Selecione uma nova data ou realize a inclus?o ou a importa??o das cota??oes atrav?s da guia Cota??o de Moedas para a data pretendida e em seguida tente novamente.','Opera??es de C?mbio',MB_ICONEXCLAMATION);
    dtCotacao.SetFocus;
  end;
end;

procedure TfrmCalculadora.edtValorExit(Sender: TObject);
begin

  // Validando o valor informado a ser convertido.

  if StrToFloat(edtValor.Text) < 0 then
  begin
    Application.MessageBox('Informe um valor a ser covertido para continuar.','Calculadora',MB_ICONEXCLAMATION);
    edtValor.SetFocus;
    Exit;
  end;

  if StrToFloat(edtValor.Text) > 0 then
  begin
    wValorOriginal := 0;
    wValorOriginal := StrToFloatDef(edtValor.Text,1);

    edtValor.Text := FormatFloat('0.00', wValorOriginal);

    cbbMoedaOrigem.SetFocus;
  end
  else
  wValorOriginal := 0;

  ConverterMoedas;
end;

procedure TfrmCalculadora.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#13,'0'..'9',',',#8]) then
  Key := #0;

  if Key = #13 then
  edtValorExit(Sender);
end;

procedure TfrmCalculadora.ZeraVariaveisDestino;
begin
  wValorCompraDestino := 0;
  wValorVendaDestino  := 0;
  wParidadeDestinoCompra := 0;
  wParidadeDestinoVenda  := 0;
end;

procedure TfrmCalculadora.ZeraVariaveisOrigem;
begin
  wValorCompraOrigem := 0;
  wValorVendaOrigem  := 0;
  wParidadeOrigemCompra := 0;
  wParidadeOrigemVenda  := 0;
end;

procedure TfrmCalculadora.FormShow(Sender: TObject);
begin
  dtCotacao.Date := frmPrincipal.dtCotacao.Date;
  dtCotacaoChange(Sender);
end;

procedure TfrmCalculadora.LimpaForm;
begin
  wTpMoedaOrigem  := '';
  wTpMoedaDestino := '';
  wSimboloDestino := '';

  ZeraVariaveisOrigem;
  ZeraVariaveisDestino;

  edtValor.Text  := '1,00';

  cbbMoedaOrigem.ItemIndex  := -1;
  cbbMoedaDestino.ItemIndex := -1;

  edtParidadeOrigemCompra.Text  := '0,000000';
  edtParidadeOrigemVenda.Text   := '0,000000';
  edtParidadeDestinoCompra.Text := '0,000000';
  edtParidadeDestinoVenda.Text  := '0,000000';

  lblValorAConverter.Caption := '0,0000';
  lblConversaoPara.Caption   := '';
  lblValorConvertido.Caption := '0,0000';

  lblOrigem.Caption  := '';
  lblDestino.Caption := '';
end;


procedure TfrmCalculadora.LimpaResultado;
begin
  lblValorAConverter.Caption := '0,0000';
  lblValorConvertido.Caption := '0,0000';
end;

end.
