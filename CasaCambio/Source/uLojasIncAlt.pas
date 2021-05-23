unit uLojasIncAlt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmLojasIncAlt = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNome: TEdit;
    edtCidade: TEdit;
    cbbUF: TComboBox;
    Bevel1: TBevel;
    btnGravar: TButton;
    brnCancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure brnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }

    procedure LimpaForm;
  public
    { Public declarations }
  end;

var
  frmLojasIncAlt: TfrmLojasIncAlt;

implementation

{$R *.dfm}

uses uPrincipal, uDm;

procedure TfrmLojasIncAlt.brnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLojasIncAlt.btnGravarClick(Sender: TObject);
begin
  if Length(Trim(edtNome.Text)) = 0 then
  begin
    Application.MessageBox('Informe o nome da loja para continuar.','Lojas de Câmbio',MB_ICONEXCLAMATION);
    edtNome.Text;
    edtNome.SetFocus;
  end;

  if Length(Trim(edtCidade.Text)) = 0 then
  begin
    Application.MessageBox('Informe a cidade onde se localiza a loja para continuar.','Lojas de Câmbio',MB_ICONEXCLAMATION);
    edtCidade.Text;
    edtCidade.SetFocus;
  end;

  if Application.MessageBox('Confirma a gravação das informações digitadas?','Lojas de Câmbio',MB_ICONQUESTION+MB_YESNO) = IDYES then
  begin
    if not Dm.fbConn.InTransaction then
    Dm.fbConn.StartTransaction;

    if Tag = 1 then
    begin
      with Dm.qryLojas do
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into lojas (nome, cidade, uf) values (:nome, :cidade, :uf');
        Params.ParamByName('nome').Value   := edtNome.Text;
        Params.ParamByName('cidade').Value := edtCidade.Text;
        Params.ParamByName('uf').Value     := cbbUF.Text;
        ExecSQL;
      end;
    end;

    if Tag = 2 then
    begin
      with Dm.qryLojas do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update lojas set nome = :nome, cidade = :cidade, uf = :uf '+
                'where id = :id');

        Params.ParamByName('id').Value     := frmPrincipal.qryLojasID.Value;
        Params.ParamByName('nome').Value   := edtNome.Text;
        Params.ParamByName('cidade').Value := edtCidade.Text;
        Params.ParamByName('uf').Value     := cbbUF.Text;
        ExecSQL;
      end;
    end;

    try
       Dm.fbConn.Commit;
       frmPrincipal.qryLojas.Refresh;

       if Tag = 1 then
       LimpaForm;

       if Tag = 2 then
       frmLojasIncAlt.Close;
    except
       Dm.fbConn.Rollback;
    end;
  end;

end;

procedure TfrmLojasIncAlt.FormShow(Sender: TObject);
begin
  if Tag = 1 then
  begin
    Caption := 'Lojas de Câmbio - Incluir';
    edtNome.SetFocus;
  end;

  if Tag = 2 then
  begin
    Caption := 'Lojas de Câmbio - Alterar';
    edtNome.Text := frmPrincipal.qryLojasNOME.Text;
    edtCidade.Text := frmPrincipal.qryLojasCIDADE.Text;
    cbbUF.ItemIndex := cbbUF.Items.IndexOf(frmPrincipal.qryLojasUF.Text);
    edtNome.SetFocus;
  end;
end;

procedure TfrmLojasIncAlt.LimpaForm;
begin
  edtNome.Clear;
  edtCidade.Clear;
  cbbUF.ItemIndex := cbbUF.Items.IndexOf('SC');
end;

end.
