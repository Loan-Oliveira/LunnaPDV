unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.BaseImageCollection,
  Vcl.ImageCollection, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList;

type
  TFLogin = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    edUsuario: TLabeledEdit;
    edSenha: TButtonedEdit;
    btEntrar: TButton;
    StatusBar1: TStatusBar;
    VirtualImageList1: TVirtualImageList;
    ilImagens: TImageCollection;
    procedure btEntrarClick(Sender: TObject);
    procedure edSenhaRightButtonClick(Sender: TObject);
    procedure edSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edUsuarioKeyPress(Sender: TObject; var Key: Char);
  private
    FUsuario: String;
    procedure SetUsuario(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property Usuario : String read FUsuario write SetUsuario;
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses DataModule;

procedure TFLogin.btEntrarClick(Sender: TObject);
begin
  {Executa a SP_ValidaUsuario do DataModule}
  with DataModuleLunna.spValidaUsuario do
  begin
    Parameters[1].Value := edUsuario.Text;
    Parameters[2].Value := edSenha.Text;
    ExecProc;

    if Parameters[0].Value then
    begin
      {Obtém o nome do usuário}
      with DataModuleLunna.qryGetNomeUsuario do
      begin
        Close;
        Parameters[0].Value := edUsuario.Text;
        Open;
      end;

      DataModuleLunna.FNomeUsuario := DataModuleLunna.qryGetNomeUsuario.FieldByName('USUARIO').AsString;
      DataModuleLunna.FLoginUsuario := edUsuario.Text;

      {Retorna OK do login}
      Self.ModalResult := mrOk;
    end
    else
    begin
      {Informa o usuário}
      MessageDlg('Usuário e senha não conferem.', mtError,
      [mbOk], 0, mbOk);
    end;
  end;

end;

procedure TFLogin.edSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  {Se usar o Enter no campo Senha aciona o botão de entrar}
  if key=#13 then
    btEntrar.Click;
end;

procedure TFLogin.edSenhaRightButtonClick(Sender: TObject);
begin
  {Exibe/Oculta senha}
  if edSenha.PasswordChar = #0 then
    edSenha.PasswordChar := '*'
  else
    edSenha.PasswordChar := #0;
end;

procedure TFLogin.edUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  {Se usar o Enter no campo Login foca no campo senha}
  if key=#13 then
    edSenha.SetFocus;
end;

procedure TFLogin.SetUsuario(const Value: String);
begin
  FUsuario := Value;
end;

end.
