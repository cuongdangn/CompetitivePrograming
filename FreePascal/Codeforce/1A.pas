var     a,n,m,s,t,t1   :       int64;
begin
        readln(n,m,a);
        s:=n*m;
        t:=n div a;
        if n mod a<>0 then t:=t+1;
        t1:=m div a;
        if m mod a<>0 then t1:=t1+1;
        writeln(t*t1);
end.