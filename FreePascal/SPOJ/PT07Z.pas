const   finp    =       '';
        fout    =       '';
        maxn    =       100000;
var     g,f     :       text;
        head    :       array[1..maxn+1] of longint;
        adj     :       array[1..maxn] of longint;
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