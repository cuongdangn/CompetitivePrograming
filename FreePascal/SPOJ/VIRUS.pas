uses    math;
const   finp    =       'VIRUS.INP';
        fout    =       '';
var     g,f     :       text;
        n,kq    :       longint;
        p,a,id  :       array[1..3000] of longint;

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
         read(f,a[i]);
end;
procedure       xuly;
var     i,j,t     :       longint;
begin
        kq:=maxlongint;
        for i:=1 to n do
         for j:=1 to i-1 do
           if a[j]>a[i] then inc(p[i]);
        for i:=1 to n do
         begin
          for j:=1 to n do
           id[a[j]]:=j;
          t:=0;
          for j:=1 to n do t:=t+p[j];
          kq:=min(kq,t);
          for j:=n downto 1 do
           begin
             t:=t-n+2*id[j]-1;
             kq:=min(kq,t);
           end;
          /////////
          t:=a[n];
          for j:=n downto 2 do
           begin a[j]:=a[j-1];p[j]:=p[j-1] end;
          a[1]:=t;
          for j:=2 to n do
           if a[j]<a[1] then inc(p[j]);
          p[1]:=0;
         end;
         writeln(g,kq+2);
end;
begin
        mo;
        doc;
        xuly;
        dong;
end.

