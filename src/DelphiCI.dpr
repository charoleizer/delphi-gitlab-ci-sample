program DelphiCI;

uses
  Vcl.Forms,
  main in 'View\main.pas' {Form1},
  myClass in 'MyClass\myClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
