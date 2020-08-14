uses    math;
var     x1,y1,v1,x2,y2,v2        :       int64;
        r1,r2,w1,w2,g   :       real;
        da1,da2 :       real;
begin
        readln(x1,y1,v1);
        readln(x2,y2,v2);
        r1:= sqrt(x1*x1+y1*y1);
        r2:= sqrt(x2*x2+y2*y2);
        w1:= v1/r1;
        w2:= v2/r2;
        g:=arccos((x1*x2+y1*y2)/(r1*r2));
        if w1<>w2 then
        begin
        da1:=g/(w1+w2);
        da2:=-g/(w1-w2);
        if da1>da2
        then write(abs(da2):0:6) else write(abs(da1):0:6);
        end
        else write(-1);
end.
