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
                        kq:=kq+int64(j)*int64(i)-i+1;
                end;
        writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.
