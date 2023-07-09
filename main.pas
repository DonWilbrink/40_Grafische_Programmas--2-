unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus, Spin, Math;

type

  { TmainForm }

  TmainForm = class(TForm)
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lblGrootte: TLabel;
    lblCenter: TLabel;
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
    MenuItem2: TMenuItem;
    miSpiralen: TMenuItem;
    miBloemen4: TMenuItem;
    miBloemen3: TMenuItem;
    miBloemen2: TMenuItem;
    miBloemen: TMenuItem;
    miWillekeurigeFunctie: TMenuItem;
    miOppKromme: TMenuItem;
    miParaboolstelsel: TMenuItem;
    miSinuskrommen: TMenuItem;
    miContinuFunctie: TMenuItem;
    miIngeschreven: TMenuItem;
    miDiagNHoek: TMenuItem;
    miDiagWeb: TMenuItem;
    miMoiree: TMenuItem;
    miDriehoek: TMenuItem;
    miZeshoek: TMenuItem;
    pnlSpiralen: TPanel;
    pnlBloem: TPanel;
    pnlWillekFunc: TPanel;
    pnlContinuFunctie: TPanel;
    pnlIngeschreven: TPanel;
    pnlDiagWeb: TPanel;
    pbMain: TPaintBox;
    pnlDiagNHoek: TPanel;
    pnlTop: TPanel;
    rgSpiralen: TRadioGroup;
    rgFormuleBloem: TRadioGroup;
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
    seLinkergrensX: TSpinEdit;
    seRechtergrensX: TSpinEdit;
    seBovengrensY: TSpinEdit;
    seOndergrensY: TSpinEdit;
    seGrootte: TSpinEdit;
    seCenter: TSpinEdit;
    procedure miBloemen2Click(Sender: TObject);
    procedure miBloemen3Click(Sender: TObject);
    procedure miBloemen4Click(Sender: TObject);
    procedure miBloemenClick(Sender: TObject);
    procedure miContinuFunctieClick(Sender: TObject);
    procedure miDiagNHoekClick(Sender: TObject);
    procedure miDriehoekClick(Sender: TObject);
    procedure miIngeschrevenClick(Sender: TObject);
    procedure miMoireeClick(Sender: TObject);
    procedure miDiagWebClick(Sender: TObject);
    procedure miOppKrommeClick(Sender: TObject);
    procedure miParaboolstelselClick(Sender: TObject);
    procedure miSinuskrommenClick(Sender: TObject);
    procedure miSpiralenClick(Sender: TObject);
    procedure miWillekeurigeFunctieClick(Sender: TObject);
    procedure miZeshoekClick(Sender: TObject);
  private
    procedure frmClear;
    procedure Formule(i: Integer; x: Double; var y: Double);
    function FormuleBloem(I: Integer; p: Double): Double;
    function FormuleBloem2(i: Integer; k: Integer; p: Double): Double;
    procedure Teken(I: Integer);
    procedure Teken2(i: Integer);
    procedure Teken3(i: Integer);
    function OppKromme(x: Double): Double;
    procedure Swap(a: Integer; b: Integer);
    procedure fn(x: Double; lp: Integer; hp: Integer; var y: Double; var fz: Integer);
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
  frmClear;
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
  frmClear;
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
  frmClear;
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
  frmClear;
  pnlContinuFunctie.Visible:=True;
  a := seLinker.Value;
  b := seRechter.Value;
  if a>b then Swap(a,b);
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

procedure TmainForm.miBloemenClick(Sender: TObject);
var
  I : Integer;
begin
  I := rgFormuleBloem.ItemIndex + 1;
  Teken(I);
end;

procedure TmainForm.miBloemen2Click(Sender: TObject);
var
  i: Integer;
begin
  i := 1;
  Teken2(i);
end;

procedure TmainForm.miBloemen3Click(Sender: TObject);
var
  i: Integer;
begin
  i := 2;
  Teken3(i);
end;

