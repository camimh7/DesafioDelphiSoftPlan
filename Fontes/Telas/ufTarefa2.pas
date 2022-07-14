unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfTarefa2 = class(TForm)
    pnPrincipal: TPanel;
    btExecutar: TButton;
    edThread01: TEdit;
    edThread02: TEdit;
    lbThread01: TLabel;
    lbThread02: TLabel;
    lbBarraThread1: TLabel;
    pbThread01: TProgressBar;
    pbThread02: TProgressBar;
    lbBarraThread2: TLabel;
    lbPorcThread1: TLabel;
    lbPorcThread2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btExecutarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaProgressao01(prCont : Integer);
    procedure AtualizaProgressao02(prCont : Integer);
    procedure ReiniciaProgressao;
    procedure HabilitaBotao;
    procedure IniciaThread;
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;


implementation

{$R *.dfm}

uses
  uThreadContador;

procedure TfTarefa2.btExecutarClick(Sender: TObject);
begin
  ReiniciaProgressao;

  if ((edThread01.Text = '')  or (edThread02.Text = '')) then
     begin
       MessageDlg('O tempo de sleep das threads deve ser preenchido.',mtError,[mbOK],1);
       edThread01.SetFocus;
       Exit;
     end;

  IniciaThread;

  btExecutar.Enabled := False;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.Destroy;
end;

procedure TfTarefa2.HabilitaBotao;
begin
  //Pra barra de progressão não se perder, só vamos deixar o usuário executar na mesma tela novamente quando
  //acabar o processo
  if (pbThread01.Position = 100) AND (pbThread02.Position = 100) then
    btExecutar.Enabled := True;
end;

procedure TfTarefa2.IniciaThread;
var
  wThread01,
  wThread02 : TThreadContador;
begin
  wThread01 := TThreadContador.Create;
  wThread01.Tempo := StrToInt(edThread01.Text);
  wThread01.OnProgressao := AtualizaProgressao01;
  wThread01.Start;

  wThread02 := TThreadContador.Create;
  wThread02.Tempo := StrToInt(edThread02.Text);
  wThread02.OnProgressao := AtualizaProgressao02;
  wThread02.Start;
end;

procedure TfTarefa2.ReiniciaProgressao;
begin
  //Reiniciar a progressão
  pbThread01.StepIt;
  pbThread02.StepIt;
  lbPorcThread1.Caption := '0%';
  lbPorcThread2.Caption := '0%';
end;

procedure TfTarefa2.AtualizaProgressao01(prCont : Integer);
begin
  pbThread01.StepBy(1);
  lbPorcThread1.Caption := IntToStr(prCont) + '%';

  HabilitaBotao;
end;

procedure TfTarefa2.AtualizaProgressao02(prCont: Integer);
begin
  pbThread02.StepBy(1);
  lbPorcThread2.Caption := IntToStr(prCont) + '%';

  HabilitaBotao;
end;

end.
