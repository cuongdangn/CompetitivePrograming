const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        a       :
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
procedure