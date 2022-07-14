unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mmTarefas: TMenuItem;
    mmTarefas01: TMenuItem;
    mmTarefas02: TMenuItem;
    mmTarefas03: TMenuItem;
    procedure mmTarefas01Click(Sender: TObject);
    procedure mmTarefas02Click(Sender: TObject);
    procedure mmTarefas03Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  frFormPrincipal: TfrFormPrincipal;

implementation

uses
  ufTarefa1, ufTarefa2, ufTarefa3;


{$R *.dfm}

procedure TfrFormPrincipal.mmTarefas01Click(Sender: TObject);
var
  wTarefa1 : TfTarefa1;
begin
  wTarefa1 := TfTarefa1.Create(Self);
  wTarefa1.Show;
end;

procedure TfrFormPrincipal.mmTarefas02Click(Sender: TObject);
var
  wTarefa2 : TfTarefa2;
begin
  wTarefa2 := TfTarefa2.Create(Self);
  wTarefa2.Show;
end;

procedure TfrFormPrincipal.mmTarefas03Click(Sender: TObject);
var
  wTarefa3 : TfTarefa3;
begin
  wTarefa3 := TfTarefa3.Create(Self);
  wTarefa3.Show;
end;
end.
