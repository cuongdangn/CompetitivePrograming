program MDIGITS;
var a,b,c,d:array[1..9] of shortint;
    k:array[0..9] of longint;
    i,j:byte;

procedure docchuyen;
var i:byte;
    x,y,z:longint;
begin
  for i:=0 to 9 do k[i]:=0;
  for i:=1 to 9 do begin a[i]:=0; b[i]:=0; end;
  readln(x,y);
  if x = 0 then halt;
  if x<y then begin z:=x; x:=y; y:=z; end;
  for i:=9 downto 1 do
  begin
    a[i]:=x mod 10;
    b[i]:=y mod 10;
    x:=x div 10;
    y:=y div 10;
  end;
end;

procedure doi(vt,gt:byte);
var i,j:byte;
begin
  c:=a;
  d:=b;
  if c[vt] <> gt then
  begin
    c[vt]:=gt;
    for i:=vt+1 to 9 do c[i]:=9;
    if c[vt] > a[vt] then dec(c[vt-1]);
  end;
  if d[vt] <> gt then
  begin
    d[vt]:=gt;
    for i:=vt+1 to 9 do d[i]:=0;
    if d[vt] < b[vt] then inc(d[vt-1]);
  end;
  if gt = 0 then
  begin
    j:=0;
    for i:=vt downto 1 do j:=j+c[i];
    if j<=0 then dec(c[vt-1]);
    j:=0;
    for i:=vt downto 1 do j:=j+d[i];
    if j<=0 then inc(d[vt-1]);
  end;
end;

function xd(vt,gt:byte):longint;
var i:byte;
    m,n:longint;
begin
  doi(vt,gt);
  m:=0;
  n:=0;
  for i:=1 to 9 do
  if i<>vt then
  begin
    m:=m*10+c[i];
    n:=n*10+d[i];
  end;
  if n>m then exit(0) else exit(m-n+1);
end;

begin
  repeat
    docchuyen;
    for i:=0 to 9 do
    for j:=2 to 9 do
    k[i]:=k[i]+xd(j,i);
    for i:=0 to 9 do write(k[i],' ');
    writeln;
  until false;
end.
