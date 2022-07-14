unit uspQuery;

interface

uses
   FireDAC.Comp.Client,FireDAC.Phys, Classes;

type
   TspQuery = class(TFDQuery)
   private
     spCondicoes,
     spColunas,
     spTabelas   : TStringList;

    procedure SetColunas(const Value: TStringList);
    procedure SetCondicoes(const Value: TStringList);
    procedure SetTabelas(const Value: TStringList);

    function TrataColunas : String;

   protected

   published
    property Condicoes : TStringList read spCondicoes write SetCondicoes;
    property Colunas   : TStringList read spColunas   write SetColunas;
    property Tabelas   : TStringList read spTabelas   write SetTabelas;

   public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy;override;

    procedure GeraSQL; //Camilla M. Procedure que irá montar o SQL conforme propriedades
    procedure LimpaVariaveisSQL;




   end;

implementation

uses
  SysUtils,StrUtils,Vcl.Dialogs;

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited;
  spCondicoes := TStringList.Create;
  spColunas   := TStringList.Create;
  spTabelas   := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
  if Assigned(spCondicoes) then
     FreeAndNil(spCondicoes);
  if Assigned(spColunas) then
     FreeAndNil(spColunas);
  if Assigned(spTabelas) then
     FreeAndNil(spTabelas);
  inherited;
end;

procedure TspQuery.GeraSQL;
begin
  //Camilla M. Só deve possuir uma tabela para realizar o Select
  if Tabelas.Count > 1 then
     begin
       raise Exception.Create('É permitido informar apenas uma tabela, favor tentar novamente.');
     end;

  SQL.Add('SELECT ' + TrataColunas + ' FROM ' + Tabelas[0]);

  if Condicoes.Count > 0 then
     begin
       if (POS('WHERE',UpperCase(Condicoes.Text)) = 0) then
          begin
            raise Exception.Create('Para utilizar condição no SQL, é necessário que a condição inicie com WHERE.');
          end;
       SQL.Add(Condicoes.Text);
     end;
end;

procedure TspQuery.LimpaVariaveisSQL;
begin
  spCondicoes.Clear;
  spColunas.Clear;
  spTabelas.Clear;
  SQL.Clear;
end;

procedure TspQuery.SetColunas(const Value: TStringList);
begin
  spColunas := Value;
end;

procedure TspQuery.SetCondicoes(const Value: TStringList);
begin
  spCondicoes := Value;
end;

procedure TspQuery.SetTabelas(const Value: TStringList);
begin
  spTabelas := Value;
end;

function TspQuery.TrataColunas: String;
var
  wI : Integer;
  wColunas : String;
  wArrayColunas : TArray<String>;

begin
  { Tratamento de colunas
    O campo permite o usuário informar da forma que quiser, mas vai ser preparado para trocar
    espaço vazio por "," e depois colocar os campos em um array, separando eles por ","
    Então, o usuário tem a opção de preencher com , (CAMPO1,CAMPO2...) ou
    espaço vazio (CAMPO1 CAMPO2 ...)
  }

  //Pra quando o usuário colocar um campo abaixo do outro
  for wI := 0 to spColunas.Count-1 do
    begin
      if (Pos(' ',spColunas[wI]) > 0) OR (wI = 0) then
         wColunas := wColunas + spColunas[wI]
      else
         wColunas := wColunas + ' ' + spColunas[wI];
    end;

  wColunas := ReplaceStr(wColunas,' ',',');
  wArrayColunas := SplitString(wColunas,',');

  for wI := 0 to Length(wArrayColunas) -1 do
    begin
      if wI > 0 then
         Result := Result + ',';

      Result := Result + wArrayColunas[wI];
    end;
end;

initialization
  RegisterClass(TspQuery);

finalization
  UnRegisterClass(TspQuery);

end.