procedure TmainForm.miBloemen4Click(Sender: TObject);
var
  j, k, n, u, v, w, x, x1, x2, y, y1, y2: Integer;
  c, p, p1, r, rd: Double;
begin
  frmClear;
  u := Trunc(pbMain.Width/2);
  v := Trunc(pbMain.Height/2);
  n := 4;
  c := 0.25;
  rd := pi/180;
  k := 30;
  while k<v-60 do
  begin
    for w := 0 to 360 do
    begin
      p := w * rd;
      r := k * (1 + c * abs(sin(n * p)));
      x := Trunc(u+r*Cos(p));
      y := Trunc(v-r*Sin(p));
      if p=0 then
      begin
        x1 := x;
        y1 := y;
      end
      else
      begin
        x2 := x;
        y2 := y;
        pbMain.Canvas.MoveTo(x1,y1);
        pbMain.Canvas.LineTo(x2,y2);
        x1 := x2;
        y1 := y2;
      end;
    end;
    k := k + 10;
  end;
  r := 30;
  p1 := 180 / n * rd;
  for j := 1 to n do
  begin
    p := j * p1;
    x1 := Trunc(u+r*Cos(p));
    y1 := Trunc(v-r*Sin(p));
    x2 := Trunc(u+r*Cos(p+pi));
    y2 := Trunc(v-r*Sin(p+pi));
    pbMain.Canvas.Line(x1,y1,x2,y2);
  end;
end;

procedure TmainForm.miMoireeClick(Sender: TObject);
var
  a, h, j: Integer;
begin
  frmClear;
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
  frmClear;
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

procedure TmainForm.miOppKrommeClick(Sender: TObject);
var
  j, k, v, y: Integer;
  c, x: Double;
begin
  frmClear;
  v := pbMain.Width div 4;
  k := pbMain.Height div 4;
  c := 2*pi/pbMain.Height;
  //c := 2*pi/255;
  for j := 0 to pbMain.Height do
  //for j := 0 to 255 do
  begin
    x := j*c-pi;
    //yy := Trunc(Cos(x) - (Cos(3*x)/3) + (Cos(5*x)/5) - (Cos(7*x)/7));
    y := Trunc(v - k * OppKromme(x));
    pbMain.Canvas.MoveTo(j,v);
    pbMain.Canvas.LineTo(j,y);
  end;
end;

procedure TmainForm.miParaboolstelselClick(Sender: TObject);
var
  k, u, v, x, xx, x1, x2, y, y1, y2: Integer;
  yy: Double;
begin
  frmClear;
  u := Trunc(pbMain.Width/2);
  v := Trunc(pbMain.Height/2);
  //u := 128;
  //v := 96;
  k := -v;
  repeat
    x := -110;
    repeat
      xx := Trunc(u+x*4);
      y:= Trunc(-k*x*x/6400+k);
      y := v-y;
      if x = -110 then
      begin
        x1 := xx;
        y1 := y;
      end
      else
      begin
        x2 := xx;
        y2 := y;
        pbMain.Canvas.Line(x1,y1,x2,y2);
        x1 := x2;
        y1 := y2;
      end;
      x := x + 5;
    until x >= 110;
    k := k + 10;
  until k>=v ;
end;

procedure TmainForm.miSinuskrommenClick(Sender: TObject);
var
  f, j, k, n, v, x1, x2, y, y1, y2: Integer;
  c, p, x: Double;
begin
  frmClear;
  v := 300;
  k := 200;
  p := pi/9;
  c := 2*pi/pbMain.Width;
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
    until  j>=pbMain.Width;
  end;
end;

procedure TmainForm.miSpiralenClick(Sender: TObject);
var
  q, u, v, w, x, x1, x2, y, y1, y2: Integer;
  c, p, r, rd: Double;
