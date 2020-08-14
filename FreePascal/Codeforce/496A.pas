uses    math;
var     a       :       array[1..100] of longint;
        dem,kq  :       int64;
        n       :       longint;
        i,j     :       longint;
begin
        readln(n);kq:=maxlongint;
        for i:=1 to n do read(a[i]);
        for i:=2 to n-1 do
         begin
          dem:=-1;for j:=2 to i-1 do dem:=max(dem,a[j]-a[j-1]);
          dem:=max(dem,a[i+1]-a[i-1]);
          for j:=i+2 to n do
           dem:=max(dem,a[j]-a[j-1]);
          kq:=min(kq,dem);
         end;
         writeln(kq);
end.
