unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB,
  Vcl.BaseImageCollection, Vcl.ImageCollection, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList;

type
  TDataModuleLunna = class(TDataModule)
    Lunna: TADOConnection;
    spValidaUsuario: TADOStoredProc;
    Virtualizacao: TVirtualImageList;
    Imagens: TImageCollection;
    qryGetNomeUsuario: TADOQuery;
    qryGetNomeUsuarioUSUARIO: TStringField;
    qryGetFotoUsuario: TADOQuery;
    qryGetFotoUsuarioFOTO: TWideStringField;
    qryGetDataServidor: TADOQuery;
    qryGetDataServidorDATA: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    Function GetDataServidor : String;
  private
    FFLoginUsuario: String;
    FFNomeUsuario: String;
    procedure SetFLoginUsuario(const Value: String);
    procedure SetFNomeUsuario(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property FLoginUsuario : String read FFLoginUsuario write SetFLoginUsuario;
    property FNomeUsuario : String read FFNomeUsuario write SetFNomeUsuario;
  end;

var
  DataModuleLunna: TDataModuleLunna;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModuleLunna.DataModuleCreate(Sender: TObject);
begin
  Lunna.State;
end;

function TDataModuleLunna.GetDataServidor : String;
begin
  with qryGetDataServidor do
  begin
    Close;
    Open;
  end;

  Result := qryGetDataServidor.FieldByName('DATA').AsString;
end;

procedure TDataModuleLunna.SetFLoginUsuario(const Value: String);
begin
  FFLoginUsuario := Value;
end;

procedure TDataModuleLunna.SetFNomeUsuario(const Value: String);
begin
  FFNomeUsuario := Value;
end;

end.
