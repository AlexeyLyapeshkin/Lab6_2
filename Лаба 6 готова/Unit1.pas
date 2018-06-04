unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, math, ExtCtrls, MPlayer, jpeg;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    dlgOpen1: TOpenDialog;
    mp1: TMediaPlayer;
    img1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  h1 = 20;                //Aunioa aaeuiaai e?ay aiia/2
  h = 60;                 //Aunioa aiia /2
  l = 50;
  r = 20;
  LoL = 40;
  Body = 100;
  radius = 0.3 * Body;
  hand = 0.4 * body;
  phand = 0.2 * body;
  Legs = 0.6 * body;

var
  Form1: TForm1;
  x, x1, y, kekx, keky: Extended;
  i, x0_house, y0_house, x_temp, y_temp, radius_myacha: Integer;
  x_m, y_m, x_sun, y_sun: Integer;
  tempx_sun, tempy_sun: Integer;
  fl2: Boolean;

implementation

procedure DrawBody(x0, y0: extended);
var
  tempx, tempy: Extended;
begin
  with form1 do
  begin
    tempx := x0;
    tempy := y0 + radius;
    Canvas.MoveTo(Trunc(tempx), Trunc(tempy));
    Canvas.LineTo(trunc(tempx), Trunc(tempy + body));

  end;

end;

procedure DrawHand(state: Integer; x0, y0: extended);
var
  tempx, tempy, tempnewx, tempnewy: Extended;
begin
  case state of
    1:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + hand * sin(pi / 2.5);
          tempnewy := tempy + hand * cos(pi / 2.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 6);
          tempnewy := tempnewy - hand * cos(pi / 6);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    6:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - hand * sin(pi / 2.5);
          tempnewy := tempy + hand * cos(pi / 2.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 6);
          tempnewy := tempnewy + hand * cos(pi / 6);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    2:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + hand * sin(pi / 4.5);
          tempnewy := tempy + hand * cos(pi / 4.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 2.5);
          tempnewy := tempnewy - hand * cos(pi / 2.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    7:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - hand * sin(pi / 4.5);
          tempnewy := tempy + hand * cos(pi / 4.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 2.5);
          tempnewy := tempnewy + hand * cos(pi / 2.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    3:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + hand * sin(pi / 9);
          tempnewy := tempy + hand * cos(pi / 9);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 2);
          tempnewy := tempnewy - hand * cos(pi / 2);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    8:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - hand * sin(pi / 9);
          tempnewy := tempy + hand * cos(pi / 9);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 2);
          tempnewy := tempnewy + hand * cos(pi / 2);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    4:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + hand * sin(pi / 32);
          tempnewy := tempy + hand * cos(pi / 32);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 1.8);
          tempnewy := tempnewy - hand * cos(pi / 1.8);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    9:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - hand * sin(pi / 32);
          tempnewy := tempy + hand * cos(pi / 32);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 1.8);
          tempnewy := tempnewy + hand * cos(pi / 1.8);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    5:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + hand * sin(pi / 4.5);
          tempnewy := tempy + hand * cos(pi / 4.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 2.5);
          tempnewy := tempnewy - hand * cos(pi / 2.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    10:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - hand * sin(pi / 4.5);
          tempnewy := tempy + hand * cos(pi / 4.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 2.5);
          tempnewy := tempnewy + hand * cos(pi / 2.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
  end;
end;

procedure DrawLeg(state: Integer; x0, y0: Extended);
var
  tempx, tempy, tempnewx, tempnewy: Extended;
begin
  case state of
    1:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + legs * sin(pi / 2.5);
          tempnewy := tempy + legs * cos(pi / 2.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 16);
          tempnewy := tempnewy + legs * cos(pi / 16);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    6:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - legs * sin(pi / 4);
          tempnewy := tempy + legs * cos(pi / 4);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 2.2);
          tempnewy := tempnewy + legs * cos(pi / 2.2);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    2:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + legs * sin(pi / 4.5);
          tempnewy := tempy + legs * cos(pi / 4.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 8);
          tempnewy := tempnewy + legs * cos(pi / 8);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    7:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - legs * sin(pi / 7);
          tempnewy := tempy + legs * cos(pi / 7);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 3.2);
          tempnewy := tempnewy + legs * cos(pi / 3.2);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    3:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + legs * sin(pi / 6.5);
          tempnewy := tempy + legs * cos(pi / 6.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 7);
          tempnewy := tempnewy + legs * cos(pi / 7);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    8:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - legs * sin(pi / 9);
          tempnewy := tempy + legs * cos(pi / 9);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 4.2);
          tempnewy := tempnewy + legs * cos(pi / 4.2);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    4:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + legs * sin(pi / 12.5);
          tempnewy := tempy + legs * cos(pi / 12.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 8);
          tempnewy := tempnewy + legs * cos(pi / 8);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    9:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - legs * sin(pi / 32);
          tempnewy := tempy + legs * cos(pi / 32);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 5.2);
          tempnewy := tempnewy + legs * cos(pi / 5.2);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    5:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + legs * sin(pi / 4.5);
          tempnewy := tempy + legs * cos(pi / 4.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 8);
          tempnewy := tempnewy + legs * cos(pi / 8);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    10:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - legs * sin(pi / 7);
          tempnewy := tempy + legs * cos(pi / 7);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 3.2);
          tempnewy := tempnewy + legs * cos(pi / 3.2);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
  end;
