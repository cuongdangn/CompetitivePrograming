const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        t,n     :       longint;
        kt:boolean;
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
procedure       doc;
var     i,j:longint;
        q:longint;
        kq:int64;
begin
        readln(f,t);
        for i:=1 to t do
                begin
                        readln(f,n);
                        kq:=0;
                        kt:=false;
                        for j:=1 to n do
                                begin
                                     read(f,q);
                                     if q>1 then kt:=true ;
                                     kq:=kq xor q;
                                end;
                        if kt=true then
                        if kq=0 then writeln(g,-1) else writeln(g,1)
                        else if kq=1 then writeln(g,-1) else writeln(g,1);
                        readln(f);
                end;
end;
begin
        mo;
        doc;
        dong;
end.