begin
  frmClear;
  pnlSpiralen.Visible := True;
  u := Trunc(pbMain.Width/2);
  v := Trunc(pbMain.Height/2);
  rd := Pi/180;
  if rgSpiralen.ItemIndex = 0 then
  begin
    seCenter.Visible:=False;
    lblCenter.Visible:=False;
    seGrootte.Visible:=True;
    lblGrootte.Visible:=True;
    c := seGrootte.Value;
  end
  else
  begin
    seCenter.Visible:=True;
    lblCenter.Visible:=True;
    seGrootte.Visible:=False;
    lblGrootte.Visible:=False;
    c := 0.1;
    q := seCenter.Value;
  end;
  for w := 0 to 3000 do
  begin
    p := w * rd;
    if rgSpiralen.ItemIndex = 0 then
    begin
      //c := c * 2;
      r := c * p
    end
    else
    begin
      r := q * Exp(c * p);
      if r > v then Break;
    end;
    x := Trunc(u + r * Cos(p));
    y := Trunc(v - r * Sin(p));
    //if x = 0 or x >= pbMain.Width or y = 0 or y >= pbMain.Height then Break;
    if p = 0 then
    begin
      x1 := x;
      y1 := y;
    end
    else
    begin
      x2 := x;
      y2 := y;
      pbMain.Canvas.Line(x1,y1,x2,y2);
      x1 := x2;
      y1 := y2;
    end;
  end;
end;

procedure TmainForm.miWillekeurigeFunctieClick(Sender: TObject);
var
  a, b, ch, cw, fa, fz, hp, lp, x1, x2, y1, y2: Integer;
  dx, kx, ky, x, y: Double;
begin
  frmClear;
  pnlWillekFunc.Visible:=True;
  ch := pbMain.Height;
  cw := pbMain.Width;
  a := seLinkergrensX.Value;
  b := seRechtergrensX.Value;
  hp := seBovengrensY.Value;
  lp := seOndergrensY.Value;
  if a>b then Swap(a,b);
  kx := cw/(b-a);
  ky := ch/(hp-lp);
  dx := (b-a)/cw;
  fa := 1;
  x := a;
  repeat
    x2 := Trunc(kx*(x-a));
    fn(x,lp,hp,y,fz);
    if fz=1 then
    begin
      fa := 1;
    end
    else
    begin
      if fa=1 then
      begin
        x1 := x2;
        fa := 0;
        y1 := Trunc(ky*(hp-y));
      end
      else
      begin
        y2 := Trunc(ky*(hp-y));
        pbMain.Canvas.MoveTo(x1,y1);
        pbMain.Canvas.LineTo(x2,y2);
        x1 := x2;
        y1 := y2;
      end;
    end;
    x := x + dx;
  until x >= b;
  x1 := 0;
  y1 := Trunc(ky*hp);
  x2 := cw;
  y2 := y1;
  if (y1>0) and (y1<ch) then
    pbMain.Canvas.Line(x1,y1,x2,y2);
  x1 := Trunc(kx*(-a));
  y1 := 0;
  x2 := x1;
  y2 := ch;
  if (x1>0) and (x1<cw) then
    pbMain.Canvas.Line(x1,y1,x2,y2);
end;

procedure TmainForm.miZeshoekClick(Sender: TObject);
var
  x, y, a, b: Array[1..7] of Integer;
  u, v, r, j, k, n: Integer;
  w, w1: real;
begin
  frmClear;
  u := pbMain.Width div 2;
  v := pbMain.Height div 2;
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

procedure TmainForm.frmClear;
begin
  pbMain.Canvas.Clear;
  pnlDiagNHoek.Visible:=False;
  pnlDiagWeb.Visible:=False;
  pnlIngeschreven.Visible:=False;
  pnlContinuFunctie.Visible:=False;
  pnlWillekFunc.Visible:=False;
  pnlBloem.Visible:=False;
  pnlSpiralen.Visible:=False;
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

function TmainForm.FormuleBloem(I: Integer; p: Double): Double;
begin
  Case I of
  1 : Result := Cos(4 * p);
  2 : Result := Cos(5 * p);
  3 : Result := Cos(4 * Sin(5 * p));
  4 : Result := Sin(4 * Cos(5 * p));
  5 : Result := Cos(3 * Tan(5 * p));
  6 : Result := Sin(3 * Tan(5 * p));
  7 : Result := Sin(4 * p);
  8 : Result := Sin(5 * p);
  9 : Result := Sin(5 * Cos(2 * Sin(3 * Cos(4 * p))));
  end;
