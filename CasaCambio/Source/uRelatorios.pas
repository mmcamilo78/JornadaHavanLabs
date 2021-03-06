{
  Projeto..: Desafio Programa??o - Jornada Labs HAVAN - PROWAY
  Candidato: M?rcio Moreira Camilo
  Telefone.: (47)98867-7130
  E-mail...: mmcamilo@gmail.com
  Data.....: 20/05/2021

  Parte 2 - Crie um sistema que permita o controle das opera??es

            O sistema fornecer? os seguintes relat?rios:
              - Lista de Opera??es
              - Valor das ?pera??es
              - Valor total das taxas cobradas

            Os relat?rios poder?o ser filtrados por intervalo de tempo e cliente.
            O valor de convers?o de cada moeda PARA Reais, poder? ser definido no
            c?digo-fonte ou cadastrado pelo usu?rio do sistema. O cadastro  de
            valores de convers?o garantir? pontos extras na avalia??o
}

unit uRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmRelatorios = class(TForm)
    GroupBox3: TGroupBox;
    rdbListagemOperacoes: TRadioButton;
    rdbTotalOperacoes: TRadioButton;
    rdbTotalTaxas: TRadioButton;
    GroupBox4: TGroupBox;
    rdbTodosRegistros: TRadioButton;
    rdbIncluirFiltro: TRadioButton;
    pnlFiltro: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtNomeCliente: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dtOperacaoInicial: TDateTimePicker;
    dtOperacaoFinal: TDateTimePicker;
    btnImprimir: TButton;
    Button2: TButton;
    qryClientes: TFDQuery;
    dsClientes: TDataSource;
    DBGrid1: TDBGrid;
    qryClientesNOME_CLIENTE: TStringField;
    Bevel1: TBevel;
    rdbOperacoesLoja: TRadioButton;
    procedure Button2Click(Sender: TObject);
    procedure rdbTodosRegistrosClick(Sender: TObject);
    procedure rdbIncluirFiltroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtNomeClienteChange(Sender: TObject);
    procedure edtNomeClienteKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtNomeClienteExit(Sender: TObject);
  private
    { Private declarations }

    wNome: String;
  public
    { Public declarations }
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

{$R *.dfm}

uses uListaOperacoes, uDm, uRelTaxasCobradas, uTotalOperacoes, uOperacoesLoja;

