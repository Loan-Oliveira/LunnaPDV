unit MAIN;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Buttons, Winapi.Messages,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin,
  Vcl.ImgList, Vcl.FormTabsBar, System.ImageList, System.Actions,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.VirtualImageList,
  Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.PlatformDefaultStyleActnCtrls;

type
  TMainForm = class(TForm)
    StatusBar: TStatusBar;
    ActionList1: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    FileNew1: TAction;
    FileSave1: TAction;
    FileExit1: TAction;
    FileOpen1: TAction;
    FileSaveAs1: TAction;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowMinimizeAll1: TWindowMinimizeAll;
    HelpAbout1: TAction;
    FileClose1: TWindowClose;
    WindowTileVertical1: TWindowTileVertical;
    tbBarraPrincipal: TToolBar;
    FormTabsBar1: TFormTabsBar;
    ActionManager1: TActionManager;
    tbEstoque: TToolButton;
    CadastroProdutos: TAction;
    pmEstoque: TPopupMenu;
    Cadastrodeprodutos1: TMenuItem;
    Cadastrodeprodutos2: TMenuItem;
    N1: TMenuItem;
    Entrada1: TMenuItem;
    Sada1: TMenuItem;
    tbVenda: TToolButton;
    pmVenda: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Devoluodevenda1: TMenuItem;
    NovaVenda: TAction;
    tbClientes: TToolButton;
    tbConfiguracao: TToolButton;
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure WindowCascade1Execute(Sender: TObject);
    procedure WindowTileHorizontal1Execute(Sender: TObject);
    procedure WindowTileVertical1Execute(Sender: TObject);
    procedure CadastroProdutosExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NovaVendaExecute(Sender: TObject);
    procedure tbClientesClick(Sender: TObject);
    procedure tbConfiguracaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreateMDIChild(const Name: string);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses DataModule, Login, Home, CadastroItem, CHILDWIN, About;

procedure TMainForm.CadastroProdutosExecute(Sender: TObject);
var
  CadastroItem : TFCadastroItem;
begin
  CadastroItem := TFCadastroItem.Create(Application);
end;

procedure TMainForm.CreateMDIChild(const Name: string);
var
  Child: TMDIChild;
begin
  { create a new MDI child window }
  Child := TMDIChild.Create(Application);
  Child.Caption := Name;
end;

procedure TMainForm.FileNew1Execute(Sender: TObject);
begin
  CreateMDIChild('NONAME' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.FileOpen1Execute(Sender: TObject);
begin
  //if OpenDialog.Execute then
    //CreateMDIChild(OpenDialog.FileName);
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  Home: TFHome;
  Login : TFLogin;
  sNomeUsuario, sUsuario : String;
begin
  {Cria a tela de login}
  Login := TFLogin.Create(Application);

  {Verifica se a conex�o com o banco foi bem-sucedida}
  if DataModuleLunna.Lunna.Connected then
    Login.StatusBar1.Panels.Items[0].Text := 'Conectado '
  else
  begin
    Login.StatusBar1.Panels.Items[0].Text := 'Desconectado ';

    MessageDlg('N�o foi poss�vel conectar ao banco de dados.', mtError,
      [mbOk], 0, mbOk);

    Application.Terminate;
  end;

  {Apresenta a tela de Login}
  Login.ShowModal;

  sNomeUsuario := DataModuleLunna.FNomeUsuario;
  sUsuario := DataModuleLunna.FLoginUsuario;

  {Verifica o resultado do login}
  if Login.ModalResult <> mrOk then
    Application.Terminate;

  {Cria a tela principal}
  Home := TFHome.Create(Application);
  Home.Caption := 'Home';
  Home.lbUsuario.Caption := sNomeUsuario;
  Home.FUsuario := sUsuario;
  Home.CarregaFotoUsuario;
end;

procedure TMainForm.HelpAbout1Execute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.NovaVendaExecute(Sender: TObject);
begin
  ShowMessage('Nova Venda');
end;

procedure TMainForm.tbClientesClick(Sender: TObject);
begin
  ShowMessage('Cadastro de Clientes');
end;

procedure TMainForm.tbConfiguracaoClick(Sender: TObject);
begin
  ShowMessage('Configura��o');
end;

procedure TMainForm.WindowCascade1Execute(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm.WindowTileHorizontal1Execute(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

procedure TMainForm.WindowTileVertical1Execute(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

procedure TMainForm.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

end.
