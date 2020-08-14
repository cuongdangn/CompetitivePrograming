uses    math;
var     a,b,c       :       longint;
        kq:int64;
procedure       swap(var a,b:longint);
var tg:longint;
begin
 tg:=a;
 a:=b;
 b:=tg;
end;
begin
 readln(a,b,c);
 if a>b then swap(a,b);
 if b>c then swap(b,c);
 if a>b then swap(a,b);
 kq:=a;
 b:=b-a;
 c:=c-a;
 kq:=kq+b div 3+c div 3;
 writeln(kq);
end.
