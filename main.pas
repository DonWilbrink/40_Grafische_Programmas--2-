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
    Label4: TLabel;
    Label5: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    miIngeschreven: TMenuItem;
    miDiagNHoek: TMenuItem;
    miDiagWeb: TMenuItem;
    miMoiree: TMenuItem;
    miDriehoek: TMenuItem;
    miZeshoek: TMenuItem;
    pnlIngeschreven: TPanel;
    pnlDiagWeb: TPanel;
    pbMain: TPaintBox;
    pnlDiagNHoek: TPanel;
    pnlTop: TPanel;
    seBreed: TSpinEdit;
    seHoog: TSpinEdit;
    seHoek: TSpinEdit;
    seK: TSpinEdit;
    seN: TSpinEdit;
    sePunt: TSpinEdit;
    procedure miDiagNHoekClick(Sender: TObject);
    procedure miDriehoekClick(Sender: TObject);
    procedure miIngeschrevenClick(Sender: TObject);
    procedure miMoireeClick(Sender: TObject);
    procedure miDiagWebClick(Sender: TObject);
    procedure miZeshoekClick(Sender: TObject);
  private
    procedure seVisible;
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
  seVisible;
  a[1] := 6;
  a[2] := 20;
  a[3] := 12;
  b[1] := 12;
  b[2] := 9;
  b[3] := -6;
  x0 := 0;
  y0 := Trunc(pbMain.Height/3);
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
  until k >= 35;
end;

procedure TmainForm.miIngeschrevenClick(Sender: TObject);
var
  h, j, k, n, n1: Integer;
  a, b, x, y: Array[1..5] of Integer;
begin
  pbMain.Canvas.Clear;
  seVisible;
  pnlIngeschreven.Visible:=True;
  h := pbMain.Height-40;
  x[1] := 40; x[2] := h; x[3] := h; x[4] := 40; x[5] := 40;
  y[1] := 40; y[2] := 40; y[3] := h; y[4] := h; y[5] := 40;
  k := seK.Value;
  n1 := seN.Value;
  for n := 1 to n1 do
  begin
    pbMain.Canvas.MoveTo(x[1],y[1]);
    for j := 2 to 4 do
      pbMain.Canvas.LineTo(x[j],y[j]);
    pbMain.Canvas.LineTo(x[1],y[1]);
    for j := 1 to 4 do
    begin
      a[j] := x[j] + Trunc((x[j+1]-x[j])/k);
      b[j] := y[j] + Trunc((y[j+1]-y[j])/k);
    end;
    for j := 1 to 4 do
    begin
      x[j] := a[j];
      y[j] := b[j];
    end;
    for j := 1 to 4 do
    begin
      x[5] := x[1];
      y[5] := y[1];
    end;
  end;
end;

procedure TmainForm.miDiagNHoekClick(Sender: TObject);
var
  a, b, n, i, j, u, v: Integer;
  w, w1: real;
  x, y: Array of Integer;
begin
  pbMain.Canvas.Clear;
  seVisible;
  pnlDiagNHoek.Visible:=True;
  a := seBreed.Value;
  b := seHoog.Value;
  n := seHoek.Value;
  SetLength(x,n);
  SetLength(y,n);
  u := Trunc(pbMain.Width/2); v := Trunc(pbMain.Height/2);
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
  a, h, j: Integer;
begin
  pbMain.Canvas.Clear;
  seVisible;
  h := pbMain.Height-10;
  for j := 0 to Trunc(h/10) do
  begin
    a := j * 10;
    with pbMain.Canvas do
    begin
      MoveTo(0,h);
      LineTo(a,0);
      MoveTo(0,h);
      LineTo(h,a);
    end;
  end;
  for j := 0 to Trunc(h/10) do
  begin
    a := j * 10;
    with pbMain.Canvas do
    begin
      MoveTo(h,0);
      LineTo(0,a);
      MoveTo(h,0);
      LineTo(a,h);
    end;
  end;
end;

procedure TmainForm.miDiagWebClick(Sender: TObject);
var
  a, b, i, j, n, y1, y2: Integer;
begin
  pbMain.Canvas.Clear;
  seVisible;
  pnlDiagWeb.Visible:=True;
  y1 := 0;
  y2 := pbMain.Height-5;
  a := 0;
  b := 0;
  n := sePunt.Value;
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
  seVisible;
  u := Trunc(pbMain.Width/2);
  v := Trunc(pbMain.Height/2);
  r := v;
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

procedure TmainForm.seVisible;
begin
  pnlDiagNHoek.Visible:=False;
  pnlDiagWeb.Visible:=False;
  pnlIngeschreven.Visible:=False;
end;

end.

