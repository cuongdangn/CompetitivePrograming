uses    math;
var     m1,m2,ma1,ma2       :       int64;
        i,n     :       longint;
        x,y     :       array[1..1000] of longint;
        s       :       int64;
begin
        readln(n);
        for i:=1 to n do readln(x[i],y[i]);
        m1:=maxlongint;m2:=maxlongint;ma1:=-m1;ma2:=-m2;
        for i:=1 to n do
         if x[i]<m1 then m1:=x[i];
        for i:=1 to n do
         if y[i]<m2 then m2:=y[i];
        for i:=1 to n do
         if x[i]>ma1 then ma1:=x[i];
        for i:=1 to n do
         if y[i]>ma2 then ma2:=y[i];s:=sqr(max(abs(ma2-m2),abs(ma1-m1)));writeln(s);
end.