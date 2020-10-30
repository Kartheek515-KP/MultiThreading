unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, MyThread;

type
  TfmPrime = class(TForm)
    btnPrime: TButton;
    edPrimeNumber: TEdit;
    lblNumber: TLabel;
    PrimeMemo: TMemo;
    Label1: TLabel;
    procedure btnPrimeClick(Sender: TObject);
    procedure edPrimeNumberKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrime: TfmPrime;

implementation

{$R *.dfm}

procedure TfmPrime.btnPrimeClick(Sender: TObject);
var
  PrimeThread: TPrimeThread;
  SecondaryThread: TSecondThread;
begin
  PrimeThread := TPrimeThread.Create(True);
  PrimeThread.FreeOnTerminate := True;
  try
    PrimeThread.ToNumber := StrToInt(edPrimeNumber.Text);
    PrimeThread.Resume;
  except on EConvertError do
    begin
      PrimeThread.Free;
      ShowMessage('That is not a valid number!');
    end;
  end;

  SecondaryThread := TSecondThread.Create(True);
  SecondaryThread.FreeOnTerminate := True;
  try
    SecondaryThread.ToNumber := StrToInt(edPrimeNumber.Text);
    SecondaryThread.Resume;
  except on EConvertError do
    begin
      SecondaryThread.Free;
      ShowMessage('That is not a valid number!');
    end;
  end
end;

procedure TfmPrime.edPrimeNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9', #8] then
    inherited
  else
    Key := #0;
end;

end.
