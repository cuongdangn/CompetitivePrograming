   const maxc=100000;
var  a,d:array[0..10001] of longint;
     n,k,kq:longint;
procedure doc;
var i : longint;
begin
 readln(n,k);
  for i:=1to n do read(a[i]);
end;

procedure xuly;
var i,t,j : longint;
begin

kq:=0;
d[0]:=0;
	for i:=1 to n do
        begin
	 if (k<i) then t:=i-k
	else t:=0;
	 d[i]:=-maxc;
     for j:=i-1 downto t do
	  if (d[i]<d[j]+a[i])then d[i]:=d[j]+a[i];
	 if (kq< d[i]) then kq:=d[i];
        end;
	writeln(kq);
end;
begin
 doc;
  xuly;

end.
