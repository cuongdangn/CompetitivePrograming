const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        d       :       array[1..20000001] of longint;
        sl      :       array[1..20000001] of longint;
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
procedure       init;
var     i,j     :       longint;
begin
        for i:=
procedure       doc;
var     i,j     :       longint;
begin
        while not seekeof(f) do
         begin
          readln(f,n);
          writeln(g,d[n]);
         end;
end;
begin
        mo;
        init;
        doc;
        dong
end.
