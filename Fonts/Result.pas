unit Result;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TFResult = class(TForm)
    grResult: TDBGrid;
    btSelecionar: TButton;
    procedure btSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FResult: TFResult;

implementation

{$R *.dfm}

procedure TFResult.btSelecionarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
