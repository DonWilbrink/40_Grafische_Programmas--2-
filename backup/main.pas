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
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    miSinuskrommen: TMenuItem;
    miContinuFunctie: TMenuItem;
    miIngeschreven: TMenuItem;
    miDiagNHoek: TMenuItem;
    miDiagWeb: TMenuItem;
    miMoiree: TMenuItem;
    miDriehoek: TMenuItem;
    miZeshoek: TMenuItem;
    pnlContinuFunctie: TPanel;
    pnlIngeschreven: TPanel;
    pnlDiagWeb: TPanel;
    pbMain: TPaintBox;
    pnlDiagNHoek: TPanel;
    pnlTop: TPanel;
    rgFormule: TRadioGroup;
    seBreed: TSpinEdit;
    seHoog: TSpinEdit;
    seHoek: TSpinEdit;
    seK: TSpinEdit;
    seN: TSpinEdit;
    sePunt: TSpinEdit;
    seLinker: TSpinEdit;
    seRechter: TSpinEdit;
    seGrootsteY: TSpinEdit;
    seKleinsteY: TSpinEdit;
    procedure miContinuFunctieClick(Sender: TObject);
    procedure miDiagNHoekClick(Sender: TObject);
    procedure miDriehoekClick(Sender: TObject);
    procedure miIngeschrevenClick(Sender: TObject);
    procedure miMoireeClick(Sender: TObject);
    procedure miDiagWebClick(Sender: TObject);
    procedure miSinuskrommenClick(Sender: TObject);
    procedure miZeshoekClick(Sender: TObject);
  private
    procedure seVisible;
    procedure Formule(i: Integer; x: Double; var y: Double);
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

procedure TmainForm.miContinuFunctieClick(Sender: TObject);
var
  a, b, c, i, xx, yy, x1, x2, y1, y2: Integer;
  x, y, hp, lp, dx, kx, ky: Double;
begin
  pbMain.Canvas.Clear;
  seVisible;
  pnlContinuFunctie.Visible:=True;
  a := seLinker.Value;
  b := seRechter.Value;
  if a>b then
  begin
    c := a;
    a := b;
    b := c;
  end;
  hp := -100000;
  lp := 100000;
  dx := (b-a)/256;
  x := a;
  i := rgFormule.ItemIndex;
  repeat
    Formule(i,x,y);
    if y>hp then hp := y;
    if y<lp then lp := y;
    x := x+dx;
  until x=b;
  Label8.Caption := 'Grootste y-waarde: ' + hp.ToString;
  Label9.Caption := 'Kleinste y-waarde: ' + lp.ToString;
  seGrootsteY.Value := Trunc(hp)+1;
  seKleinsteY.Value := Trunc(lp)-1;
  hp := seGrootsteY.Value;
  lp := seKleinsteY.Value;
  if a=b then b := b+1;
  kx := (pbMain.Width)/(b-a);
  ky := (pbMain.Height)/(hp-lp);
  x := a;
  repeat
    Formule(i,x,y);
    xx := Trunc(kx*(x-a));
    yy := Trunc(ky*(hp-y));
    if x=a then
    begin
      x1 := xx;
      y1 := yy;
    end
    else
    begin
      x2 := xx;
      y2 := yy;
      pbMain.Canvas.MoveTo(x1,y1);
      pbMain.Canvas.LineTo(x2,y2);
      x1 := x2;
      y1 := y2;
    end;
    x := x+dx;
  until x=b;
  x1 := 0;
  y1 := Trunc(ky*hp);
  x2 := pbMain.Width;
  y2 := y1;
  if (y1 >= 0) and (y1 <= pbMain.Height) then
  begin
    pbMain.Canvas.MoveTo(x1,y1);
    pbMain.Canvas.LineTo(x2,y2);
  end;
  x1 := Trunc(kx*-a);
  y1 := 0;
  x2 := x1;
  y2 := pbMain.Height;
  if (x1 >= 0) and (x1 <= pbMain.Width) then
  begin
    pbMain.Canvas.MoveTo(x1,y1);
    pbMain.Canvas.LineTo(x2,y2);
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

procedure TmainForm.miSinuskrommenClick(Sender: TObject);
var
  f, j, k, n, v, x1, x2, y, y1, y2: Integer;
  c, p, x: Double;
begin
  pbMain.Canvas.Clear;
  seVisible;
  v := 200;
  k := 200;
  p := pi/9;
  c := 2*pi/(pbMain.Width-50);
  for n := 0 to 9 do
  begin
    j := 0;
    repeat
      x := j*c;
      y := Trunc(v-k*Sin(x+n*p));
      if j=0 then
      begin
        x1 := j;
        y1 := y;
      end
      else
      begin
        x2 := j;
        y2 := y;
        pbMain.Canvas.MoveTo(x1,y1);
        pbMain.Canvas.LineTo(x2,y2);
        x1 := x2;
        y1 := y2;
      end;
      j := j + 5;
    until  j>=pbMain.Width-50;
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
  pnlContinuFunctie.Visible:=False;
end;

procedure TmainForm.Formule(i: Integer; x: Double; var y: Double);
begin
  case i of
    0:  y := Exp(-0.1*x)*Cos(x);
    1:  y := Sin(x);
    2:  y := x*x;
    3:  y := Exp(x);
    4:  y := x*x*x-2*x*x-x
  end;
end;

end.

