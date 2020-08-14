uses    math;
var     a :array[1..1000000]of int64;
        cs      :       array[1..1000000] of longint;
        da:       array[1..1000000] of string;
        n:longint;
procedure       swap(var a,b:longint);
var tg:longint;
begin
 tg:=a;
 a:=b;
 b:=tg;
end;
procedure       QS(l,h  :       longint);
var     i,j      :       longint;
        tg,x      :       int64;
begin
        i:=l;
        j:=h;
        x:=a[(l+h)div 2];
        repeat
                while a[i]<x do inc(i);
                while a[j]>x do dec(j);
                if i<=j then
                        begin
                                tg:=a[i];
                                a[i]:=a[j];
                                a[j]:=tg;
                                swap(cs[i],cs[j]);
                                inc(i);
                                dec(j);
                        end;
        until i>j;
        if i<h then QS(i,h);
        if j>l then QS(l,j);
end;
procedure       doc;
var i:longint;
begin
      readln(f,n);
      for i:=1 to n do readln(f,a[i]);
      QS(1,n);
end;
procedure       xuly;
var i:longint;
    a,b,c       :       int64;
begin
        a:=1;
        b:=1;
        i:=2;
        readln(f,n);
        while a+b<a[n] do
         begin
           c:=a+b;
           a:=b;
           b:=c;
           inc(i);
         end;

end;

begin

end.
