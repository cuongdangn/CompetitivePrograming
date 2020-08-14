uses    math;
var     dem  :       array[1..3] of longint;
        a    :       array[1..5001] of longint;
        luu  :       array[1..3,1..5001] of longint;
        t,i,n  :       longint;
begin
        readln(n);
        for i:=1 to n do
         begin
          read(a[i]);
          inc(dem[a[i]]);
          luu[a[i],dem[a[i]]]:=i;
         end;
         t:=min(dem[1],min(dem[2],dem[3]));
         writeln(t);
         if t>0 then
          begin
           for i:=1 to t do
             writeln(luu[1][i],' ',luu[2][i],' ',luu[3][i])
           end;
end.