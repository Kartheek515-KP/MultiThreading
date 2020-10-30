program MultiThread;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {fmPrime},
  MyThread in 'MyThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmPrime, fmPrime);
  Application.Run;
end.
