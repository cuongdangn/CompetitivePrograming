const   d       :       array[1..4] of integer = (1,0,-1,0);
        c       :       array[1..4] of integer = (0,1,0,-1);
var     a:array[1..100,1..100] of char;
        dd:array[1..100,1..100] of longint;
        n,m,i,j,min,d1:longint;
procedure       ghi;
begin
        min:=d1;
end;
procedure       DFS(u,v:longint);
var     j:longint;
begin
        for j:=1 to 4 do
          begin
                 if  ((u+d[j]) in [1..n]) and ((v+c[j]) in [1..m]) then
                if (a[u+d[j],v+c[j]]='.') then
                begin
                if  ((dd[u+d[j],v+c[j]])=0) then
                begin
                      inc(d1);
                      dd[u+d[j],v+c[j]]:=1;
                      if (((u+d[j])=1) and ((v+c[j])=1)) then ghi else  DFS(u+d[j],v+c[j]);
                end;
                end;
              end;
end;
begin
        readln(n,m); min:=0;
        for i:=1 to n do
         begin
          for j:=1 to m do
          begin
          dd[i,j]:=0;
          read(a[i,j]);
          end;
          readln;
         end;
         DFS(n,m);
         writeln(min);
end.
