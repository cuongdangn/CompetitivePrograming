var     n       :int64;
        kq      :       int64;
begin
        readln(n);
        if n mod 2=0 then  kq:=n div 2
        else kq:=(n-1) div 2-n;writeln(kq);
end.
