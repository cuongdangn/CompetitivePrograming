const   finp    =       'DAY.INP';
        fout    =       'DAY.OUT';
        maxc    =       trunc(1e11);
        maxn    =       10000000;
var     g,f     :       text;
        n,dau,cuoi       :       longint;
        a,d :       array[0..2*maxn+1] of longint;
        t       :array[0..2*maxn+1] of int64;
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
        for i:=1 to n do
          begin
                readln(f,a[i]);
                a[i+n]:=a[i];
          end;
        for i:=1 to 2*n do
          t[i]:=a[i]+t[i-1];
end;
procedure add(i:longint);
begin
        while (cuoi>=dau) and (t[d[cuoi]]>=t[i])do dec(cuoi);
        inc(cuoi);
        d[cuoi]:=i;
end;

procedure extract(i:longint);
begin
        if d[dau]<i-n+1 then inc(dau);
end;

procedure       xuly;
var     i,j,i1,j1:longint;
begin
        kq:=-maxc;
        dau:=1;cuoi:=1;
        d[1]:=0;
        for i:=1 to 2*n do
        begin
                add(i);
                if i>n then extract(i);
                if kq<t[i]-t[d[dau]] then
                        begin
                                i1:=d[dau]+1;
                                j1:=i;
                                kq:=t[i]-t[d[dau]];
                        end;
        end;
        writeln(g,j1-i1+1);
        for i:=i1 to j1 do
         if i>n then writeln(g,i-n) else writeln(g,i);
end;
procedure               xuly;
begin

end;
begin
        mo;
        doc;
        xuly;
        dong;
end.