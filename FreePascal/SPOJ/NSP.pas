var  a  :       array[1..1000,1..1000] of longint;k,i,j,u,v,x,n:longint;
procedure search(x:longint; var u,v:longint);
begin
    u:=1; v:=n;
    while a[u,v]<>x do
      if a[u,v]>x then dec(v) else inc(u);
end;
begin readln(n,k);for i:=1 to n do begin for j:=1 to n do read(a[i,j]);readln;end;for i:=1 to k do begin readln(x);search(x,u,v);writeln(u,' ',v)end;end.
