program game;
uses graph,crt;
var
 c:char;
 x,y:shortint;dem,rd,z:word;
 lp,lp2:byte;  {lp2:dong,lp:cot}
 mau,maux:array[1..4,1..4]of shortint;
 Gd,Gm: Integer;
procedure hcn(x1,y1,x2,y2,mausac:word);
var loop:word;
begin
 setcolor(mausac);
 rectangle(x1,y1,x2,y2);
 for loop:=1 to y2-y1 do
 line(x1,y1+loop,x2,y1+loop);
end;
{_____}
procedure draw;
begin
 for lp:=1to 4do
  for lp2:=1 to 4 do
   hcn(50*(lp+7),50*(lp2),50*(lp+8),50*(lp2+1),maux[lp,lp2]);
   setcolor(15);
  rectangle(400,50,600,250);
end;
{____}
procedure duoi;
var tmp:shortint;
begin
 if y>1 then
 begin
  tmp:=maux[x,y];
  maux[x,y]:=maux[x,y-1];
  maux[x,y-1]:=tmp;
  dem:=dem+1;
  y:=y-1;
 end;
end;
{____}
procedure tren;
var tmp:shortint;
begin
 if y<4 then
 begin
  tmp:=maux[x,y];
  maux[x,y]:=maux[x,y+1];
  maux[x,y+1]:=tmp;
  dem:=dem+1;
  y:=y+1;
 end;
end;
procedure phai;
var tmp:shortint;
begin
 if x>1 then
 begin
  tmp:=maux[x,y];
  maux[x,y]:=maux[x-1,y];
  maux[x-1,y]:=tmp;
  dem:=dem+1;
  x:=x-1;
 end;
end;
{____}
procedure trai;
var tmp:shortint;
begin
 if x<4 then
 begin
  tmp:=maux[x,y];
  maux[x,y]:=maux[x+1,y];
  maux[x+1,y]:=tmp;
  dem:=dem+1;
  x:=x+1;
 end;
end;
{ct chinh}
begin
repeat
 Gd := Detect; InitGraph(Gd, Gm,' ');
 if GraphResult <> grOk then Halt(1);
 {random}
 randomize;
 hcn(95,75,500,125,lightgray);
 setcolor(white);
 rectangle(100,80,495,120);
 Outtextxy(100,100,'           Nhan phim Enter de tiep tuc');
 repeat
 rd:=random(1000)+1;
 until keypressed;
 readln;
 cleardevice;
 {ve ket qua}
 for lp:=1to 4do
  for lp2:=1 to 4 do
  begin
  mau[lp,lp2]:=(lp-1)*4+(lp2); mau[4,4]:=0;
  hcn(50*(lp),50*(lp2),50*(lp+1),50*(lp2+1),mau[lp,lp2]);
  end; x:=4;y:=4; {x:cot,y:dong}
  setcolor(15);
  rectangle(50,50,250,250); {to vien}
 {gan maux = mau}
  for lp:=1 to 4 do
   for lp2:= 1 to 4 do
   maux[lp,lp2]:=mau[lp,lp2];
 {luat choi}
 OutTextXY(100,400,'Luat choi:');
 OutTextXY(100,420,'Ban hay an cac phim 2, 4, 6, 8 de xep hinh.');
 OutTextXY(105,430,'- 2   : Xuong duoi');
 OutTextXY(105,440,'- 4   : Sang trai');
 OutTextXY(105,450,'- 6   : Sang phai');
 OutTextXY(105,460,'- 8   : Len tren');
 OutTextXY(105,470,'- Esc : Thoat');
 {trao doi}
 repeat
 rd:=random(1000);
 if(rd mod 4 = 0) then tren;
 if(rd mod 4 = 1) then duoi;
 if(rd mod 4 = 2) then trai;
 if(rd mod 4 = 3) then phai;
 z:=z+1;
 until (z>200)and(x=4)and(y=4);
 dem:=0;draw;
 {bd choi}
 repeat
 c:=readkey;
 if c='2' then duoi;
 if c='8' then tren;
 if c='4' then trai;
 if c='6' then phai;
 draw;
 z:=0;
 for lp:= 1 to 4 do
  for lp2:= 1 to 4 do
   if maux[lp,lp2]=mau[lp,lp2] then
    z:=z+1;
   if z=16 then c:=chr(27);
 until c=chr(27);
 {thang thua}
 if z=16 then
 begin
  textmode(c40);
  textcolor(red);
  TextBackground(white);
  for lp:=1 to 200 do
  write('WIN!');
  writeln;
  writeln;
  textmode(c80);
  writeln('Ban da thang voi ',dem,' lan di chuyen');
  write('Nhan Esc de thoat hoac nhan Enter de tiep tuc');
  c:=readkey;
 end;
 CloseGraph;
until c=chr(27);
end.
