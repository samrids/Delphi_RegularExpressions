unit fIPAddress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, System.RegularExpressions;

type
  TfrmIP = class(TForm)
    edtIP: TEdit;
    edtIP2: TEdit;
    btnResetMemo: TButton;
    btnFindIP: TSpeedButton;
    btnIPsOnly: TSpeedButton;
    btnMaskIPs: TSpeedButton;
    Memo1: TMemo;
    procedure edtIPChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnResetMemoClick(Sender: TObject);
    procedure btnFindIPClick(Sender: TObject);
    procedure btnIPsOnlyClick(Sender: TObject);
    procedure btnMaskIPsClick(Sender: TObject);
  private
    function IPMatchEvaluator(const Match: TMatch): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIP: TfrmIP;

implementation

{$R *.dfm}

uses
  System.UITypes;

procedure TfrmIP.btnFindIPClick(Sender: TObject);
const
  IPRegEx = '((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)';
var
  Match: TMatch;
  RegEx : TRegEx;
begin
  RegEx := TRegEx.Create(IPRegEx);
  if Memo1.SelLength > 0 then {if some text is selected, search beyond it}
    Match := RegEx.Match(Memo1.Text, Memo1.SelStart + Memo1.SelLength) {find next IP}
  else
    Match := RegEx.Match(Memo1.Text); {find first IP}

  if Match.Success then
  begin
    Memo1.SelStart := Match.Index-1;
    Memo1.SelLength := Match.Length;
  end;
end;

procedure TfrmIP.btnIPsOnlyClick(Sender: TObject);
const
  IPRegEx = '((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)';
var
  Match: TMatch;
  Matches: TMatchCollection;
begin
  Matches := TRegEx.Matches(Memo1.Text, IPRegEx);
  Memo1.Clear;
  for Match in Matches do
    Memo1.Lines.Add(Match.Value);
end;

function TfrmIP.IPMatchEvaluator(const Match: TMatch): string;
begin
  result := 'XXX.XXX.XXX.XXX';
end;

procedure TfrmIP.btnMaskIPsClick(Sender: TObject);
const
  IPRegEx = '((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)';
begin
  Memo1.Text := TRegEx.Replace(Memo1.Text, IPRegEx, IPMatchEvaluator);
end;

procedure TfrmIP.btnResetMemoClick(Sender: TObject);
begin
  memo1.Clear;
  memo1.lines.add('Your Public IPv4 is: 172.16.1.10');
  memo1.lines.add('Your Public IPv6 is: Not Detected');
  memo1.lines.add('Your Local IP is: 192.168.10.15');
  memo1.lines.add('Location: Wellington, WGN NZ');
  memo1.lines.add('ISP: Some Random Internet Provider');
end;

procedure TfrmIP.edtIPChange(Sender: TObject);
const
  IPRegEx = '^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$';
var
  edt : TEdit;
begin
  edt := Sender as TEdit;
  if TRegEx.IsMatch(edt.Text, IPRegEx) then
    edt.Color := TColorRec.Lightgreen
  else
    edt.Color := TColorRec.Rosybrown;
end;

procedure TfrmIP.FormCreate(Sender: TObject);
begin
  edtIPChange(edtIP);
  edtIPChange(edtIP2);
  btnResetMemo.Click;
end;

end.
