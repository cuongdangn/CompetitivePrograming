const   finp    =       '';
        fout    =       '';
var     g,f     :       text;
        n,m     :       longint;
        a       :       array[1..30010] of longint;
procedure       mo;
begin
        assign(f,finp);reset(f);
        assign(g,fout);rewrite(g);
end;
procedure       dong;
begin
        close(f);
        close(g);
end;
procedure       doc;
var     i,j     :       longint;
begin
        readln(f,n,m);
        for i:=1 to n-1 do
         read(f,a[i]);i:=1;
        while (i<m) do
          i:=i+a[i];
        if i=m then writeln(g,'YES') else writeln(g,'NO');
end;
begin
        mo;
        doc;
        dong;
end.