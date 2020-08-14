var     a,b,c,d,n,i :       longint;
        ok      :       boolean;
begin
        readln(n);
        ok:=false;
        for i:=1 to n do
                begin
                        readln(a,b);
                        if abs(a mod 2 -b mod 2)=1 then ok:=true;
                        c:=a+c;
                        d:=d+b;
                end;
        if (c mod 2=0) and (d mod 2=0) then  write(0)
        else if abs(c mod 2 -d mod 2)=1 then write(-1)
        else if ok then write(1) else write(-1);
end.