unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uspQuery;

type
  TfTarefa1 = class(TForm)
    pnTela: TPanel;
    btGeraSQL: TButton;
    lbColuna: TLabel;
    lbCondicoes: TLabel;
    lbSQL: TLabel;
    lbTabela: TLabel;
    mmColuna: TMemo;
    mmCondicoes: TMemo;
    mmSQL: TMemo;
    mmTabela: TMemo;
    spQuery1: TspQuery;
    procedure btGeraSQLClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure PreenchePropriedades(prMemo : TMemo; prPropriedade : TStringList);
    function ValidaCampos : Boolean;
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

uses
  Vcl.Dialogs;



{$R *.dfm}

procedure TfTarefa1.btGeraSQLClick(Sender: TObject);
var
  wI : Integer;
begin
  if not (ValidaCampos) then
     Exit;
  spQuery1.LimpaVariaveisSQL;
  mmSQL.Clear;

  PreenchePropriedades(mmColuna, spQuery1.Colunas);
  PreenchePropriedades(mmTabela, spQuery1.Tabelas);
  PreenchePropriedades(mmCondicoes,spQuery1.Condicoes);

  spQuery1.GeraSQL;

  for wI := 0 to spQuery1.SQL.Count-1 do
     mmSQL.Lines.Add(spQuery1.SQL[wI]);
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.Destroy;
end;

procedure TfTarefa1.PreenchePropriedades(prMemo: TMemo;
  prPropriedade: TStringList);
var
  wI : Integer;
begin
  for wI := 0 to prMemo.Lines.Count-1 do
     prPropriedade.Add(prMemo.Lines[wI]);
end;

function TfTarefa1.ValidaCampos: Boolean;
begin
  Result := True;

  if (mmColuna.Lines.Count = 0) or (mmTabela.Lines.Count = 0) then
     begin
       MessageDlg('Os campos colunas e tabelas devem ser informados para gerar o SQL.',mtError,[mbOK],1);
       if mmColuna.Lines.Count = 0 then
          mmColuna.SetFocus
       else
          mmTabela.SetFocus;

       Result := False;
     end;
end;

initialization
  RegisterClass(TfTarefa1);

finalization
  UnRegisterClass(TfTarefa1);

end.
