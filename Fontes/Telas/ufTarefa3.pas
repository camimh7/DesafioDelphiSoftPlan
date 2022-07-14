unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Datasnap.DBClient, uCalculaValores;

type
  TfTarefa3 = class(TForm)
    pnTela: TPanel;
    edTotal: TEdit;
    grGridValores: TDBGrid;
    lbTotal: TLabel;
    btObterTotal: TButton;
    btObterDivisao: TButton;
    edTotalDivisoes: TEdit;
    lbTotalDivisoes: TLabel;
    procedure btObterTotalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btObterDivisaoClick(Sender: TObject);
  private
    { Private declarations }
    FDataSource     : TDataSource;
    FCalculaValores : TCalculaValores;

    procedure CriaDataSource;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation


{$R *.dfm}

procedure TfTarefa3.btObterDivisaoClick(Sender: TObject);
begin
  edTotalDivisoes.Text := CurrToStrF(FCalculaValores.ObterTotalDivisoes, ffCurrency,2);
end;

procedure TfTarefa3.btObterTotalClick(Sender: TObject);
begin
  edTotal.Text := CurrToStrF(FCalculaValores.ObterTotalValores, ffCurrency,2);
end;

procedure TfTarefa3.CriaDataSource;
begin
  FDataSource := TDataSource.Create(Self);
  FDataSource.DataSet := FCalculaValores.DataSetValores;
  grGridValores.DataSource := FDataSource;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  FCalculaValores := TCalculaValores.Create;
  CriaDataSource;
  FCalculaValores.PopulaValoresRandomicos;
end;

procedure TfTarefa3.FormDestroy(Sender: TObject);
begin
  if Assigned(FCalculaValores) then
     FreeAndNil(FCalculaValores);
  if Assigned(FDataSource) then
     FreeAndNil(FDataSource);
end;

end.
