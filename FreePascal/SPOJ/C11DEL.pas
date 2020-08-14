const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        d       :       array[1..50000] of longint;
procedure       mo;
begin
        assign(f,finp);
        reset(f);
        assign(g,fout);
        rewrite(g);
end;
procedure      dong;
begin
        close(f);
        close(g);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        d[4]:=1;
        d[5]:=2;
        for i:=1