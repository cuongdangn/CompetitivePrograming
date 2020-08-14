const   finp    =       'PERMUTATIONS.inp';
        fout    =       'PERMUTATIONS.out';
var     g,f     :       text;
        a       :       array[1..200000] of longint;
        k,j,n       :       longint;
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
procedure       xuly;
var     i,b       :       longint;
begin
        readln(f,n);
        for i:=1 to n do
                 read(f,a[i]);
                 readln(f);
        j:=1;
        k:=0;
        for i:=1 to n do
                begin
                      read(f,b);
                      if a[j]=b then inc(j) else inc(k);
                end;
        writeln(g,k);
end;
begin
        mo;
        xuly;
        dong;
end.