procedure TfrmRelatorios.btnImprimirClick(Sender: TObject);
begin
  if dtOperacaoFinal.Date < dtOperacaoInicial.Date then
  begin
    Application.MessageBox('A data de opera??o Final n?o pode ser menor que a data de opera??o Inicial.','Aten??o',MB_ICONEXCLAMATION);
    Exit;
  end;

  if dtOperacaoInicial.Date > dtOperacaoFinal.Date then
  begin
    Application.MessageBox('A data de opera??o Inicial n?o pode ser maior que a data de opera??o Final.','Aten??o',MB_ICONEXCLAMATION);
    Exit;
  end;

  // Listagem das Opera??es de C?mbio

  if rdbListagemOperacoes.Checked = True then
  begin
    with rel_ListaOperacoes.qryListagem do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select data_operacao, id_loja, nome_cliente, valor_original, moeda_origem, '+
              'moeda_destino, valor_convertido from operacoes ');

      if rdbIncluirFiltro.Checked = True then
      begin
        Sql.Add('where nome_cliente like :nome_cliente and data_operacao between :data_inicial and :data_final');
        Params.ParamByName('nome_cliente').Value := '%'+edtNomeCliente.Text+'%';
        Params.ParamByName('data_inicial').Value := StringReplace(DateToStr( dtOperacaoInicial.Date ),'/','.',[rfReplaceAll]) ;
        Params.ParamByName('data_final').Value   := StringReplace(DateToStr( dtOperacaoFinal.Date ),'/','.',[rfReplaceAll]) ;
      end;

      SQL.Add('order by data_operacao desc');

      Open;
    end;

    if rdbIncluirFiltro.Checked = True then
       rel_ListaOperacoes.lblFiltro.Caption := 'Cliente..: ' + wNome + ' |  Opera??o Inicial: ' + DateToStr(dtOperacaoInicial.Date) + ' | Opera??o Final : ' + DateToStr(dtOperacaoFinal.Date)
    else
    rel_ListaOperacoes.lblFiltro.Caption := 'Todos os Registros';

    rel_ListaOperacoes.relListagemOperacoes.Preview();
  end;


  // Relat?rio dos Valores das Taxas Cobradas

  if rdbTotalTaxas.Checked = True then
  begin
    with rel_TaxasCobradas.qryTaxas do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select data_operacao, id_loja, nome_cliente, valor_convertido, taxa_cobrada from operacoes');

      if rdbIncluirFiltro.Checked = True then
      begin
        Sql.Add('where nome_cliente like :nome_cliente and data_operacao between :data_inicial and :data_final');
        Params.ParamByName('nome_cliente').Value := '%'+edtNomeCliente.Text+'%';
        Params.ParamByName('data_inicial').Value := StringReplace(DateToStr( dtOperacaoInicial.Date ),'/','.',[rfReplaceAll]) ;
        Params.ParamByName('data_final').Value   := StringReplace(DateToStr( dtOperacaoFinal.Date ),'/','.',[rfReplaceAll]) ;
      end;

      SQL.Add('order by data_operacao desc');

      Open;
    end;

    if rdbIncluirFiltro.Checked = True then
       rel_TaxasCobradas.lblFiltro.Caption := 'Cliente..: ' + wNome + ' |  Opera??o Inicial: ' + DateToStr(dtOperacaoInicial.Date) + ' | Opera??o Final : ' + DateToStr(dtOperacaoFinal.Date)
    else
    rel_TaxasCobradas.lblFiltro.Caption := 'Todos os Registros';

    rel_TaxasCobradas.relTaxasCobradas.Preview();
  end;


  // Relat?rio com a Totaliza??o das Opera??es de C?mbio

  if rdbTotalOperacoes.Checked = True then
  begin
    with rel_TotalOperacoes.qryTotais do
    begin
      Close;
      SQL.Clear;

      SQL.Add('select '+
         'operacoes.id_loja, '+
         'operacoes.moeda_origem, '+
         'sum(operacoes.valor_original) as valorOriginal, '+
         'sum(operacoes.valor_convertido) as valorConvertido, '+
         'sum(operacoes.taxa_cobrada) as taxaCobrada, '+
         'lojas.nome, '+
         'lojas.cidade '+
         'from operacoes '+
         'left join lojas on lojas.id = operacoes.id_loja ');

      if rdbIncluirFiltro.Checked = True then
      begin
        Sql.Add('where operacoes.nome_cliente like :nome_cliente and operacoes.data_operacao between :data_inicial and :data_final');
        Params.ParamByName('nome_cliente').Value := '%'+edtNomeCliente.Text+'%';
        Params.ParamByName('data_inicial').Value := StringReplace(DateToStr( dtOperacaoInicial.Date ),'/','.',[rfReplaceAll]) ;
        Params.ParamByName('data_final').Value   := StringReplace(DateToStr( dtOperacaoFinal.Date ),'/','.',[rfReplaceAll]) ;
      end;

      SQL.Add('group by operacoes.id_loja, operacoes.moeda_origem, lojas.nome, lojas.cidade '+
              'order by operacoes.id_loja, valorConvertido desc, lojas.nome');

      Open;
    end;

    if rdbIncluirFiltro.Checked = True then
       rel_TotalOperacoes.lblFiltro.Caption := 'Cliente..: ' + wNome + ' |  Opera??o Inicial: ' + DateToStr(dtOperacaoInicial.Date) + ' | Opera??o Final : ' + DateToStr(dtOperacaoFinal.Date)
    else
    rel_TotalOperacoes.lblFiltro.Caption := 'Todos os Registros';

    rel_TotalOperacoes.relTotalOperacoes.Preview();
  end;

  // Listagem de Opera??es por Loja

  if rdbOperacoesLoja.Checked = True then
  begin
    with rel_OperacoesLoja.qryTotais do
    begin
      Close;
      SQL.Clear;

      SQL.Add('select '+
              'operacoes.id_loja, '+
              'operacoes.data_operacao, '+
              'operacoes.nome_cliente, '+
              'operacoes.moeda_origem, '+
              'operacoes.valor_original, '+
              'operacoes.moeda_destino, '+
              'operacoes.valor_cotacao, '+
              'operacoes.valor_convertido, '+
              'operacoes.taxa_cobrada, '+
              'lojas.nome, '+
              'lojas.cidade '+
              'from operacoes '+
              'left join lojas on lojas.id = operacoes.id_loja ');

      if rdbIncluirFiltro.Checked = True then
      begin
        Sql.Add('where operacoes.nome_cliente like :nome_cliente and operacoes.data_operacao between :data_inicial and :data_final');
        Params.ParamByName('nome_cliente').Value := '%'+edtNomeCliente.Text+'%';
        Params.ParamByName('data_inicial').Value := StringReplace(DateToStr( dtOperacaoInicial.Date ),'/','.',[rfReplaceAll]) ;
        Params.ParamByName('data_final').Value   := StringReplace(DateToStr( dtOperacaoFinal.Date ),'/','.',[rfReplaceAll]) ;
      end;

      SQL.Add('order by operacoes.id_loja, valor_convertido desc');

      Open;
    end;

    if rdbIncluirFiltro.Checked = True then
       rel_OperacoesLoja.lblFiltro.Caption := 'Cliente..: ' + wNome + ' |  Opera??o Inicial: ' + DateToStr(dtOperacaoInicial.Date) + ' | Opera??o Final : ' + DateToStr(dtOperacaoFinal.Date)
    else
    rel_OperacoesLoja.lblFiltro.Caption := 'Todos os Registros';

    rel_OperacoesLoja.relOperacoesLoja.Preview();
  end;
