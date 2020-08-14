uses crt,graph;
Const
t:array[1..6] of
pointtype=((x:85;y:12), (x:87;y:19), (x:87;y:27), (x:83;y:27), (x:83;y:19),(x:85;y:12));
var gd,gm,x,y,i:integer;
p,o,te:pointer;
c:char;
a,b,d:word;

procedure phai (var x,y:integer);
begin

putimage(x,y,o^,0);
x:=x+5;
putimage(x,y,p^,0);

end;

procedure trai (var x,y:integer);
begin
putimage(x,y,o^,0);
x:=x-5;
putimage(x,y,p^,0);
end;

procedure len (var x,y:integer);
begin
putimage(x,y,o^,0);
y:=y-5;
putimage(x,y,p^,0);
end;

procedure xuong (var x,y:integer);
begin
putimage(x,y,o^,0);
y:=y+5;
putimage(x,y,p^,0);
end;

procedure cheolenphai (var x,y:integer);
begin
putimage(x,y,o^,0);
x:=x+5; y:=y-5;
putimage(x,y,p^,0);
end;

procedure ban ( x,y:integer);
begin
repeat
putimage (x-1,y+5,te^,1);
putimage (x+66,y+5,te^,1);
y:=y-5;
until y=0;

end;


begin
gd:=detect;
initgraph(gd,gm,'');
b:=imagesize(0,0,77,49);
getmem(o,b);
getimage(3,4,77,49,o^);
for i:=1 to 10 do
begin
putpixel(random(77),random(49),random(16));
end;
setcolor(green);

line(40,5,30,30);
line(30,30,10,40);
line(10,40,10,35);
line(10,35,7,30);
line(7,30,4,35);
line(4,35,4,46);
line (4,46,10,46);
line(10,46,10,45);
line (10,45,20,45);
line (20,45,20,48);
line(20,48,35,48);
line(35,48,35,45);
line (35,45,45,45);
line(45,45,45,48);
line(45,48,60,48);
line(60,48,60,45);
line (60,45,70,45);
line(70,45,70,46);
line(70,46,76,46);
line(76,46,76,35);
line(75,35,73,30);
line (73,30,70,35);
line(70,35,70,40);
line (70,40,50,30);
line(50,30,40,5);
setfillstyle(1,green);
floodfill(40,20,green);
a:=imagesize(3,4,77,49);
getmem(p,a);
getimage(3,4,77,49,p^);
setfillstyle(1,red);
drawpoly (6,t);
floodfill(84,20,green);
d:=imagesize(81,11,90,31);
getmem(te,d);
getimage(81,11,90,31,te^);



cleardevice;
for i:=1 to 500 do
begin
putpixel(random(1024),random(768),random(16));
end;
x:=300; y:=500;
putimage(x,y,p^,0);
settextstyle(4,0,3);
setcolor(random(16));
outtextxy(400,600,'copyright: vuvantien');
outtextxy(250,650,'Email:starcraft126@yahoo.com.vn ');
repeat;
c:=readkey;
if c='d' then phai (x,y);
if c='a' then trai (x,y);
if c='s' then xuong (x,y);
if c='w' then len (x,y);
if c='e' then cheolenphai (x,y);
if c='p' then ban(x,y);
settextstyle(4,0,3);
setcolor(random(16));
outtextxy(400,600,'copyright: vuvantien');
outtextxy(250,650,'Email:starcraft126@yahoo.com.vn ');

until c=#27;
end.

Link: http://www.ddth.com/showthread.php/350914-Game-pascal-dƒy-d…nh-cho-nh?ng-ai-yˆu-th¡ch-pascal#ixzz2u9pj1N1N
