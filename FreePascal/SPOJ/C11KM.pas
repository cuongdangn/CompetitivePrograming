uses    math;
const   finp    =       '';
        fout    =       '';
var     d       :       array[0..1001,0..1001] of int64;
        a       :       array[0..1001] of int64;
        f,g     :       text;
        n       :       longint;
        kq      :       int64;
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
var     i       :       longint;
begin
        readln(f,n);
        for i:=1 to n do readln(f,a[i]);
end;
procedure       QHD;
var     i,j     :       longint;
begin
        for i:=0 to n do
         for j:=0 to n do d[i,j]:=maxlongint*10000;
         d[0,0]:=0;
        for i:=1 to n do
         begin
          if a[i]<=100 then
           for j:=n-1 downto 0 do
            d[i,j]:=min(d[i-1,j+1],d[i-1,j]+a[i])
           else
            for j:=n downto 1 do
             d[i,j]:=min(d[i-1,j],d[i-1,j-1]+a[i]);
          end;
          kq:=maxlongint*1000000;
          for j:=0 to n do
           kq:=min(kq,d[n,j]);
           writeln(g,kq);
end;
begin
        mo;
        doc;
        if n<=0 then writeln(g,0)
        else
        QHD;
        dong;
end.
