const   finp    =       'TEST.INP';
        fout    =       'TEST.OUT';
var     g,f     :       text;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure        dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i,j,n     :longint;
        kq      : int64;
begin
        readln(f,n);
        kq:=0;
        for i:=1 to n do
                begin
                        read(f,j);
                        if j<>1 then
                        kq:=kq+j+i-1
                        else kq:=kq+1;
                end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.