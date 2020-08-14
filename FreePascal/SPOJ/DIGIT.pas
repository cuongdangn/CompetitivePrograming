const   finp    =       'DIGIT.INP';
        fout    =       'DIGIT.OUT';
var     g,f     :       text;
        n,k     :       int64;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       xuly;
var        i:byte;t:int64;
begin
        readln(f,n);
        while n>2 do
        begin
                t:=2;
                for i:=2 to 32 do
                        begin
                                if t>=n then break;
                                t:=t*2;
                        end;
                n:=n-t div 2;
                inc(k);
        end;
        if k mod 2=1 then
                        if n=1 then writeln(g,0)
                        else writeln(g,1)
        else
                        if n=1 then writeln(g,1)
                        else writeln(g,0);
end;
begin
        mo;
        xuly;
        dong;
end.


