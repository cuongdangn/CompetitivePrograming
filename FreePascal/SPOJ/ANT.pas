var
        m,n,p,an,am:qword;
begin
        readln(n);read(m);
        p:=n*m;
        an:=n+1;
        am:=m-1;
        while p>n do
                begin
                p:=p+(p-an) div am-n;
                end;
        write(p);
end.
