unit Abertura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TFAbertura = class(TForm)
    Panel1: TPanel;
    pbBarraProgresso: TProgressBar;
    LogoLunna: TImage;
    lbLunna: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAbertura: TFAbertura;

implementation

{$R *.dfm}

end.
