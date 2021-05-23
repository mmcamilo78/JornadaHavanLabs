{
  Projeto..: Desafio Programa��o - Jornada Labs HAVAN - PROWAY
  Candidato: M�rcio Moreira Camilo
  Telefone.: (47)98867-7130
  E-mail...: mmcamilo@gmail.com
  Data.....: 14/05/2021

  Parte Extra - Cadastro de Moedas que ser�o utilizadas para Cota��o e Opera��es de C�mbio

                Ideal utilizar o padr�o j� estabelecido pelo Banco Central em rela��o
                ao C�digo da Moeda e ao Tipo da Moeda. Essas informa��es s�o cruciais nas
                rotinas de convers�o de moedas de diferentes pa�ses.
}

unit uMoedasIncAlt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, MoneyEdit,
  Vcl.ComCtrls;

type
  TfrmMoedasIncAlt = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtCodigo: TEdit;
    edtSimbolo: TEdit;
    edtNome: TEdit;
    Bevel1: TBevel;
    btnGravar: TButton;
    btnCancelar: TButton;
    Label9: TLabel;
    edtCodPais: TEdit;
    edtNomPais: TEdit;
    cbbTipo: TComboBox;
    gbxAjuda: TGroupBox;
    lblLinha1: TLabel;
    lblLinha2: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtSimboloEnter(Sender: TObject);
    procedure edtSimboloExit(Sender: TObject);
  private
    { Private declarations }

    procedure LimpaForm;
  public
    { Public declarations }
  end;

var
  frmMoedasIncAlt: TfrmMoedasIncAlt;

implementation

{$R *.dfm}

uses uPrincipal, uDm;

procedure TfrmMoedasIncAlt.btnGravarClick(Sender: TObject);
begin
  if Length(Trim(edtCodigo.Text)) = 0 then
  begin
    Application.MessageBox('Informe o C�digo da Moeda para continuar.','Moedas de C�mbio',MB_ICONINFORMATION);
    edtCodigo.SetFocus;
    Exit;
  end;

  if cbbTipo.ItemIndex = -1 then
  begin
    Application.MessageBox('Informe o Tipo da Moeda para continuar.','Moedas de C�mbio',MB_ICONINFORMATION);
    cbbTipo.SetFocus;
    Exit;
  end;

  if Length(Trim(edtSimbolo.Text)) = 0 then
  begin
    Application.MessageBox('Informe o S�mbolo da Moeda para continuar.','Moedas de C�mbio',MB_ICONINFORMATION);
    edtSimbolo.SetFocus;
    Exit;
  end;

  if Application.MessageBox('Confirma a grava��o das informa��es digitadas?','Moedas de C�mbio',MB_YESNO+MB_ICONQUESTION) = IDYES  then
  begin
    if not Dm.fbConn.InTransaction then
    Dm.fbConn.StartTransaction;

    if Tag = 1 then
    begin
      with Dm.qryMoedas do
      begin
        Close;
        SQL.Clear;

          SQL.Add('insert into moedas ('+
                  'codigo, tipo, simbolo, nome, cod_pais, pais'+
                  ') values ('+
                  ':codigo, :tipo, :simbolo, :nome, :cod_pais, :pais)');

          Params.ParamByName('codigo').Value   := StrToIntDef(edtCodigo.Text,0);
          Params.ParamByName('tipo').Value     := cbbTipo.Text;
          Params.ParamByName('simbolo').Value  := edtSimbolo.Text;
          Params.ParamByName('nome').Value     := edtNome.Text;
          Params.ParamByName('cod_pais').Value := StrToIntDef(edtCodPais.Text,0);
          Params.ParamByName('pais').Value     := edtNomPais.Text;

          ExecSQL;
      end;
    end;

    if Tag = 2 then
    begin
      with Dm.qryMoedas do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update moedas set '+
                'codigo = :codigo, tipo = :tipo, simbolo = :simbolo, nome = :nome, '+
                'cod_pais = :cod_pais, pais = :pais where id = :id');

        Params.ParamByName('id').Value       := frmPrincipal.qryMoedasID.Value;
        Params.ParamByName('codigo').Value   := StrToIntDef(edtCodigo.Text,0);
        Params.ParamByName('tipo').Value     := cbbTipo.Text;
        Params.ParamByName('simbolo').Value  := edtSimbolo.Text;
        Params.ParamByName('nome').Value     := edtNome.Text;
        Params.ParamByName('cod_pais').Value := StrToIntDef(edtCodPais.Text,0);
        Params.ParamByName('pais').Value     := edtNomPais.Text;

        ExecSQL;
      end;
    end;

    try
      Dm.fbConn.Commit;

      frmPrincipal.AtualizarMoedas;

      if tag = 1 then
      begin
        LimpaForm;
        edtCodigo.SetFocus;
      end;

      if tag = 2 then
      frmMoedasIncAlt.Close;

    except
      Dm.fbConn.Rollback;

    end;
  end;

