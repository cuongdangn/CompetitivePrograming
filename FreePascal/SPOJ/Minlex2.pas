const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        l,r,k   :       longint;
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
        while not seekeof(f) do
        begin
                readln(f,l,r,k);

