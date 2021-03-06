{
  Projeto..: Desafio Programa??o - Jornada Labs HAVAN - PROWAY
  Candidato: M?rcio Moreira Camilo
  Telefone.: (47)98867-7130
  E-mail...: mmcamilo@gmail.com
  Data.....: 15/05/2021

  Parte Extra - Atribui??o dos Valores de Convers?o
                Os valores de convers?o poder?o ser atribuidos as moedas pr?-selecionadas
                pelo usu?rio de forma manual ou atrav?s de importa??o direto do
                reposit?rio do Banco Central do Brasil

                Nesse caso, existe a necessidade de uma conex?o com a Internet para
                retornar os dados.
}


unit uCotacaoIncAlt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, MoneyEdit, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TfrmCotacaoIncAlt = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel1: TBevel;
    Label9: TLabel;
    dtCotacao: TDateTimePicker;
    edtCodigo: TEdit;
    edtSimbolo: TEdit;
    edtNome: TEdit;
    btnGravar: TButton;
    brnCancelar: TButton;
    edtTipo: TEdit;
    Button3: TButton;
    edtTxCompra: TEdit;
    edtTxVenda: TEdit;
    edtParCompra: TEdit;
    edtParVenda: TEdit;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    procedure FormShow(Sender: TObject);
    procedure brnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure edtTxCompraKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    procedure LimpaForm;
  public
    { Public declarations }
  end;

var
  frmCotacaoIncAlt: TfrmCotacaoIncAlt;

implementation

{$R *.dfm}

uses uDm, uPrincipal, uLocalizaMoedas;

procedure TfrmCotacaoIncAlt.btnGravarClick(Sender: TObject);
begin
  if Length(Trim(edtCodigo.Text)) = 0 then
  begin
    Application.MessageBox('Informe o C?digo da Moeda para continuar.','Cota??o de Moedas',MB_ICONINFORMATION);
    edtCodigo.SetFocus;
    Exit;
  end;

  if Length(Trim(edtSimbolo.Text)) = 0 then
  begin
    Application.MessageBox('Informe a Sigla da Moeda para continuar.','Cota??o de Moedas',MB_ICONINFORMATION);
    edtSimbolo.SetFocus;
    Exit;
  end;

  if Length(Trim(edtTipo.Text)) = 0 then
  begin
    Application.MessageBox('Informe o Tipo da Moeda para continuar. (A/B)','Cota??o de Moedas',MB_ICONINFORMATION);
    edtTipo.SetFocus;
    Exit;
  end;

  if Length(Trim(edtNome.Text)) = 0 then
  begin
    Application.MessageBox('Informe uma Descri??o para Moeda para continuar.','Cota??o de Moedas',MB_ICONINFORMATION);
    edtNome.SetFocus;
    Exit;
  end;

  {
    Os valores das taxas de Compra e Venda como os das Paridades podem ser infomados manualmente
    pelo usu?rio ou caso ele prefira que o programa fa?a a aquisi??o dos valores no reposit?rio do
    Banco Central do Brasil, tais valores podem ser grava??o com o valor (0) zero.
  }

  if Application.MessageBox('Confirma a grava??o das informa??es digitadas?','Cota??o de Moedas',MB_YESNO+MB_ICONQUESTION) = IDYES  then
  begin
    if not Dm.fbConn.InTransaction then
    Dm.fbConn.StartTransaction;

    if Tag = 1 then
    begin
      with Dm.qryCotacoes do
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into cotacoes (');
        SQL.Add('data_cotacao, codigo, taxa_compra, taxa_venda, paridade_compra, paridade_venda '+
                ') values ('+
                ':data_cotacao, :codigo, :taxa_compra, :taxa_venda, :paridade_compra, :paridade_venda)');

        Params.ParamByName('data_cotacao').Value    := StringReplace(DateToStr(dtCotacao.Date), '/', '.', [rfReplaceAll]);
        Params.ParamByName('codigo').Value          := StrToIntDef(edtcodigo.Text,0);
        Params.ParamByName('taxa_compra').Value     := StrToFloatDef(edtTxCompra.Text,0);
        Params.ParamByName('taxa_venda').Value      := StrToFloatDef(edtTxVenda.Text,0);
        Params.ParamByName('paridade_compra').Value := StrToFloatDef(edtParCompra.Text,0);
        Params.ParamByName('paridade_venda').Value  := StrToFloatDef(edtParVenda.Text,0);

        ExecSQL;
      end;
    end;

    if Tag = 2 then
    begin
      with Dm.qryCotacoes do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update cotacoes set '+
                'data_cotacao = :data_cotacao, codigo = :codigo, '+
                'taxa_compra = :taxa_compra, taxa_venda = :taxa_venda, paridade_compra = :paridade_compra, '+
                'paridade_venda = :paridade_venda where id = :id');

        Params.ParamByName('id').Value              := frmPrincipal.qryCotacoesID.Value;
        Params.ParamByName('data_cotacao').Value    := StringReplace(DateToStr(dtCotacao.Date), '/', '.', [rfReplaceAll]);
        Params.ParamByName('codigo').Value          := StrToIntDef(edtcodigo.Text,0);
        Params.ParamByName('taxa_compra').Value     := StrToFloatDef(edtTxCompra.Text,0);
        Params.ParamByName('taxa_venda').Value      := StrToFloatDef(edtTxVenda.Text,0);
        Params.ParamByName('paridade_compra').Value := StrToFloatDef(edtParCompra.Text,0);
        Params.ParamByName('paridade_venda').Value  := StrToFloatDef(edtParVenda.Text,0);

        ExecSQL;
      end;
    end;


    try
      Dm.fbConn.Commit;

      frmPrincipal.AtualizarCotacoes;

      if tag = 1 then
      begin
        LimpaForm;
        dtCotacao.SetFocus;
      end;

      if tag = 2 then
      frmCotacaoIncAlt.Close;

    except
      Dm.fbConn.Rollback;

    end;

  end;

