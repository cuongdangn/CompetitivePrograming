uses    math  ;
const   finp    =       '';
        fout    =       '';
        maxn    =       trunc(1e5);
var     g,f     :       text;
        n       :       longint;
        d       :       array[0..1,0..maxn] of int64;
        a       :       array[1..maxn] of longint;
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
        for i:=1 to n do
         begin
          read(f,j);
          inc(a[j]);
         end;
        for i:=1 to 100000 do
          begin
            d[1][i]:=d[0][i-1]+int64(i)*int64(a[i]);
            d[0][i]:=max(d[1][i-1],d[0][i-1]);
          end;
        writeln(g,max(d[0][maxn],d[1][maxn]));
end;
begin
        mo;
        doc;
        dong;
end.