end;

procedure TfrmRelatorios.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmRelatorios.DBGrid1DblClick(Sender: TObject);
begin
  edtNomeCliente.Text := qryClientesNOME_CLIENTE.Text;
  edtNomeClienteExit(Sender);
  DBGrid1.Visible := False;
end;

procedure TfrmRelatorios.edtNomeClienteChange(Sender: TObject);
begin

  // Localizar os clientes j? informados nas Opera??es de C?mbio

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

procedure TfrmRelatorios.edtNomeClienteExit(Sender: TObject);
begin
  if Length(Trim(edtNomeCliente.Text)) > 0 then
    wNome := edtNomeCliente.Text
  else
  wNome := ' Todos ';
end;

procedure TfrmRelatorios.edtNomeClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (qryClientes.RecordCount > 0) then
  begin
    edtNomeCliente.Text := qryClientesNOME_CLIENTE.Text;
    edtNomeClienteExit(Sender);

    DBGrid1.Visible := False;
  end
  else
  DBGrid1.Visible := False;
end;

procedure TfrmRelatorios.FormShow(Sender: TObject);
begin
  rdbIncluirFiltroClick(Sender);
end;

procedure TfrmRelatorios.rdbIncluirFiltroClick(Sender: TObject);
begin
  pnlFiltro.Visible := True;

  qryClientes.Open;

  edtNomeCliente.Clear;
  edtNomeCliente.SetFocus;

  dtOperacaoInicial.Date := Date;
  dtOperacaoFinal.Date   := Date;
end;

procedure TfrmRelatorios.rdbTodosRegistrosClick(Sender: TObject);
begin
  pnlFiltro.Visible := False;
end;

end.
