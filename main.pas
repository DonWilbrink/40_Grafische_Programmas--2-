unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TmainForm }

  TmainForm = class(TForm)
    btnDiaWeb: TButton;
    btnMoiree: TButton;
    btnDriehoeken: TButton;
    Memo1: TMemo;
    pbMain: TPaintBox;
    pnlTop: TPanel;
    procedure btnDiaWebClick(Sender: TObject);
    procedure btnDriehoekenClick(Sender: TObject);
    procedure btnMoireeClick(Sender: TObject);
  private

  public

  end;

var
  mainForm: TmainForm;

implementation

{$R *.lfm}

{ TmainForm }

procedure TmainForm.btnDiaWebClick(Sender: TObject);
var
  a, b, i, j, y1, y2: Integer;
begin
  pbMain.Canvas.Clear;
  Memo1.Lines.Clear;
  y1 := 0;
  y2 := 300;
  a := 0;
  b := 0;
  for i := 0 to 7 do
  begin
    a := i * 36;
    for j := 0 to 7 do
    begin
      b := j * 36;
      pbMain.Canvas.MoveTo(a,y1);
      pbMain.Canvas.LineTo(b,y2);
    end;
  end;
end;

procedure TmainForm.btnDriehoekenClick(Sender: TObject);
var
  j, k, x0, y0: Integer;
  a, b, x, y: Array[1..3] of Integer;
begin
  pbMain.Canvas.Clear;
  Memo1.Lines.Clear;
  a[1] := 6;
  a[2] := 20;
  a[3] := 12;
  b[1] := 12;
  b[2] := 9;
  b[3] := -6;
  x0 := 0;
  y0 := 139;
  k := 1;
  repeat
    for j:=1 to 3 do
    begin
      x[j] := x0 + k * a[j];
      Memo1.Lines.Add('x['+IntToStr(j)+']='+IntToStr(x[j]));
      y[j] := y0 + k * b[j];
      Memo1.Lines.Add('y['+IntToStr(j)+']='+IntToStr(y[j]));
    end;
    pbMain.Canvas.MoveTo(x[1],y[1]);
    pbMain.Canvas.LineTo(x[2],y[2]);
    pbMain.Canvas.LineTo(x[3],y[3]);
    pbMain.Canvas.LineTo(x[1],y[1]);
    k := k + 1;
  until k >= 22;
end;

procedure TmainForm.btnMoireeClick(Sender: TObject);
var
  a, j: Integer;
begin
  pbMain.Canvas.Clear;
  Memo1.Lines.Clear;
  for j := 0 to 25 do
  begin
    a := j * 10;
    with pbMain.Canvas do
    begin
      MoveTo(0,250);
      LineTo(a,0);
      MoveTo(0,250);
      LineTo(250,a);
    end;
  end;
  for j := 0 to 25 do
  begin
    a := j * 10;
    with pbMain.Canvas do
    begin
      MoveTo(250,0);
      LineTo(0,a);
      MoveTo(250,0);
      LineTo(a,250);
    end;
  end;
end;

end.

