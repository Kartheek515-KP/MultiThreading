unit MyThread;

interface

uses
  System.Classes, System.SysUtils, System.IOUtils;

type
  TPrimeThread = class(TThread)
  private
    FToNumber: Integer;
  protected
    procedure Execute; override;
    function IsPrime(iNum: Integer): Boolean;
  public
    property ToNumber: integer write FToNumber;
  end;

  TSecondThread = class(TThread)
  private
    FToNumber: Integer;
    FResultString: String;
  protected
    procedure Execute; override;
    function IsPrime(iNum: Integer): Boolean;
    procedure UpdateResults;
  public
    property ToNumber: integer write FToNumber;
  end;

implementation
{ TPrimeThread }
uses
  MainForm;

procedure TPrimeThread.Execute;
var
  iCnt: integer;
  slPrime: TStringlist;
  myFile: TextFile;
begin
  slPrime := TStringlist.Create();
  try
    AssignFile(myFile, 'Prime.txt');
    slPrime.Clear;
    for iCnt :=  0 to FToNumber-1 do
    begin
      if IsPrime(iCnt) then
      begin
        slPrime.Add(IntToStr(iCnt));
      end;
    end;
    slPrime.SavetoFile('Prime.txt');
  finally
    slPrime.Free;
  end;
end;

function TPrimeThread.IsPrime(iNum: Integer): Boolean;
var
  iCnt: integer;
begin
  result := true;
  if (iNum < 0) or (iNum < 2) then
  begin
    result := false;
    exit;
  end;
  for iCnt := 2 to iNum - 1 do
  begin
    if (iNum mod iCnt) = 0 then
    begin
      result := false;
      exit;
    end;
  end;
end;

{ TSecondThread }

procedure TSecondThread.Execute;
var
  iCnt: integer;
begin
  for iCnt :=  0 to FToNumber-1 do
  begin
    if IsPrime(iCnt) then
    begin
      FResultString := IntToStr(iCnt);
      Synchronize(UpdateResults);
    end;
  end;
end;

function TSecondThread.IsPrime(iNum: Integer): Boolean;
var
  iCnt: integer;
begin
  result := true;
  if (iNum < 0) or (iNum < 2) then
  begin
    result := false;
    exit;
  end;
  for iCnt := 2 to iNum - 1 do
  begin
    if (iNum mod iCnt) = 0 then
    begin
      result := false;
      exit;
    end;
  end;
end;

procedure TSecondThread.UpdateResults;
begin
  fmPrime.PrimeMemo.Lines.Add(FResultString);
end;

end.
