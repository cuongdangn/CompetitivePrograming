var     a:array[1..34] of int64;
        i,x       :       byte;
        t:integer;  res:int64;
function        xuly(x:longint):int64;
var  j:byte;y:int64;
begin
        j:=34;y:=x;
        while a[j]>y do dec(j);
        if j=0 then
        begin
                res:=-1;
                exit;
        end
        else
        begin
           y:=y-a[j];
           inc(res);
           if y>0 then xuly(y);
        end;
end;

begin
        a[1]:=2;
        a[2]:=3;
        a[3]:=5;
        for i:=4 to 34 do a[i]:=a[i-1]+a[i-2]+a[i-3];
        readln(t);
        for i:=1 to t do
                begin
                        readln(x);
                        res:=0;
                        xuly(x);
                        writeln('Case #',i,': ',res);
                end;
end.
