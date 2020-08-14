const   finp    =       'DNC.INP';
        fout    =       '';
var     i,j       :       longint;
        n,l,r,kq    :       longint;
        s       :array[0..1000] of int64;
        g,f     :       text;
begin
        assign(f,finp);
        reset(f);
        readln(f,n,l,r);
        for i:=1 to n do
                begin
                    read(f,j);
                    s[i]:=s[i-1]+j;
                end;
                close(f);
                assign(g,fout);
                rewrite(g);
        for i:=1 to n do
                for j:=0 to i-1 do
                        if(( s[i]-s[j])>=l)and((s[i]-s[j]) <=r) then
                                begin
                                        writeln(g,i,' ',j);
                                        inc(kq);
                                end;
                        writeln(g,kq);
                        close(g);
end.