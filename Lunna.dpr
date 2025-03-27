program Lunna;

uses
  System.SysUtils,
  Forms,
  Main in 'Fonts\Main.pas' {MainForm},
  ChildWin in 'Fonts\ChildWin.pas' {MDIChild},
  about in 'Fonts\about.pas' {AboutBox},
  Home in 'Fonts\Home.pas' {FHome},
  Login in 'Fonts\Login.pas' {FLogin},
  DataModule in 'Fonts\DataModule.pas' {DataModuleLunna: TDataModule},
  Abertura in 'Fonts\Abertura.pas' {FAbertura},
  CadastroItem in 'Fonts\CadastroItem.pas' {FCadastroItem},
  LunnaConstantes in 'Fonts\LunnaConstantes.pas',
  Result in 'Fonts\Result.pas' {FResult};

{$R *.RES}

begin
  {Chama tela de carregamento}
  FAbertura := TFAbertura.Create(Application);

  {Configura a tela de carregamento}
  FAbertura.Show;
  FAbertura.Refresh;
  FAbertura.pbBarraProgresso.Min := 0;
  FAbertura.pbBarraProgresso.Max := 4;
  FAbertura.pbBarraProgresso.StepBy(1);

  {Inicializa a aplicação}
  Application.Initialize;
  FAbertura.pbBarraProgresso.StepIt;
  Sleep(100);

  {Cria o form principal}
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFResult, FResult);
  FAbertura.pbBarraProgresso.StepIt;
  Sleep(100);

  {Cria o DataModule}
  Application.CreateForm(TDataModuleLunna, DataModuleLunna);
  FAbertura.pbBarraProgresso.StepIt;
  Sleep(100);

  FAbertura.Hide;
  FAbertura.Free;
  Application.Run;
end.