end;

procedure TfrmMoedasIncAlt.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMoedasIncAlt.edtCodigoEnter(Sender: TObject);
begin
  gbxAjuda.Visible  := True;
  gbxAjuda.Caption  := 'C�digo da Moeda';
  lblLinha1.Caption := 'Utilizar os c�digos conforme padr�o estabelecido pelo Banco Central do Brasil';
  lblLinha2.Caption := 'Dessa forma ser� poss�vel realizar a atualiza��o dos valores de cota��o das moedas de forma automatizada pelo programa.';
end;

procedure TfrmMoedasIncAlt.edtCodigoExit(Sender: TObject);
begin
  gbxAjuda.Visible  := True;
  gbxAjuda.Caption  := 'Tipo da Moeda';
  lblLinha1.Caption := 'Tipo A: Moeda cuja paridade � expressa em quantidade de moeda por uma unidade de d�lar.';
  lblLinha2.Caption := 'Tipo B: Moeda cuja paridade � expressa em quantidade de d�lar, por uma unidade de moeda.';

  if (Tag = 1) and (Length(Trim(edtCodigo.Text)) > 0) then
  begin

    with Dm.qryAux do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select codigo from moedas where codigo = :codigo');
      Params.ParamByName('codigo').Value := StrToIntDef(edtCodigo.Text,0);
      Open;
    end;

    if not Dm.qryAux.Eof then
    begin
      Application.MessageBox('O c�digo informado j� est� cadastrado! Informe um outro c�digo para continuar.','Moedas de C�mbio',MB_ICONEXCLAMATION);
      edtCodigo.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmMoedasIncAlt.edtSimboloEnter(Sender: TObject);
begin
  gbxAjuda.Visible  := True;
  gbxAjuda.Caption  := 'S�mbolo da Moeda';
  lblLinha1.Caption := 'Importante utilizar os s�mbolos j� definidos para cada moeda. Exemplo: BRL -> Real Brasil';
  lblLinha2.Caption := 'USD -> D�lar dos EUA, EUR -> Euro. Essa nomeclatura ajudar� na identifica��o das convers�es das respectivas moedas.';
end;

procedure TfrmMoedasIncAlt.edtSimboloExit(Sender: TObject);
begin
  gbxAjuda.Visible := False;
end;

procedure TfrmMoedasIncAlt.FormShow(Sender: TObject);
begin
  if Tag = 1 then
  begin
    Caption := 'Moedas de C�mbio - Incluindo';
    LimpaForm;
  end;

  if Tag = 2 then
  begin
    Caption := 'Moedas de C�mbio - Alterando';

    edtCodigo.Text    := FormatFloat('000', frmPrincipal.qryMoedasCODIGO.Value);
    cbbTipo.ItemIndex := cbbTipo.Items.IndexOf(frmPrincipal.qryMoedasTIPO.Text);
    edtSimbolo.Text   := frmPrincipal.qryMoedasSIMBOLO.Text;
    edtNome.Text      := frmPrincipal.qryMoedasNOME.Text;
    edtCodPais.Text   := FormatFloat('000000', frmPrincipal.qryMoedasCOD_PAIS.Value);
    edtNomPais.Text   := frmPrincipal.qryMoedasPAIS.Text;

    edtCodigo.SetFocus;
  end;
end;

procedure TfrmMoedasIncAlt.LimpaForm;
begin
  edtCodigo.Clear;
  cbbTipo.ItemIndex := -1;
  edtSimbolo.Clear;
  edtNome.Clear;
  edtCodPais.Clear;
  edtNomPais.Clear;
end;

end.
