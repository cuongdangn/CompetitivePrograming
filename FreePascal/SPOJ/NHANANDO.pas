function        nhan(a,b,c:int64):int64;
var     s,t       :       int64;
begin
        s:=0;t:=a;
        repeat
                if b mod 2=1 then s:=(s+t)mod c;
                t:=(t*2)mod c;
                b:=b div 2;
        until   b=0;
        exit(res);
end;

