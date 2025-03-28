unit Home;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCalendars, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.CategoryButtons, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage,
  Winapi.WebView2, Winapi.ActiveX, Vcl.Edge, Vcl.OleCtrls, SHDocVw;

type
  TFHome = class(TForm)
    Panel1: TPanel;
    cpPainelLateral: TCategoryPanelGroup;
    cpCalendario: TCategoryPanel;
    cvCalendario: TCalendarView;
    cpUsuario: TCategoryPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    imFotoUsuario: TImage;
    Panel4: TPanel;
    Panel5: TPanel;
    lbUsuario: TLabel;
    cpJornada: TCategoryPanel;
    pnGeral: TPanel;
    wbBrowser: TWebBrowser;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ArredondaImagemUsuario;
    procedure AjustaPainelLateral;
    procedure CarregaFotoUsuario;
    procedure CarregaBrowser;
  private
    FFUsuario: String;
    procedure SetFUsuario(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property FUsuario : String read FFUsuario write SetFUsuario;
  end;

var
  FHome: TFHome;

implementation

{$R *.dfm}

uses DataModule;

procedure TFHome.AjustaPainelLateral;
begin
  {Ajusta o tamanho dos quadros}
  cpJornada.Height := 26 + cpJornada.Height + ((cpUsuario.Height + cpCalendario.Height + cpJornada.Height) - cpPainelLateral.Height);
  cpJornada.Repaint;
end;

procedure TFHome.ArredondaImagemUsuario;
var
rgn: HRGN;
dc : HDC;
begin
  {Cria forma e arredonda os cantos da imagem}
  rgn := CreateRoundRectRgn(0, 0, imFotoUsuario.Width, imFotoUsuario.Height, 2000, 2000);
  dc := GetDC(Panel3.Handle);
  SetWindowRgn(Panel3.Handle, rgn, true);
  ReleaseDC(Panel3.Handle, dc);
  DeleteObject(rgn);
end;

procedure TFHome.CarregaBrowser;
begin
  wbBrowser.Navigate('https://news.google.com/');
  wbBrowser.Silent;
end;

procedure TFHome.CarregaFotoUsuario;
begin
  with DataModuleLunna.qryGetFotoUsuario do
  begin
    Close;
    Parameters[0].Value := FUsuario;
    Open;
  end;

  {Caso tenha a foto informada, e exista, carrega no quadro.}
  if DataModuleLunna.qryGetFotoUsuario.FieldByName('FOTO').AsString <> '' then
  begin
    {Verifica se o arquivo existe}
    if FileExists(DataModuleLunna.qryGetFotoUsuarioFOTO.Value) then
      imFotoUsuario.Picture.LoadFromFile(DataModuleLunna.qryGetFotoUsuarioFOTO.Value)
    else
      MessageDlg('N�o foi poss�vel carregar a foto de usu�rio.', mtError,
      [mbOk], 0, mbOk);
  end;
end;

procedure TFHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFHome.FormShow(Sender: TObject);
begin
  ArredondaImagemUsuario;
  AjustaPainelLateral;
  cvCalendario.Date := StrToDate(DataModuleLunna.GetDataServidor);
  CarregaBrowser;
end;

procedure TFHome.SetFUsuario(const Value: String);
begin
  FFUsuario := Value;
end;

end.
