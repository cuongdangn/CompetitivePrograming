const   finp    =       'SALE.INP';
        fout    =       'SALE.OUT';
var     g,f     :       text;
        n,p,k,kq        :       int64;
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
begin
        readln(f,n,k,p);
        kq:=p*k*(n div (k+1))+p*(n mod (k+1));
        writeln(g,kq);
end;
begin
        mo;
        doc;
        dong;
end.