end;

function TmainForm.FormuleBloem2(i: Integer; k: Integer; p: Double): Double;
begin
  case i of
    1 : Result := k * Cos(4 * Sin(2 * p));
    2 : Result := Trunc(pbMain.Height/3) + 2*k * Sin(4 * p);
  end;
end;

procedure TmainForm.Teken(I: Integer);
var
  RD, P, R: Single;
  K, U, V, W, X1, X2, Y1, Y2: Integer;

begin
  frmClear;
  pnlBloem.Visible:=True;
  U := Trunc(pbMain.Width/2);
  V := Trunc(pbMain.Height/2);
  K := V;
  RD := Pi/180;
  P := 0;
  R := FormuleBloem(I,P);
  X1 := Trunc(U + K * R * Cos(P));
  Y1 := Trunc(V - K * R * Sin(P));
  W := 1;
  while W <= 360 do
  begin
    P := W * RD;
    R := FormuleBloem(I,P);
    X2 := Trunc(U + K * R * Cos(P));
    Y2 := Trunc(V - K * R * Sin(P));
    pbMain.Canvas.Line(X1,Y1,X2,Y2);
    X1 := X2;
    Y1 := Y2;
    W := W + 1;
  end;
end;

procedure TmainForm.Teken2(i: Integer);
var
  k, v, u, w, x, x1, x2, y, y1, y2: Integer;
  rd, p, r: Double;
begin
  frmClear;
  u := Trunc(pbMain.Width/2);
  v := Trunc(pbMain.Height/2);
  //u := 200;
  //v := 200;
  rd := pi/180;
  w := 0;
  k := 2;
  repeat
    repeat
      p := w * rd;
      r := FormuleBloem2(i, k, p);
      x := Trunc(u + k * r * Cos(p));
      y := Trunc(v - k * r * Sin(p));
      if p = 0 then
      begin
        x1 := x;
        y1 := y;
      end
      else
      begin
        x2 := x;
        y2 := y;
        pbMain.Canvas.Line(x1,y1,x2,y2);
        x1 := x2;
        y1 := y2;
      end;
      w := w + 1;
    until w >= 360;
    w := 0;
    k := k + 1;
  until k >= 20;
end;

procedure TmainForm.Teken3(i: Integer);
var
  k, u, v, w, x, x1, x2, y, y1, y2: Integer;
  p, r, rd: Double;
begin
  frmClear;
  u := Trunc(pbMain.Width/2);
  v := Trunc(pbMain.Height/2);
  rd := pi/180;
  k := -60;
  repeat
    for w := 0 to 360 do
    begin
      p := w * rd;
      r := FormuleBloem2(i, k, p);
      x := Trunc(u + r * Cos(p));
      y := Trunc(v - r * Sin(p));
      if p = 0 then
      begin
        x1 := x;
        y1 := y;
      end
      else
      begin
        x2 := x;
        y2 := y;
        pbMain.Canvas.Line(x1,y1,x2,y2);
        x1 := x2;
        y1 := y2;
      end;
    end;
    k := k + 15;
  until k > 60;
end;

function TmainForm.OppKromme(x: Double): Double;
begin
  Result := Cos(x) - Cos(3*x)/3 + Cos(5*x)/5 - Cos(7*x)/7;
end;

procedure TmainForm.Swap(a: Integer; b: Integer);
var
  c: Integer;
begin
  c := a;
  a := b;
  b := c;
end;

procedure TmainForm.fn(x: Double; lp: Integer; hp: Integer; var y: Double; var fz: Integer);
var
  n : Double;
begin
//subroutine functiewaarde berekenen
  n := x*x-x-6;
  if n=0 then
    fz := 1
  else
    y := (x*x+3)/n;
  if (y<lp) or (y>hp) then
    fz := 1
  else
    fz := 0;
end;

end.

