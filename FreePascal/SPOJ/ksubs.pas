const   finp    =       'ksubs.inp';
        fout    =       'ksubs.out';
var     g,f     :       text;
        k,n,m       :       longint;
        d       :       array[1..2000,1..2000] of longint;
        w       :       array[1..2000,1..2000,1..3] of longint;
        a,b     :       ansistring;
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
        readln(f,k);
        readln(f,a);
        readln(f,b);
        n:=length(a);
        m:=length(b);
        for i:=1 to n do
         for j:=1 to m do
          if a[i]=b[j] then
                d[i,j]:=d[i-1,j-1]+1;
end;
procedure       xuly;
var     i       :       longint;
