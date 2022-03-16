program Project1;

uses
  Vcl.Forms,
  fIPAddress in 'fIPAddress.pas' {frmIP};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmIP, frmIP);
  Application.Run;
end.
