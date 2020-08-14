var     n       :       longint;
        i,kq       :       longint;
        s       :  string;
        t       :  char;
begin
        readln(n);
        kq:=1;
        readln(s);
        t:=s[2];
        for i:=2 to n do
                begin
                        readln(s);
                        if s[1]=t then inc(kq);
                        t:=s[2];
                end;
        write(kq);
end.