end;

procedure DrawHead(state: integer; x0, y0: extended);
var
  tempx, tempy: Extended;
begin
  with Form1 do
  begin
    tempx := x0;
    tempy := y0;
    Canvas.Pen.Width := 3;
    Canvas.MoveTo(Trunc(tempx), Trunc(tempy));
    Canvas.Ellipse(Trunc(tempx - radius), Trunc(tempy - radius), Trunc(tempx + radius), Trunc(tempy + radius));
    DrawBody(x0, y0);
    DrawHand((state mod 6), x0, y0);
    DrawHand((state mod 6) + 5, x0, y0);
    DrawLeg((state mod 6), x0, y0);
    DrawLeg((state mod 6) + 5, x0, y0);

  end;
end;

procedure DrawMen(state: Integer; x0, y0: Extended);
begin
  form1.canvas.Pen.Width := 10;
  DrawHead(state, x0, y0);
end;

procedure DrawBackground;
begin
  with form1 do
  begin
    Canvas.MoveTo(0, 480);
    Canvas.LineTo(1130, 480);
    Canvas.MoveTo(0, 400);
    Canvas.LineTo(1130, 400);
  end;
end;

procedure DrawBlock(kekx, keky: extended);
begin
  with Form1 do
  begin
    Canvas.MoveTo(Trunc(kekx), Trunc(keky));
    Canvas.LineTo(trunc(kekx), Trunc(keky - 85));
    Canvas.moveto(Trunc(kekx), Trunc(keky - 85));
    Canvas.LineTo(Trunc(kekx + 50), Trunc(keky - 170));
    Canvas.MoveTo(Trunc(kekx + 50), trunc(keky - 170));
    Canvas.LineTo(Trunc(kekx + 50), trunc(keky - 80));
  end;
end;

procedure House(x0_house: integer);
begin
  begin
    Form1.Canvas.Pen.color := 0;
    x_temp := x_temp - 3;
    x0_house := x0_house - 1;

    form1.Canvas.polygon([Point(x_temp - h, y_temp - h), Point(x0_house - l, y0_house - h1), Point(x0_house - l, y0_house + h1), Point(x_temp - h, y_temp + h), Point(x_temp + h, y_temp - h), Point(x0_house + l, y0_house - h1), Point(x0_house + l, y0_house + h1), Point(x_temp + h, y_temp + h)]);
    form1.Canvas.Rectangle(x_temp - h, y_temp - h, x_temp + h, y_temp + h);
  end;
