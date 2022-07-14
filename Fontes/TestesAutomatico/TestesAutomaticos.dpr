program TestesAutomaticos;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  uTesteThreadContador in 'ClassesTeste\uTesteThreadContador.pas',
  uThreadContador in '..\Classes\uThreadContador.pas',
  uTesteQuery in 'ClassesTeste\uTesteQuery.pas',
  uspQuery in '..\Componentes\uspQuery.pas',
  uTesteCalculaValores in 'ClassesTeste\uTesteCalculaValores.pas',
  uCalculaValores in '..\Classes\uCalculaValores.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