end;

procedure TfrmCotacaoIncAlt.brnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCotacaoIncAlt.Button3Click(Sender: TObject);
begin
  try
    frmLocalizaMoedas := TfrmLocalizaMoedas.Create(Owner);
    frmLocalizaMoedas.Tag := 1;
    frmLocalizaMoedas.ShowModal;
  finally
    frmLocalizaMoedas.Free;
  end;
end;

procedure TfrmCotacaoIncAlt.edtCodigoExit(Sender: TObject);
begin
  if Length(Trim(edtCodigo.Text)) = 0 then
  Exit;

  with Dm.qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select tipo, simbolo, nome from moedas where codigo = :codigo');
    Params.ParamByName('codigo').Value := StrToInt(edtCodigo.Text);
    Open;
  end;

  if not Dm.qryAux.Eof then
  begin
    edtTipo.Text    := Dm.qryAux.FieldByName('tipo').Text;
    edtSimbolo.Text := Dm.qryAux.FieldByName('simbolo').Text;
    edtNome.Text    := Dm.qryAux.FieldByName('nome').Text;
    edtTxCompra.SetFocus;
  end
  else
  begin
    Application.MessageBox('O c?digo da Moeda informada n?o foi localizado no Cadastro de Moedas.','Cota??o de Moedas',MB_ICONINFORMATION );
    edtCodigo.SetFocus;
  end;
end;

procedure TfrmCotacaoIncAlt.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  edtCodigoExit(Sender);
end;

procedure TfrmCotacaoIncAlt.edtTxCompraKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in (['0'..'9',',',#8])) then
  Key := #0;
end;

procedure TfrmCotacaoIncAlt.FormShow(Sender: TObject);
begin
  if Tag = 1 then
  begin
    Caption := 'Cota??o de Moedas - Incluindo';
    LimpaForm;
    dtcotacao.Date := frmPrincipal.dtCotacao.Date;
    dtCotacao.SetFocus;
  end;

  if Tag = 2 then
  begin
    Caption         := 'Cota??o de Moedas - Alterando';
    dtCotacao.Date  := frmPrincipal.qryCotacoesDATA_COTACAO.Value;
    edtcodigo.Text  := frmPrincipal.qryCotacoesCODIGO.AsString;
    edtCodigoExit(Sender);

    edtSimbolo.Text   := frmPrincipal.qryCotacoesSIMBOLO.Value;
    edtNome.Text      := frmPrincipal.qryCotacoesNOME.Value;
    edtTxcompra.Text  := FormatFloat('0.0000', frmPrincipal.qryCotacoesTAXA_COMPRA.Value );
    edtTxVenda.Text   := FormatFloat('0.0000', frmPrincipal.qryCotacoesTAXA_VENDA.Value);
    edtParCompra.Text := FormatFloat('0.0000000', frmPrincipal.qryCotacoesPARIDADE_COMPRA.Value);
    edtParVenda.Text  := FormatFloat('0.0000000', frmPrincipal.qryCotacoesPARIDADE_VENDA.Value);

    dtCotacao.SetFocus;
  end;
end;

procedure TfrmCotacaoIncAlt.LimpaForm;
begin
  dtCotacao.Date := frmPrincipal.dtCotacao.Date;
  edtCodigo.Clear;
  edtSimbolo.Clear;
  edtTipo.Clear;
  edtNome.Clear;
  edtTxCompra.Text  := '0,0000';
  edtTxVenda.Text   := '0,0000';
  edtParCompra.Text := '0,0000000';
  edtParVenda.Text  := '0,0000000';
end;

end.