end;

procedure DrawBall(x0, y0: extended);
begin
  with form1 do
  begin
    Canvas.Ellipse(trunc(x0 - radius_myacha), trunc(y0 - radius_myacha), Trunc(x0 + radius_myacha), Trunc(y0 + radius_myacha));
  end;
end;

procedure DrawSun(var tempx, tempy: integer);
begin
  with form1 do
  begin
    case (i mod 5) of
      1:
        Canvas.Ellipse(x_sun - r, y_sun - r, x_sun + r, y_sun + r);

      2:
        Canvas.Ellipse(x_sun - r - 10, y_sun - r - 10, x_sun + r + 10, y_sun + r + 10);

      3:
        Canvas.Ellipse(x_sun - r - 15, y_sun - r - 15, x_sun + r + 15, y_sun + r + 15);
      4:
        Canvas.Ellipse(x_sun - r - 10, y_sun - r - 10, x_sun + r + 10, y_sun + r + 10);
      5:
        Canvas.Ellipse(x_sun - r, y_sun - r, x_sun + r, y_sun + r);
    end;
  end;
end;



{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
var
  kekxtemp, kekytemp: Extended;
  fl: boolean;
begin
  Repaint;
  Form1.Canvas.MoveTo(0, 160);
  Form1.Canvas.LineTo(1200, 160);
  DrawSun(x_sun, y_sun);
  canvas.Pen.color := 0;
  DrawBackground;
  DrawBlock(kekx, keky);
  DrawBlock(kekx + 500, keky);
  DrawBlock(kekx + 1000, keky);
  x0_house := x0_house - 2;
  House(x0_house);
  drawmen(i, x, y);
  x := x + 10;
  kekx := kekx - 10;

  if (kekx - x) = 0 then
    y := y - 60;

  if (kekx - x) = -100 then
    y := y + 60;

  if (kekx - x) + 500 = 0 then
    y := y - 60;

  if (kekx - x) + 500 = -100 then
    y := y + 60;

  if (kekx - x) + 1000 = 0 then
    y := y - 60;

  if (kekx - x) + 1000 = -100 then
    y := y + 60;

  if (kekx - x) + 1000 < -110 then
  begin
    x := x - 20;
    kekx := kekx - 20;
    fl := True;
  end;

  if (x_m < x + 40) and fl then
  begin
    fl2 := False;
  end
  else
  begin
    if ((x < 1000) and fl) then
    begin
      if fl2 = true then
        x_m := x_m - 30;
      DrawBall(x_m, y_m);
    end;
  end;

  if not (fl2) then
  begin
    x_m := x_m + 20;
    if Abs(x_m - x) > 100 then
    begin
      radius_myacha := radius_myacha + 1;
    end;
    if Abs(x_m - x) > 300 then
    begin
      radius_myacha := radius_myacha + 5;
     // x_m := x_m - 10;
    end;
    if Abs(x_m - x) > 600 then
    begin
      radius_myacha := radius_myacha + 50;
      x_m := x_m - 10;
    end;
    y_m := y_m - 5;
  end;

  if (radius_myacha)>900 then
  begin
    form1.img1.Visible:=true;
   // ShowMessage('Вы сломали программу!');
    Form1.Timer1.Interval:=40000000;
  end;
  Inc(i);
  if (i mod 6) = 0 then
    Inc(i);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  img1.Visible:=false;
  mp1.Play;
  x1 := 1000;
  i := 1;
  x := 100;
  y := 200;
  kekx := 1000;
  keky := 480;
  x0_house := 350;
  y0_house := 150;
  x_temp := x0_house + l;
  y_temp := y0_house;
  x_m := 3000;
  y_m := 440;
  radius_myacha := 20;
  fl2 := True;
  x_sun := 1050;
  y_sun := 50;
end;

end.

