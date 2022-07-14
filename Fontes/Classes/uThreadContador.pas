unit uThreadContador;

interface

  uses
    Classes, System.SysUtils;

type
  TOnProgressao = procedure(prCont : Integer) of object;

  TThreadContador = class(TThread)
  private
    FOnProgressao: TOnProgressao;
    FTempo : Integer;
    FCont : Integer;
    procedure SetOnProgressao(const Value: TOnProgressao);
    procedure SetTempo(const Value: Integer);
    procedure ChamaProgressao;
  protected
    procedure Execute; override;
  public
    constructor Create; reintroduce;

    property OnProgressao : TOnProgressao read FOnProgressao write SetOnProgressao;
    property Tempo : Integer read FTempo write SetTempo;

  end;

implementation

{ TThreadContador }

procedure TThreadContador.ChamaProgressao;
begin
  if Assigned(FOnProgressao) then
    FOnProgressao(FCont);
end;

constructor TThreadContador.Create;
begin
  inherited Create(True);
  FreeOnTerminate := True;
end;

procedure TThreadContador.Execute;
var
  wI : Integer;
begin
  inherited;
  for wI := 1 to 100 do
     begin
       FCont := wI;
       Synchronize(ChamaProgressao);
       Sleep(FTempo);
     end;
end;

procedure TThreadContador.SetOnProgressao(
  const Value: TOnProgressao);
begin
  FOnProgressao := Value;
end;

procedure TThreadContador.SetTempo(const Value: Integer);
begin
  FTempo := Value;
end;

end.
