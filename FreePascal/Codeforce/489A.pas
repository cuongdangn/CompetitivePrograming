type    bg      =       record
        x,y     :       longint;
        end;
var     n,m,i,j,tg,min       :       longint;
        a,cs       :       array[1..3001] of longint;
        luu     :       array[1..9000001] of bg;
begin
        readln(n);
        for i:=1 to n do
         read(a[i]);
        for i:=1 to n do cs[i]:=i;
         for i:=1 to n-1 do
          begin
           min:=i;
           for j:=i+1 to n do
            if a[j]<a[min] then min:=j;
           if min<>i then
           begin
           inc(m);
           luu[m].x:=i;
           luu[m].y:=min;tg:=a[i];
           a[i]:=a[min];a[min]:=tg;
           end;
          end;

           writeln(m);
           for i:=1 to m do
            writeln(luu[i].x-1,' ',luu[i].y-1);
end.