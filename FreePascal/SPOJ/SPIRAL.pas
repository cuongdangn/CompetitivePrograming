const   finp    =       'SPIRAL.INP';
        fout    =       'SPIRAL.OUT';
        base    =       trunc(1e9);
var     g,f     :       text;
        n,m     :       longint;
        d       :       array[1..1000,1..1000] of longint;
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
        readln(f,m,n);
end;
procedure       QHD;
var     i,j     :       longint;
begin
        for i:=1 to n do
         d[1,i]:=i;
        for i:=1 to m do
         d[i,1]:=i;
        for i:=2 to m do
         for j:=2 to n do
          d[i,j]:=(d[i-1][j]+d[i,j-1]+1) mod base;
         writeln(g,d[m,n] mod base);
end;
begin
        mo;
        doc;
        QHD;
        dong;
end.