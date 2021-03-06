{
  Projeto..: Desafio Programa??o - Jornada Labs HAVAN - PROWAY
  Candidato: M?rcio Moreira Camilo
  Telefone.: (47)98867-7130
  E-mail...: mmcamilo@gmail.com
  Data.....: 14/05/2021

  Parte Extra - Ajuda na localiza??o e sele??o das moedas j? cadastradas
                para Cota??o do valores de Taxas e Paridades

}

unit uLocalizaMoedas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmLocalizaMoedas = class(TForm)
    GroupBox1: TGroupBox;
    cbbCriterio: TComboBox;
    edtDescricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnSelecionar: TButton;
    btnCancelar: TButton;
    dsMoedas: TDataSource;
    qryPesquisa: TFDQuery;
    qryPesquisaID: TIntegerField;
    qryPesquisaCODIGO: TSmallintField;
    qryPesquisaNOME: TStringField;
    qryPesquisaSIMBOLO: TStringField;
    qryPesquisaCOD_PAIS: TSmallintField;
    qryPesquisaPAIS: TStringField;
    qryPesquisaTIPO: TStringField;
    procedure cbbCriterioChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDescricaoChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalizaMoedas: TfrmLocalizaMoedas;

implementation

{$R *.dfm}

uses uDm, uCotacaoIncAlt;

procedure TfrmLocalizaMoedas.btnSelecionarClick(Sender: TObject);
begin
  frmCotacaoIncAlt.edtCodigo.Text := qryPesquisaCODIGO.AsString;
  frmCotacaoIncAlt.edtCodigoExit(Sender);
  Close;
end;

procedure TfrmLocalizaMoedas.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLocalizaMoedas.cbbCriterioChange(Sender: TObject);
begin
  edtDescricao.Clear;
  edtDescricao.SetFocus;

  case cbbCriterio.ItemIndex of
    0 : qryPesquisa.IndexFieldNames := 'NOME';
    1 : qryPesquisa.IndexFieldNames := 'SIMBOLO';
    2 : qryPesquisa.IndexFieldNames := 'PAIS';
  end;
end;

procedure TfrmLocalizaMoedas.DBGrid1DblClick(Sender: TObject);
begin
  btnSelecionarClick(Sender);
end;

procedure TfrmLocalizaMoedas.edtDescricaoChange(Sender: TObject);
begin
  if Length(trim(edtDescricao.Text)) > 0 then
  begin
    case cbbCriterio.ItemIndex of
      0 : begin
        qryPesquisa.Filtered := False;
        qryPesquisa.Filter   := 'NOME LIKE ' + QuotedStr('%' + edtDescricao.Text + '%');
        qryPesquisa.Filtered := True;
      end;


      1 : begin
        qryPesquisa.Filtered := False;
        qryPesquisa.Filter   := 'SIMBOLO LIKE ' + QuotedStr('%' + edtDescricao.Text + '%');
        qryPesquisa.Filtered := True;
      end;


      2 : begin
        qryPesquisa.Filtered := False;
        qryPesquisa.Filter   := 'PAIS LIKE ' + QuotedStr('%' + edtDescricao.Text + '%');
        qryPesquisa.Filtered := True;
      end;
    end
  end
  else
  qryPesquisa.Filtered := False;

end;

procedure TfrmLocalizaMoedas.edtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  btnSelecionarClick(Sender);
end;

procedure TfrmLocalizaMoedas.FormShow(Sender: TObject);
begin
  with qryPesquisa do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from moedas');
    Open;
  end;

  cbbCriterioChange(Sender);
end;

end.
