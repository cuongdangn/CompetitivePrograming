const   finp    =       'M.INP';
        fout    =       '';
var     g,f     :       text;
        n,kq       :       longint;
        d       :       array[0..50005,1..4] of longint;
        a,cs,b       :       array[0..50005] of longint;
        bit,bit1     :       array[1..55000,1..2] of longint;
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
var     i,j     :       longint;
begin
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
        for i:=1 to n-1 do if a[i]<a[i+1] then writeln(i);
end;
begin
        mo;
        doc;
        dong;
end.