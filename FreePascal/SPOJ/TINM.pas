const   finp    =       '';
        fout    =       '';
type
var     g,f:text;
        a       :       array[1..1000] of string;
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
var