var     x,y,t     :       int64;
        a,b:longint;
procedure       xuly(n:int64);
var     k,t:int64;
begin
        k:=trunc(sqrt(n));t:=0;
        while k*k+t<n do inc(t);

        if t=0 then writeln(2*k-1);
        if (0<t)and(t<=k) then writeln(2*k)else
        if (0<t)and(t<=2*a) then writeln(2*a+1);
end;
begin
        readln(t);
        for a:=1 to t do
                begin
                        readln(x,y);
                        xuly(abs(x-y));
                end;

end.