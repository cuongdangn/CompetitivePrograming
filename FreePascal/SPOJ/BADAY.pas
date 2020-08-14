const   finp    =       'BADAY.INP';
        fout    =       'BADAY.OUT';
var     g,f:    text;
        n,kq       :       longint;
        d,luu,res :       array[0..20000] of longint;
        a,b,c   :array[0..20000] of real;
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
var     i       :longint;
begin
        readln(f,n);
        for i:=1 to n do readln(f,a[i],b[i],c[i]);
end;
procedure       QHD;
var     i,j,t,q:longint;
begin
        for i:=1 to n do d[i]:=1;

        for i:=2 to n do
         begin
          t:=0;
          for j:=i-1 downto 1 do
                if (a[i]>=a[j])and(b[i]>=b[j])and(c[i]>=c[j]) then
                if d[j]>d[t] then t:=j;
                d[i]:=d[t]+1;
                luu[i]:=t;
                if kq<d[i] then
                        begin
                                kq:=d[i];
                                q:=i;
                        end;
          end;
          writeln(g,kq);
          t:=0;
          while q>0 do
                begin
                      inc(t);
                      res[t]:=q;
                      q:=luu[q];
                end;
          for i:=t downto 1 do write(g,res[i], ' ');
        end;
begin
      mo;
      doc;
      QHD;
      dong;
end.
