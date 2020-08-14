{$M 65000,0,655360}
const
      fi = 'lt.in';
      fo = 'lt.ou';
      maxc = 10001;
var
   n,tong:longint;
   h:array[0..maxc] of longint;
   f:text;t:char;
procedure nhap;
var
    i,m,k,u,v:longint;
begin
  assign(f,fi+t); reset(f);
  read(f,m,n);read(f,k);
  for i:=0 to n do h[i]:=0;
  for i:=1 to k do
      begin
      read(f,v,u);if(h[v]<u) then h[v]:=u;
      end;
  close(f);
end;
function max(x,y:longint):longint;
begin
if x>y then max:=x else max:=y;
end;
procedure tinh;
var
   a:array[0..maxc] of longint;
   k,i,j:longint;
begin
  a[0]:=0;a[1]:=h[1];a[2]:=max(a[1],h[2]);
  for i:=3 to n do
      begin
      a[i]:=max(h[i],h[i-1])+a[i-2];
      if a[i]>a[i-1]+h[i] then a[i]:=a[i-1]+h[i];
      if a[i]>max(h[i],max(h[i-1],h[i-2]))+a[i-3]
      then a[i]:=max(h[i],max(h[i-1],h[i-2]))+a[i-3];
      end;
  tong:=a[n];
end;
procedure viet;
begin
assign(f,fo+t); rewrite(f);
writeln(f,tong);
close(f);
end;
BEGIN
for t:='0' to '9' do
    begin
    nhap;tinh;viet;
    end;
END.
