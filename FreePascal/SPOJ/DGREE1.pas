const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        x,y,k,b :       longint;
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
var     i:      longint;
begin
        readln(f,x,y,k,b);
