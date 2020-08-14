const   finp    =       'STANDING.INP';
        fout    =       'STANDING.OUT';
var     g,f     :       text;
        a,d     :       array[1..200] of longint;
        n,m,kq     :       longint;
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
        readln(f,n,m);
        for i:=1 to n do read(f,a[i]);
end;
procedure       xuly;
var     i,j     :       longint;
begin
        j:=a[1];
        while (j<=m)and((j=0)or(m mod j=0)) do begin inc(d[1]);inc(j); end;
        for i:=2 to n do
         begin
                j:=a[i];
                while  (j<a[i-1])and((j=0)or(m mod j=0)) do begin inc(d[i]); inc(j) end;
                if j=a[i-1] then d[i]:=d[i]+d[i-1];
         end;
         for i:=1 to n do kq:=kq+d[i];
         kq:=kq-n;
         writeln(g,kq);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.
