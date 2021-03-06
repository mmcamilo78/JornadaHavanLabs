unit uDm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, IniFiles, Forms, Windows, Dialogs,
  FireDAC.Comp.UI;

type
  TDM = class(TDataModule)
    fbConn: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qryCotacoes: TFDQuery;
    qryOperacoes: TFDQuery;
    qryCotacoesID: TIntegerField;
    qryCotacoesDATA_COTACAO: TDateField;
    qryCotacoesCODIGO: TSmallintField;
    qryCotacoesTAXA_COMPRA: TFloatField;
    qryCotacoesTAXA_VENDA: TFloatField;
    qryCotacoesPARIDADE_COMPRA: TFloatField;
    qryCotacoesPARIDADE_VENDA: TFloatField;
    qryOperacoesID: TIntegerField;
    qryOperacoesNOME_CLIENTE: TStringField;
    qryOperacoesMOEDA_ORIGEM: TStringField;
    qryOperacoesMOEDA_DESTINO: TStringField;
    qryOperacoesDATA_OPERACAO: TDateField;
    qryOperacoesVALOR_ORIGINAL: TFloatField;
    qryOperacoesVALOR_CONVERTIDO: TFloatField;
    qryOperacoesTAXA_COBRADA: TFloatField;
    qryAux: TFDQuery;
    qryMoedas: TFDQuery;
    qryMoedasID: TIntegerField;
    qryMoedasCODIGO: TSmallintField;
    qryMoedasNOME: TStringField;
    qryMoedasSIMBOLO: TStringField;
    qryMoedasCOD_PAIS: TSmallintField;
    qryMoedasPAIS: TStringField;
    qryMoedasTIPO: TStringField;
    qryLojas: TFDQuery;
    qryLojasID: TIntegerField;
    qryLojasNOME: TStringField;
    qryLojasCIDADE: TStringField;
    qryLojasUF: TStringField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    wIP : AnsiString;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  iConf: TIniFile;
  PathName, wBD, wPO, wCon : AnsiString;
begin

  PathName := ExtractFilePath(Application.ExeName);

  wCon := '';
  wCon := PathName + 'BD\DADOS.FDB';

  if not FileExists(PathName + 'conexao.ini') then
  begin
    iConf := TIniFile.Create(PathName+'conexao.ini');
    try
      iConf.WriteString('IPSERVER','Host','127.0.0.1');
      iConf.WriteString('DATABASE','Path', wCon);
      iConf.WriteString('PORTA','Port','3050');
    finally
      wIP := iConf.ReadString('IPSERVER','Host',wIP);
      wBD := iConf.ReadString('DATABASE','Path',wBD);
      wPO := iConf.ReadString('PORTA','Port',wPO);
      iConf.Free;
    end;
  end
  else
  begin
    iConf := TIniFile.Create(PathName+'conexao.ini');
    try
      wIP := iConf.ReadString('IPSERVER','Host',wIP);
      wBD := iConf.ReadString('DATABASE','Path',wBD);
      wPO := iConf.ReadString('PORTA','Port',wPO);
    finally
      iConf.Free;
    end;
  end;

  try

    fbConn.Close;
    FDPhysFBDriverLink1.Release;
    FDPhysFBDriverLink1.VendorLib := PathName+'fbclient.dll';

    fbConn.Params.Clear;

    fbConn.Params.Add('DriverID=FB');
    fbConn.Params.Add('Port='+wPO);
    fbConn.Params.Add('Server='+wIP);
    fbConn.Params.Add('Protocol=TCPIP');
    fbConn.Params.Add('Database='+wBD);
    fbConn.Params.Add('CharacterSet=WIN1252');
    fbConn.Params.Add('User_Name=sysdba');
    fbConn.Params.Add('Password=masterkey');


    try

      FbConn.Connected := True;

    except
      on E: Exception do
      begin

        Application.MessageBox('Erro ao tentar conectar ao banco de dados local!'+#13+
                    'Tente novamente, se o problema persistir entre em contato: mmcamilo@gmail.com','Conex?o BD',MB_ICONERROR);

        Application.Terminate;
      end;
    end;

  finally
//    iConf.Free;
  end;

end;

end.
