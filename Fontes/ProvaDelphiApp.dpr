program ProvaDelphiApp;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frFormPrincipal},
  ufTarefa1 in 'Telas\ufTarefa1.pas' {fTarefa1},
  ufTarefa2 in 'Telas\ufTarefa2.pas' {fTarefa2},
  uThreadContador in 'Classes\uThreadContador.pas',
  ufTarefa3 in 'Telas\ufTarefa3.pas' {fTarefa3},
  uCalculaValores in 'Classes\uCalculaValores.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrFormPrincipal, frFormPrincipal);
  Application.Run;
end.
