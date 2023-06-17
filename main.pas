unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus, Spin;

type

  { TmainForm }

  TmainForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    miDiagNHoek: TMenuItem;
    miDiagWeb: TMenuItem;
    miMoiree: TMenuItem;
    miDriehoek: TMenuItem;
    miZeshoek: TMenuItem;
    pbMain: TPaintBox;
    pnlTop: TPanel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    procedure miDiagNHoekClick(Sender: TObject);
    procedure miDriehoekClick(Sender: TObject);
    procedure miMoireeClick(Sender: TObject);
    procedure miDiagWebClick(Sender: TObject);
    procedure miZeshoekClick(Sender: TObject);
  private

  public

  end;

var
  mainForm: TmainForm;

implementation

{$R *.lfm}

{ TmainForm }

procedure TmainForm.miDriehoekClick(Sender: TObject);
var
  j, k, x0, y0: Integer;
  a, b, x, y: Array[1..3] of Integer;
begin
  pbMain.Canvas.Clear;
  Label1.Visible:=False;
  Label2.Visible:=False;
  Label3.Visible:=False;
  SpinEdit1.Visible:=False;
  SpinEdit2.Visible:=False;
  SpinEdit3.Visible:=False;
  SpinEdit4.Visible:=False;
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
      y[j] := y0 + k * b[j];
    end;
    pbMain.Canvas.MoveTo(x[1],y[1]);
    pbMain.Canvas.LineTo(x[2],y[2]);
    pbMain.Canvas.LineTo(x[3],y[3]);
    pbMain.Canvas.LineTo(x[1],y[1]);
    k := k + 1;
  until k >= 22;
end;

procedure TmainForm.miDiagNHoekClick(Sender: TObject);
var
  a, b, n, i, j, u, v: Integer;
  w, w1: real;
  x, y: Array of Integer;
begin
  pbMain.Canvas.Clear;
  Label1.Visible:=True;
  Label2.Visible:=True;
  Label3.Visible:=False;
  SpinEdit1.Visible:=True;
  SpinEdit2.Visible:=True;
  SpinEdit3.Visible:=True;
  SpinEdit4.Visible:=False;
  a := SpinEdit1.Value;
  b := SpinEdit2.Value;
  n := SpinEdit3.Value;
  SetLength(x,n);
  SetLength(y,n);
  u := 300; v := 200;
  w := (360/n)*pi/180;
  for j := 1 to n do
  begin
    w1 := (j-1)*w;
    x[j-1] := Trunc(u+a*Cos(w1));
    y[j-1] := Trunc(v-b*Sin(w1));
  end;
  for i := 1 to n-1 do
  begin
    for j := i+1 to n do
    begin
      pbMain.Canvas.MoveTo(x[i-1],y[i-1]);
      pbMain.Canvas.LineTo(x[j-1],y[j-1]);
    end;
  end;
end;

procedure TmainForm.miMoireeClick(Sender: TObject);
var
  a, j: Integer;
begin
  pbMain.Canvas.Clear;
  Label1.Visible:=False;
  Label2.Visible:=False;
  Label3.Visible:=False;
  SpinEdit1.Visible:=False;
  SpinEdit2.Visible:=False;
  SpinEdit3.Visible:=False;
  SpinEdit4.Visible:=False;
  for j := 0 to 50 do
  begin
    a := j * 10;
    with pbMain.Canvas do
    begin
      MoveTo(0,500);
      LineTo(a,0);
      MoveTo(0,500);
      LineTo(500,a);
    end;
  end;
  for j := 0 to 50 do
  begin
    a := j * 10;
    with pbMain.Canvas do
    begin
      MoveTo(500,0);
      LineTo(0,a);
      MoveTo(500,0);
      LineTo(a,500);
    end;
  end;
end;

procedure TmainForm.miDiagWebClick(Sender: TObject);
var
  a, b, i, j, n, y1, y2: Integer;
begin
  pbMain.Canvas.Clear;
  Label1.Visible:=False;
  Label2.Visible:=False;
  Label3.Visible:=True;
  SpinEdit1.Visible:=False;
  SpinEdit2.Visible:=False;
  SpinEdit3.Visible:=False;
  SpinEdit4.Visible:=True;
  y1 := 0;
  y2 := pbMain.Height-5;
  a := 0;
  b := 0;
  n := SpinEdit4.Value;
  for i := 0 to n-1 do
  begin
    a := i * 40;
    for j := 0 to n-1 do
    begin
      b := j * 40;
      pbMain.Canvas.MoveTo(a,y1);
      pbMain.Canvas.LineTo(b,y2);
    end;
  end;
end;

procedure TmainForm.miZeshoekClick(Sender: TObject);
var
  x, y, a, b: Array[1..7] of Integer;
  u, v, r, j, k, n: Integer;
  h, w, w1: real;
begin
  pbMain.Canvas.Clear;
  Label1.Visible:=False;
  Label2.Visible:=False;
  Label3.Visible:=False;
  SpinEdit1.Visible:=False;
  SpinEdit2.Visible:=False;
  SpinEdit3.Visible:=False;
  SpinEdit4.Visible:=False;
  u := 200;
  v := 200;
  r := 200;
  w := 60*pi/180;
  for j := 1 to 7 do
  begin
    w1 := j * w;
    x[j] := Trunc(u+r*Cos(w1));
    y[j] := Trunc(v-r*Sin(w1));
  end;
  for n := 1 to 20 do
  begin
    for j := 1 to 6 do
    begin
      pbMain.Canvas.MoveTo(x[j],y[j]);
      pbMain.Canvas.LineTo(x[j+1],y[j+1]);
    end;
    for k := 1 to 6 do
    begin
      a[k] := Trunc((x[k] + x[k+1])/2);
      b[k] := Trunc((y[k] + y[k+1])/2);
    end;
    a[7] := a[1];
    b[7] := b[1];
    for j := 1 to 7 do
    begin
      x[j] := a[j];
      y[j] := b[j];
    end;
  end;
end;

end.

