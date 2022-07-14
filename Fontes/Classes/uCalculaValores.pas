unit uCalculaValores;

interface

uses
  Datasnap.DBClient,SysUtils, Data.DB;

type
  TCalculaValores = class(TObject)
  private
    FDataSetValores : TClientDataSet;

    procedure SetDataSetValores(const Value: TClientDataSet);
    procedure CriaDataSet;
  protected
  public
    constructor Create;
    destructor Destroy;override;

    procedure PopulaValoresRandomicos;
    procedure PopularValoresFixos(prNomeProjeto : String; prValor : Currency);

    function ObterTotalValores  : Currency;
    function ObterTotalDivisoes : Currency;

    property DataSetValores : TClientDataSet read FDataSetValores write SetDataSetValores;
  end;


implementation

uses
  Vcl.Dialogs;

{ TTarefa3 }

constructor TCalculaValores.Create;
begin
  inherited;
  CriaDataSet;
end;

procedure TCalculaValores.CriaDataSet;
begin
  FDataSetValores := TClientDataSet.Create(nil);
  FDataSetValores.Close;
  FDataSetValores.FieldDefs.Clear;
  FDataSetValores.FieldDefs.Add('IdProjeto',   ftInteger );
  FDataSetValores.FieldDefs.Add('NomeProjeto', ftString, 250,False);
  FDataSetValores.FieldDefs.Add('Valor',       ftCurrency);

  FDataSetValores.IndexDefs.Clear;
  FDataSetValores.CreateDataSet;
  FDataSetValores.IndexFieldNames := 'IdProjeto';
end;

destructor TCalculaValores.Destroy;
begin
  if Assigned(FDataSetValores) then
     FreeAndNil(FDataSetValores);
  inherited;
end;


function TCalculaValores.ObterTotalDivisoes: Currency;
var
  wVlrAnt : Currency;
begin
  wVlrAnt := 0;
  Result   := 0;
  FDataSetValores.First;
  while not FDataSetValores.Eof  do
     begin
       if wVlrAnt > 0 then
          begin
            try
              Result := Result + (FDataSetValores.FieldByName('Valor').AsCurrency / wVlrAnt);
            except on e : Exception do
              MessageDlg('Ocorreu um erro ao aplicar a divisão dos valores.Erro: ' + e.message,mtError,[mbOK],1);
            end;
          end;

        wVlrAnt := FDataSetValores.FieldByName('Valor').AsCurrency;
        FDataSetValores.Next;
     end;
end;


function TCalculaValores.ObterTotalValores: Currency;

begin
  Result := 0;
  FDataSetValores.First;
  while not FDataSetValores.Eof do
     begin
       Result := Result + FDataSetValores.FieldByName('Valor').AsCurrency;
       FDataSetValores.Next;
     end;
end;

procedure TCalculaValores.PopularValoresFixos(prNomeProjeto: String;
  prValor: Currency);
begin
  FDataSetValores.Append;
  FDataSetValores.FieldByName('IdProjeto').AsInteger  := FDataSetValores.RecordCount+1;
  FDataSetValores.FieldByName('NomeProjeto').AsString := prNomeProjeto;
  FDataSetValores.FieldByName('Valor').AsCurrency     := prValor;
  FDataSetValores.Post;
end;

procedure TCalculaValores.PopulaValoresRandomicos;
var
  wI : Integer;
begin
  for wI := 1 to 10 do
     begin
       FDataSetValores.Append;
       FDataSetValores.FieldByName('IdProjeto').AsInteger := wI;
       FDataSetValores.FieldByName('NomeProjeto').AsString := 'Projeto ' + IntToStr(wI);
       FDataSetValores.FieldByName('Valor').AsCurrency     := Random(1000);
       FDataSetValores.Post;
     end;
end;

procedure TCalculaValores.SetDataSetValores(const Value: TClientDataSet);
begin
  FDataSetValores := Value;
end;

end.
