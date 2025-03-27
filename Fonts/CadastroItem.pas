unit CadastroItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ChildWin, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.WinXCtrls, Data.Win.ADODB, Data.DB, Data.FMTBcd,
  Datasnap.DBClient, Data.SqlExpr, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.pngimage, LunnaConstantes;

type
  TFCadastroItem = class(TMDIChild)
    pnFundo: TPanel;
    qryCadItem: TADOQuery;
    dsCadItem: TDataSource;
    RelativePanel1: TRelativePanel;
    edCodInterno: TDBEdit;
    edDescricao: TDBEdit;
    edFabricante: TDBEdit;
    edEspecificacao: TDBEdit;
    edQtdMin: TDBEdit;
    edQtdMax: TDBEdit;
    edValidade: TDBEdit;
    edCusto: TDBEdit;
    edVenda: TDBEdit;
    edDescontoMax: TDBEdit;
    edUnidadeMedida: TDBEdit;
    edDiasGarantia: TDBEdit;
    cbPerecivel: TDBCheckBox;
    cbKit: TDBCheckBox;
    Image1: TImage;
    btFoto: TButton;
    DBGrid1: TDBGrid;
    nvControleGrid: TDBNavigator;
    qryCadItemT002_NR_COD: TAutoIncField;
    qryCadItemT002_CA_DESCRICAO: TStringField;
    qryCadItemT002_CA_FABRICANTE: TStringField;
    qryCadItemT002_CA_ESPECIFICACAO: TStringField;
    qryCadItemT002_NR_QTD_MIN: TFloatField;
    qryCadItemT002_NR_QTD_MAX: TFloatField;
    qryCadItemT002_DT_VALIDADE: TDateTimeField;
    qryCadItemT002_LO_PERECIVEL: TBooleanField;
    qryCadItemT002_MO_CUSTO: TBCDField;
    qryCadItemT002_MO_VENDA: TBCDField;
    qryCadItemT002_LO_KIT: TBooleanField;
    qryCadItemT002_NR_GARANTIA: TIntegerField;
    qryCadItemT003_CA_DESCRICAO: TStringField;
    qryCadItemT002_NR_DESCONTO_MAX: TFloatField;
    qryCadItemT002_CA_FOTO: TStringField;
    Label1: TLabel;
    label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    sbBuscarItem: TSpeedButton;
    sbNovo: TSpeedButton;
    sbEditar: TSpeedButton;
    sbApagar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure CentralizarPanel(AForm: TForm; APanel: TRelativePanel);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sbBuscarItemClick(Sender: TObject);
    procedure HabilitaComponentes;
    procedure dsCadItemUpdateData(Sender: TObject);
  private
    FEstado: String;
    procedure SetEstado(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property Estado : String read FEstado write SetEstado;
  end;

var
  FCadastroItem: TFCadastroItem;

implementation

{$R *.dfm}

uses DataModule, Result;

procedure TFCadastroItem.dsCadItemUpdateData(Sender: TObject);
begin
  inherited;
  SetEstado(TAltera);
  HabilitaComponentes;
end;

procedure TFCadastroItem.FormCreate(Sender: TObject);
begin
  inherited;

  SetEstado(TEspera);
  HabilitaComponentes;
  CentralizarPanel(Self, RelativePanel1);
end;

procedure TFCadastroItem.FormResize(Sender: TObject);
begin
  inherited;
  CentralizarPanel(Self, RelativePanel1);
end;

procedure TFCadastroItem.FormShow(Sender: TObject);
begin
  inherited;
  CentralizarPanel(Self, RelativePanel1);
end;

procedure TFCadastroItem.HabilitaComponentes;
begin
  sbBuscarItem.Enabled := (FEstado = TEspera) or (FEstado = TMostra);
  sbNovo.Enabled       := (FEstado = TMostra) or (FEstado = TEspera);
  sbEditar.Enabled     := (FEstado = TMostra) and (qryCadItem.RecordCount > 0);
  sbApagar.Enabled     := (FEstado = TMostra) and (qryCadItem.RecordCount > 0);
end;

procedure TFCadastroItem.sbBuscarItemClick(Sender: TObject);
var
  Resultado : TFResult;
begin
  inherited;

  with qryCadItem do
  begin
    Close;
    Parameters[0].Value := InputBox('Buscar Produto', 'Informe a descrição', '');
    Open;
  end;

  if qryCadItem.RecordCount > 1 then
  begin
    Resultado := TFResult.Create(Self);
    Resultado.grResult.DataSource := dsCadItem;

    with Resultado.grResult do
    begin
      Columns.Add;
      Columns[0].Title.Caption := 'Código';
      Columns[0].FieldName := qryCadItemT002_NR_COD.FieldName;
      Columns.Add;
      Columns[1].Title.Caption := 'Descrição';
      Columns[1].FieldName := qryCadItemT002_CA_DESCRICAO.FieldName;
    end;

    Resultado.ShowModal;
    SetEstado(TMostra);
    HabilitaComponentes;
  end;
end;

procedure TFCadastroItem.SetEstado(const Value: String);
begin
  FEstado := Value;
end;

procedure TFCadastroItem.CentralizarPanel(AForm: TForm; APanel: TRelativePanel);
begin
  APanel.Left := (AForm.ClientWidth div 2) - (APanel.Width div 2);
  //APanel.Top := (AForm.ClientHeight div 2) - (APanel.Height div 2);

  APanel.Update;
  AForm.Update;
end;

end.
